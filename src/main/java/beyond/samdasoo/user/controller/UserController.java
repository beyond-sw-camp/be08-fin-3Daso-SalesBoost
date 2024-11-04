package beyond.samdasoo.user.controller;

import beyond.samdasoo.common.exception.BaseException;
import beyond.samdasoo.common.response.BaseResponse;
import beyond.samdasoo.common.utils.CookieUtil;
import beyond.samdasoo.common.utils.JwtUtil;
import beyond.samdasoo.customer.dto.CustomersGetRes;
import beyond.samdasoo.potentialcustomer.dto.PotentialCustomersGetRes;
import beyond.samdasoo.user.dto.*;
import beyond.samdasoo.user.service.UserService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import static beyond.samdasoo.common.response.BaseResponseStatus.*;
import static beyond.samdasoo.common.utils.UserUtil.getLoginUserEmail;

@Tag(name = "User APIs", description = "유저 관련 API")
@RequiredArgsConstructor
@RequestMapping("/api/users")
@RestController
public class UserController {

    private final UserService userService;
    private final CookieUtil cookieUtil;

    /**
     * 회원가입 API
     */
    @Operation(summary = "회원가입", description = "유저 정보를 받아 회원가입을 진행한다")
    @PostMapping("/join")
    public BaseResponse<JoinUserRes> join(@RequestBody @Valid JoinUserReq joinUserReq) {
        validateInputEmptySignup(joinUserReq);
        validateEmailRegex(joinUserReq.getEmail());
        JoinUserRes result = userService.join(joinUserReq);
        return new BaseResponse<>(result);
    }


    /**
     * 유저 정보 조회 API
     */
    @Operation(summary = "유저 정보 조회", description = "현재 로그인한 유저 정보를 조회한다")
    @GetMapping("/my-info")
    public BaseResponse<UserDto> getUser() {
        String loginUserEmail = getLoginUserEmail();
        System.out.println(loginUserEmail);
        UserDto result = userService.getUser(loginUserEmail);

        return new BaseResponse<>(result);
    }

    /**
     * Access Token 재발급
     */
    @PostMapping("/reissue")
    public BaseResponse<String> reissue(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("Access Token reissue");
        Cookie cookie = cookieUtil.getCookie(request, JwtUtil.REFRESH_TOKEN_COOKIE_NAME);
        if (cookie == null) {
            throw new BaseException(JWT_INVALID_REFRESH_TOKEN);
        }
        ReIssueResult reissue = userService.reissue(cookie, request);
        Cookie newCookie = cookieUtil.createCookie(JwtUtil.REFRESH_TOKEN_COOKIE_NAME, reissue.getRefreshToken(), JwtUtil.refreshTokenExpireDuration / 1000);
        response.addCookie(newCookie);

        return new BaseResponse<>(reissue.getAccessToken());
    }

    @PostMapping("/reset-password-request")
    public BaseResponse<String> updatePasswordRequest(@RequestBody UpdatePasswordRequestReq updatePasswordRequestReq){

        userService.updatePasswordRequest(updatePasswordRequestReq.getEmail());

        return new BaseResponse<>("해당 이메일로 비밀번호 재설정 링크를 전송했습니다");

    }
    @PostMapping("/reset-password")
    public BaseResponse<String> updatePassword(@RequestBody UpdatePasswordReq updatePasswordReq){
        userService.updatePassword(updatePasswordReq);

        return new BaseResponse<>("비밀번호가 성공적으로 변경되었습니다");
    }

    /**
     * 로그아웃
     */
    @PostMapping("/logout")
    public BaseResponse<String> logout(HttpServletRequest request, HttpServletResponse response) {
        Cookie refreshCookie = cookieUtil.getCookie(request, JwtUtil.REFRESH_TOKEN_COOKIE_NAME);

        String message = userService.logout(refreshCookie);

        // 쿠키 제거
        Cookie cookie = cookieUtil.createCookie(JwtUtil.REFRESH_TOKEN_COOKIE_NAME, null, 0);
        response.addCookie(cookie);

        return new BaseResponse<>(message);

    }

    /**
     * 메일 인증 코드 전송
     */
    @PostMapping("/email/code-request")
    public BaseResponse<String> emailCodeRequest(@RequestBody SendEmailCodeReq req) {
        String email = req.getEmail();
        userService.sendEmailCode(email);

        return new BaseResponse<>("해당 이메일로 인증코드를 전송했습니다.");
    }

    /**
     * 메일 인증 코드 검증
     */
    @PostMapping("/email/code-check")
    public BaseResponse<String> emailCodeCheck(@RequestBody EmailCodeCheckReq req){


        validateEmailRegex(req.getEmail());

        userService.emailCodeVerification(req);

        return new BaseResponse<>("메일 인증에 성공하였습니다.");
    }

    @PostMapping("/upload")
    public BaseResponse<String> uploadImage(@RequestParam("file")MultipartFile file){
        String imageUrl = userService.uploadImage(file);
        return new BaseResponse<>(imageUrl);
    }


    /**
     * 유저 (영업사원) 목록 반환
     */
    @GetMapping
    public BaseResponse<List<UserDepartmentDto>> getUsers(){
        List<UserDepartmentDto> result = userService.getUsers();

        return new BaseResponse<>(result);
    }


    @GetMapping("/by-dept/{deptNo}")
    @Operation(summary = "부서별 유저 조회;", description = "해당 부서의 하위 모든 유저 조회")
    public BaseResponse<List<FilterUserDto>> getUsersByDepartmentAndSubDepartments(@PathVariable Long deptNo) {
        List<FilterUserDto> users = userService.getUsersByDepartmentAndSubDepartments(deptNo);
        return new BaseResponse<>(users);
    }

    @Operation(summary = "내 고객 목록 조회", description = "로그인한 영업사원이 담당하는 고객들 목록 조회")
    @GetMapping("/customers")
    public BaseResponse<List<CustomersGetRes>> getCustomers(){
        String loginUserEmail = getLoginUserEmail();
        List<CustomersGetRes> result = userService.getCustomers(loginUserEmail);
        return new BaseResponse<>(result);

    }

    @Operation(summary = "내 잠재고객 목록 조회", description = "로그인한 영업사원이 담당하는 잠재 고객들 목록 조회")
    @GetMapping("/pcustomers")
    public BaseResponse<List<PotentialCustomersGetRes>> getPCustomers(){
        String loginUserEmail = getLoginUserEmail();
        List<PotentialCustomersGetRes> result = userService.getPCustomers(loginUserEmail);
        return new BaseResponse<>(result);

    }


    private void validateInputEmptySignup(JoinUserReq req) {
        if (req.getEmail().isEmpty()) {
            throw new BaseException(EMAIL_EMPTY);
        }
        if (req.getPassword().isEmpty()) {
            throw new BaseException(PASSWORD_EMPTY);
        }
        if (req.getName().isEmpty()) {
            throw new BaseException(DEPT_EMPTY);
        }
        if (req.getDeptName().isEmpty()) {
            throw new BaseException(NAME_EMPTY);
        }

    }

    private void validateEmailRegex(String target) {
        String regex = "^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,6}$";
//        regex = "^[a-zA-Z0-9+-\\_.]+@[a-zA-Z0-9-]+\\.[a-zA-Z0-9-.]+$";
        Pattern pattern = Pattern.compile(regex, Pattern.CASE_INSENSITIVE);
        Matcher matcher = pattern.matcher(target);
        if (!matcher.find()) {
            throw new BaseException(EMAIL_REGEX_ERROR);
        }

    }
}
