package beyond.samdasoo.customer.repository;

import beyond.samdasoo.common.dto.SearchCond;
import beyond.samdasoo.customer.dto.PopupCustomerGetRes;
import beyond.samdasoo.customer.dto.SearchCriteriaDTO;
import beyond.samdasoo.customer.entity.QCustomer;
import beyond.samdasoo.user.repository.UserRepository;
import com.querydsl.core.BooleanBuilder;
import com.querydsl.core.types.Projections;
import com.querydsl.jpa.impl.JPAQueryFactory;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.time.LocalTime;
import java.util.List;
import java.util.Objects;

@Repository
@RequiredArgsConstructor
public class CustomerRepositoryImpl implements CustomerRepositoryCustom {
    private final JPAQueryFactory queryFactory;
    private final UserRepository userRepository;

    @Override
    public List<PopupCustomerGetRes> searchCustomers(SearchCriteriaDTO searchCriteriaDTO) {
        QCustomer customer = QCustomer.customer;

        BooleanBuilder builder = new BooleanBuilder();

        if (searchCriteriaDTO.getDeptNo() != null && searchCriteriaDTO.getDeptNo() > 0) {
            List<Long> deptNos = userRepository.findAllSubDepartments(searchCriteriaDTO.getDeptNo());

            builder.and(customer.user.department.deptNo.in(deptNos));
        }

        if (searchCriteriaDTO.getUserNo() != null && searchCriteriaDTO.getUserNo() > 0) {
            builder.and(customer.user.id.eq(searchCriteriaDTO.getUserNo()));
        }

        if (searchCriteriaDTO.getSearchQuery() != null && !searchCriteriaDTO.getSearchQuery().isEmpty()) {
            builder.and(customer.name.contains(searchCriteriaDTO.getSearchQuery()).or(customer.company.contains(searchCriteriaDTO.getSearchQuery())));
        }

        return queryFactory
                .select(Projections.constructor(PopupCustomerGetRes.class,
                        customer.id,
                        customer.name,
                        customer.company,
                        customer.dept,
                        customer.position,
                        customer.user.name
                ))
                .from(customer)
                .where(builder)
                .fetch();
    }

    @Override
    public long getCustomerCount(SearchCond searchCond) {
        QCustomer customer = QCustomer.customer;

        BooleanBuilder builder = new BooleanBuilder();

        if (searchCond.getSearchDate() != null) {
            builder.and(customer.createdAt.loe(searchCond.getSearchDate().atTime(LocalTime.MAX)));
        }

        if (searchCond.getDeptNo() != null && searchCond.getDeptNo() > 0) {
            List<Long> deptNos = userRepository.findAllSubDepartments(searchCond.getDeptNo());

            builder.and(customer.user.department.deptNo.in(deptNos));
        }

        if (searchCond.getUserNo() != null && searchCond.getUserNo() > 0) {
            builder.and(customer.user.id.eq(searchCond.getUserNo()));
        }

        Long result = queryFactory
                .select(customer.count())
                .from(customer)
                .where(builder)
                .fetchOne();

        return Objects.requireNonNullElse(result, 0L);
    }
}
