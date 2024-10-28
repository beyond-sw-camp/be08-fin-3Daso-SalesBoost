package beyond.samdasoo.act.repository;

import beyond.samdasoo.act.entity.Act;
import beyond.samdasoo.lead.Entity.Lead;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ActRepository extends JpaRepository<Act, Long>, ActRepositoryCustom {
    List<Act> findByLeadOrderByActDateDesc(Lead lead);
}
