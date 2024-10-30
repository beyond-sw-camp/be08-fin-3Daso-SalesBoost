package beyond.samdasoo.admin.repository;

import beyond.samdasoo.admin.entity.Process;
import beyond.samdasoo.admin.entity.SubProcess;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface SubProcessRepositoryCustom {
    SubProcess searchSubProcesses(Long procNo, String keyword);
}
