package beyond.samdasoo.user.dto;

import org.springframework.data.annotation.Id;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import org.springframework.data.redis.core.RedisHash;

@Getter
@Builder
@AllArgsConstructor
@RedisHash(value = "isVerified",timeToLive = 600000)
public class UpdatePasswordToken {

    @Id
    private String email;

    private String token;
}
