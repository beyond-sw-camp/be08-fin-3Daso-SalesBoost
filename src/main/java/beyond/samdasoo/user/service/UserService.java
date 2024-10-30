package beyond.samdasoo.user.service;

import beyond.samdasoo.admin.entity.Department;
import beyond.samdasoo.admin.repository.DepartmentRepository;
import beyond.samdasoo.calendar.entity.Calendar;
import beyond.samdasoo.calendar.repository.CalendarRepository;
import beyond.samdasoo.calendar.service.CalendarService;
import beyond.samdasoo.common.email.CertificationNumber;
import beyond.samdasoo.common.email.EmailProvider;
import beyond.samdasoo.common.email.EmailRepository;
import beyond.samdasoo.common.email.EmailVerificationUserRedisRepository;
import beyond.samdasoo.common.email.dto.EmailVerificationUser;
import beyond.samdasoo.common.exception.BaseException;
import beyond.samdasoo.common.jwt.JwtTokenProvider;
import beyond.samdasoo.common.jwt.service.RefreshTokenService;
import beyond.samdasoo.common.response.BaseResponse;
import beyond.samdasoo.customer.dto.CustomersGetRes;
import beyond.samdasoo.customer.entity.Customer;
import beyond.samdasoo.customer.repository.CustomerRepository;
import beyond.samdasoo.user.dto.*;
import beyond.samdasoo.user.entity.User;
import beyond.samdasoo.user.repository.UpdatePasswordTokenRedisRepository;
import beyond.samdasoo.user.repository.UserRepository;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.hibernate.sql.Update;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.*;

import static beyond.samdasoo.common.response.BaseResponseStatus.*;

@Slf4j
@RequiredArgsConstructor
@Service
public class UserService {
    private final BCryptPasswordEncoder encoder;
    private final UserRepository userRepository;
    private final JwtTokenProvider jwtTokenProvider;
    private final DepartmentRepository departmentRepository;
    private final RefreshTokenService refreshTokenService;
    private final EmailProvider emailProvider;
    private final EmailRepository emailRepository;
    private final EmailVerificationUserRedisRepository emailVerificationUserRedisRepository;
    private final CalendarService calendarService;
    private final CustomerRepository customerRepository;
    private final UpdatePasswordTokenRedisRepository updatePasswordTokenRedisRepository;

    @Value("${frontend.origin}")
    private String frontOrigin;


    public JoinUserRes join(JoinUserReq joinUserReq) {

        Optional<EmailVerificationUser> getEmailVerificationUser = emailVerificationUserRedisRepository.findById(joinUserReq.getEmail());
        if (!getEmailVerificationUser.isPresent() || !getEmailVerificationUser.get().getIsVerified()) {
            throw new BaseException(EMAIL_NOT_VERIFICATED);
        }

        Optional<User> byEmail = userRepository.findByEmail(joinUserReq.getEmail());
        if (byEmail.isPresent()) {
            throw new BaseException(EMAIL_ALREADY_EXIST);
        }

        Department department = departmentRepository.findByDeptName(joinUserReq.getDeptName())
                .orElseThrow(() -> new BaseException(DEPARTMENT_NOT_EXIST));

        User newUser = joinUserReq.toUser(encoder.encode(joinUserReq.getPassword()), generateEmployeeId(), department);

        User saveUser = userRepository.save(newUser);

        // 사용자 가입 시 캘린더 생성
        calendarService.createCalendar(saveUser);

        return new JoinUserRes(saveUser.getEmployeeId());
    }


    public UserDto getUser(String email) {
        //   User findUser = userRepository.findById(userId).orElseThrow(()->new BaseException(USER_NOT_EXIST));
        User findUser = userRepository.findByEmail(email).orElseThrow(() -> new BaseException(USER_NOT_EXIST));

        return new UserDto(findUser.getName(), findUser.getEmail(),findUser.getEmployeeId(),
                findUser.getDepartment().getDeptName(),findUser.getJoinDate());
    }


    private String generateEmployeeId() {
        // 사번 생성 : 회원가입 날짜(년월) + 가입 순서
        LocalDate today = LocalDate.now();
        String datePrefix = today.format(DateTimeFormatter.ofPattern("yyyyMMdd"));
        // 오늘 날짜에 해당하는 마지막 사번 조회 (없으면 0부터 시작)
        int countForToday = userRepository.countByJoinDate(today);
        int nextSequence = countForToday + 1;

        String employeeId = datePrefix + String.format("%03d", nextSequence);
        log.info("Generated employee id {}", employeeId);
        return employeeId;
    }


    // 토큰 재발급
    public ReIssueResult reissue(Cookie refreshTokenCookie, HttpServletRequest request) {
        String refreshToken = refreshTokenCookie.getValue();

        //  리프레시 토큰이 유효한 경우 액세스토큰, 리프레시 토큰 모두 재발급
        if (jwtTokenProvider.validateToken(refreshToken, request)) {

            String userEmail = jwtTokenProvider.getEmail(refreshToken);
            String role = jwtTokenProvider.getRole(refreshToken);

//            boolean exists = refreshTokenService.existsByEmailAndToken(userEmail, refreshToken);
//            if(!exists){
//                throw new BaseException(JWT_INVALID_REFRESH_TOKEN_IN_REDIS);
//            }

            refreshTokenService.deleteByEmailAndToken(userEmail, refreshToken);
            refreshTokenService.saveToken(userEmail, refreshToken);

            String refresh = jwtTokenProvider.createToken(userEmail, role, "REFRESH");
            String access = jwtTokenProvider.createToken(userEmail, role, "ACCESS");


            return new ReIssueResult(access, refresh);

        }
        throw new BaseException(JWT_INVALID_REFRESH_TOKEN);
    }

    public String logout(Cookie refreshCookie) {
        final String LOGOUT_RESULT = "로그아웃 완료";

        if (refreshCookie == null) {
            return LOGOUT_RESULT;
        }

        String refreshToken = refreshCookie.getValue();

        String userEmail = jwtTokenProvider.getEmail(refreshToken);

        // 캐시에서 토큰 제거
        refreshTokenService.deleteByEmailAndToken(userEmail, refreshToken);

        return LOGOUT_RESULT;

    }

    public void sendEmailCode(String email) {
        boolean exists = userRepository.existsByEmail(email);

        if (exists) {
            throw new BaseException(EMAIL_ALREADY_EXIST);
        }

        String certificationNumber = CertificationNumber.getCertificationNumber();
        boolean isSucceed = emailProvider.sendCertificationMail(email, certificationNumber);

        if (!isSucceed) {
            throw new BaseException(FAIL_SEND_CODE);
        }

        emailRepository.saveEmailCode(email, certificationNumber);
    }


    public boolean emailCodeVerification(EmailCodeCheckReq req) {

        //  이미 인증된 경우에는 통과
        Optional<EmailVerificationUser> getEmailVerificationUser = emailVerificationUserRedisRepository.findById(req.getEmail());
        if (getEmailVerificationUser.isPresent() && getEmailVerificationUser.get().getIsVerified()) {
            return true;
        }

        // 발급한 인증코드와 동일한지 검증
        boolean exist = emailRepository.checkEmailCertificationNumber(req.getEmail(), req.getCode());

        if (!exist) {
            throw new BaseException(EMAIL_OR_CODE_NOT_FOUND);
        }

        emailRepository.deleteEmailCode(req.getEmail());

        EmailVerificationUser emailVerificationUser = EmailVerificationUser.builder()
                .email(req.getEmail())
                .isVerified(true)
                .build();

        emailVerificationUserRedisRepository.save(emailVerificationUser);

        return true;
    }


    public List<UserDepartmentDto> getUsers() {
        //        for (UserDepartmentDto dto :users){
//            System.out.println(dto.getUserName()+" : ("+dto.getUserDeptName()+")");
//        }
        return userRepository.findAllUsersWithDepartmentNames();
    }

    public List<FilterUserDto> getUsersByDepartmentAndSubDepartments(Long deptNo) {
        return userRepository.findUsersByDepartmentAndSubDepartments(deptNo);
    }

    public List<CustomersGetRes> getCustomers(String loginUserEmail) {
        User user = userRepository.findByEmail(loginUserEmail).get();
        List<Customer> customers = customerRepository.findCustomersByUser(user);

        return customers.stream().map(c -> new CustomersGetRes(c.getId(), c.getName(), c.getPosition(), c.getCompany(),
                c.getEmail(), c.getPhone(), c.getTel(),c.getUser().getName(),c.getGrade().getMessage(),
                c.isKeyMan()
        )).toList();

    }

    public void updatePasswordRequest(String email) {

        boolean exists = userRepository.existsByEmail(email);
        if(!exists){
            throw new BaseException(EMAIL_NOT_EXIST);
        }

        String token = UUID.randomUUID().toString();

        String link = frontOrigin + "/auth/change-password?email=" + email + "&token=" + token;

        boolean isSucceed = emailProvider.sendFindPasswordMail(email, link);

        if(!isSucceed){
            throw new BaseException(FAIL_SEND_UPDATE_PASSWORD_LINK);
        }

        UpdatePasswordToken updatePasswordToken = UpdatePasswordToken.builder()
                .email(email)
                .token(token)
                .build();

        updatePasswordTokenRedisRepository.save(updatePasswordToken);
    }

    @Transactional
    public void updatePassword(UpdatePasswordReq updatePasswordReq) {
        String email = updatePasswordReq.getEmail();
        String token = updatePasswordReq.getToken();
        String newPassword = updatePasswordReq.getNewPwd();

        UpdatePasswordToken updatePasswordToken = updatePasswordTokenRedisRepository.findById(email).orElseThrow(
                ()-> new BaseException(FAIL_EXPIRE_TIME));

        if(!token.equals(updatePasswordToken.getToken())){
            updatePasswordTokenRedisRepository.deleteById(email); // 악의적인 요청 예방을 위해 아예 삭제
            throw new BaseException(FAIL_UPDATE_PASSWORD);
        }

        // 비번 변경
        User user = userRepository.findByEmail(email).orElseThrow(() -> new BaseException(EMAIL_NOT_EXIST));
        user.changePassword(encoder.encode(newPassword));

        updatePasswordTokenRedisRepository.deleteById(email); // 저장된 토큰값 날림
    }
}
