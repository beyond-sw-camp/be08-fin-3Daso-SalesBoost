package beyond.samdasoo.user.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class LoginUserRes {

    private Long userNo;
    private Long deptNo;
    private String name;
    private String email;
    private UserRole role;
    private String profileUrl;
    private String accessToken;



}
