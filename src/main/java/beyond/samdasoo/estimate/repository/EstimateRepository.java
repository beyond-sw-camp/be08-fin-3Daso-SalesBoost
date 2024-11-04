package beyond.samdasoo.estimate.repository;

import beyond.samdasoo.estimate.entity.Estimate;
import org.springframework.data.jpa.repository.JpaRepository;

import java.time.LocalDate;
import java.util.List;

public interface EstimateRepository extends JpaRepository<Estimate, Long>, EstimateRepositoryCustom {

}
