package beyond.samdasoo.act.repository;

import beyond.samdasoo.act.dto.ActStatusDto;
import beyond.samdasoo.act.entity.QAct;
import beyond.samdasoo.common.dto.SearchCond;
import beyond.samdasoo.customer.entity.QCustomer;
import beyond.samdasoo.lead.Entity.QLead;
import beyond.samdasoo.user.repository.UserRepository;
import com.querydsl.core.BooleanBuilder;
import com.querydsl.jpa.impl.JPAQueryFactory;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Objects;

@Repository
@RequiredArgsConstructor
public class ActRepositoryImpl implements ActRepositoryCustom {
    private final JPAQueryFactory queryFactory;
    private final UserRepository userRepository;

    @Override
    public ActStatusDto findActStatus(SearchCond searchCond) {
        QAct act = QAct.act;
        QLead lead = QLead.lead;
        QCustomer customer = QCustomer.customer;

        BooleanBuilder builder = new BooleanBuilder();

        if (searchCond.getSearchDate() != null) {
            builder.and(act.actDate.loe(searchCond.getSearchDate()));
        }

        if (searchCond.getDeptNo() != null && searchCond.getDeptNo() > 0) {
            List<Long> deptNos = userRepository.findAllSubDepartments(searchCond.getDeptNo());

            builder.and(customer.user.department.deptNo.in(deptNos));
        }

        if (searchCond.getUserNo() != null && searchCond.getUserNo() > 0) {
            builder.and(customer.user.id.eq(searchCond.getUserNo()));
        }

        Long planCount = queryFactory
                .select(act.count())
                .from(act)
                .join(act.lead, lead)
                .join(lead.customer, customer)
                .where(builder)
                .fetchOne();

        long planCnt = Objects.requireNonNullElse(planCount, 0L);

        Long completeCount = queryFactory
                .select(act.count())
                .from(act)
                .join(act.lead, lead)
                .join(lead.customer, customer)
                .where(builder
                        .and(act.completeYn.eq("Y"))
                )
                .fetchOne();

        long completeCnt = Objects.requireNonNullElse(completeCount, 0L);

        long completePercent = planCnt > 0 ? (completeCnt * 100) / planCnt : 0;

        return new ActStatusDto(planCnt, completeCnt, completePercent);
    }
}
