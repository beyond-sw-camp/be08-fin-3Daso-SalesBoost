package beyond.samdasoo.admin.repository;

import beyond.samdasoo.admin.entity.QSubProcess;
import beyond.samdasoo.admin.entity.SubProcess;
import com.querydsl.jpa.impl.JPAQueryFactory;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

@RequiredArgsConstructor
@Repository
public class SubProcessRepositoryImpl implements SubProcessRepositoryCustom {
    private final JPAQueryFactory queryFactory;

    @Override
    public SubProcess searchSubProcesses(Long procNo, String keyword) {
        QSubProcess subProcess = QSubProcess.subProcess;

        return queryFactory.selectFrom(subProcess)
                .where(
                        subProcess.process.processNo.eq(procNo)
                                .and(subProcess.subProcessName.contains(keyword))
                                .and(subProcess.progressStep.eq(keyword))
                )
                .fetchOne();
    }
}
