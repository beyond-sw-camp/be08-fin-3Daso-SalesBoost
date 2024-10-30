package beyond.samdasoo.user.repository;

import beyond.samdasoo.user.dto.UpdatePasswordToken;
import org.springframework.data.repository.CrudRepository;

public interface UpdatePasswordTokenRedisRepository extends CrudRepository<UpdatePasswordToken,String> {
}
