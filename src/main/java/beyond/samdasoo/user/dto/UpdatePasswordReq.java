package beyond.samdasoo.user.dto;

import lombok.Getter;

@Getter
public class UpdatePasswordReq {
    private String email;
    private String token;
    private String newPwd;
}
