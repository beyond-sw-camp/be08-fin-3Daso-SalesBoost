package beyond.samdasoo.user.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;

//@Builder
@Getter
@AllArgsConstructor
public class LoginUserRes {

    private String accessToken;
    private String name;
    private String email;
    private UserRole role;


}
