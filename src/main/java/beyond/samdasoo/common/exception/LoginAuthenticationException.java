package beyond.samdasoo.common.exception;

import beyond.samdasoo.common.exception.BaseException;
import lombok.Getter;
import org.springframework.security.core.AuthenticationException;

@Getter
public class CustomAuthenticationException extends AuthenticationException {
    private final BaseException baseException;

    public CustomAuthenticationException(BaseException baseException) {
        super(baseException.getStatus().getMessage());
        this.baseException = baseException;
    }

}
