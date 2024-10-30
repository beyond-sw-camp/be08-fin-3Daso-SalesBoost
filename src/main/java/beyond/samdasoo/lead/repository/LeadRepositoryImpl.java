package beyond.samdasoo.lead.repository;

import beyond.samdasoo.common.dto.SearchCond;
import beyond.samdasoo.customer.entity.QCustomer;
import beyond.samdasoo.lead.Entity.QLead;
import beyond.samdasoo.lead.dto.LeadStatusDto;
import beyond.samdasoo.user.repository.UserRepository;
import com.querydsl.core.BooleanBuilder;
import com.querydsl.core.types.Projections;
import com.querydsl.jpa.impl.JPAQueryFactory;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.List;

@Repository
@RequiredArgsConstructor
public class LeadRepositoryImpl implements LeadRepositoryCustom{
    private final JPAQueryFactory queryFactory;
    private final UserRepository userRepository;

    @Override
    public List<LeadStatusDto> findLeadStatusGroupedByStatus(SearchCond searchCond) {
        QLead lead = QLead.lead;
        QCustomer customer = QCustomer.customer;

        BooleanBuilder builder = new BooleanBuilder();

        if (searchCond.getSearchDate() != null) {
            builder.and(lead.startDate.loe(searchCond.getSearchDate()));
        }

        if (searchCond.getDeptNo() != null && searchCond.getDeptNo() > 0) {
            List<Long> deptNos = userRepository.findAllSubDepartments(searchCond.getDeptNo());

            builder.and(customer.user.department.deptNo.in(deptNos));
        }

        if (searchCond.getUserNo() != null && searchCond.getUserNo() > 0) {
            builder.and(customer.user.id.eq(searchCond.getUserNo()));
        }

        return queryFactory
                .select(Projections.constructor(LeadStatusDto.class,
                        lead.status,
                        lead.count().as("count")
                ))
                .from(lead)
                .join(lead.customer, customer)
                .where(builder)
                .groupBy(lead.status)
                .fetch();
    }
}
