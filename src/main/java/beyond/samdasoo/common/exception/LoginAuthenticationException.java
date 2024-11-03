package beyond.samdasoo.common.exception;

import lombok.Getter;
import org.springframework.security.core.AuthenticationException;

@Getter
public class LoginAuthenticationException extends AuthenticationException {
    private final BaseException baseException;

    public LoginAuthenticationException(BaseException baseException) {
        super(baseException.getStatus().getMessage());
        this.baseException = baseException;
    }

}
