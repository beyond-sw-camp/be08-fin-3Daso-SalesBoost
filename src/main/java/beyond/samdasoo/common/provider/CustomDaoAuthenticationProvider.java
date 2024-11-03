package beyond.samdasoo.common.provider;

import beyond.samdasoo.common.exception.LoginAuthenticationException;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetails;

public class CustomDaoAuthenticationProvider extends DaoAuthenticationProvider {

    @Override
    protected void additionalAuthenticationChecks(UserDetails userDetails, UsernamePasswordAuthenticationToken authentication) throws AuthenticationException {
        try {
            super.additionalAuthenticationChecks(userDetails, authentication);
        } catch (AuthenticationException ex) {
            if (ex instanceof LoginAuthenticationException) {
                throw ex; // CustomAuthenticationException 은 그대로 던짐
            } else {
                throw new InternalAuthenticationServiceException(ex.getMessage(), ex); // 다른 예외는 그대로 처리
            }
        }
    }
}
