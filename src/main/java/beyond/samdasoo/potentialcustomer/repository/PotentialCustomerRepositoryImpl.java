package beyond.samdasoo.potentialcustomer.repository;

import beyond.samdasoo.common.dto.SearchCond;
import beyond.samdasoo.potentialcustomer.entity.QPotentialCustomer;
import beyond.samdasoo.user.repository.UserRepository;
import com.querydsl.core.BooleanBuilder;
import com.querydsl.jpa.impl.JPAQueryFactory;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;
import java.util.Objects;

@Repository
@RequiredArgsConstructor
public class PotentialCustomerRepositoryImpl implements PotentialCustomerRepositoryCustom {
    private final JPAQueryFactory queryFactory;
    private final UserRepository userRepository;

    @Override
    public long getPotentialCustomerCount(SearchCond searchCond) {
        QPotentialCustomer potentialCustomer = QPotentialCustomer.potentialCustomer;

        BooleanBuilder builder = new BooleanBuilder();

        if (searchCond.getSearchDate() != null) {
            builder.and(potentialCustomer.createdAt.loe(searchCond.getSearchDate().atTime(LocalTime.MAX)));
        }

//        if (searchCond.getDeptNo() != null && searchCond.getDeptNo() > 0) {
//            List<Long> deptNos = userRepository.findAllSubDepartments(searchCond.getDeptNo());
//
//            builder.and(potentialCustomer.user.department.deptNo.in(deptNos));
//        }
//
//        if (searchCond.getUserNo() != null && searchCond.getUserNo() > 0) {
//            builder.and(potentialCustomer.user.id.eq(searchCond.getUserNo()));
//        }

        Long result = queryFactory
                .select(potentialCustomer.count())
                .from(potentialCustomer)
                .where(builder)
                .fetchOne();

        return Objects.requireNonNullElse(result, 0L);
    }
}
