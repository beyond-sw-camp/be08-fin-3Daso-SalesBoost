package beyond.samdasoo.admin.repository;

import beyond.samdasoo.admin.dto.TargetSalesStatusDto;
import beyond.samdasoo.admin.entity.QTargetSale;
import beyond.samdasoo.common.dto.SearchCond;
import beyond.samdasoo.user.repository.UserRepository;
import com.querydsl.core.BooleanBuilder;
import com.querydsl.jpa.impl.JPAQueryFactory;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

@Repository
@RequiredArgsConstructor
public class TargetSaleRepositoryImpl implements TargetSaleRepositoryCustom {
    private final JPAQueryFactory queryFactory;
    private final UserRepository userRepository;

    @Override
    public TargetSalesStatusDto findTargetSalesStatus(SearchCond searchCond) {
        QTargetSale targetSale = QTargetSale.targetSale;

        BooleanBuilder builder = new BooleanBuilder();

        if (searchCond.getDeptNo() != null && searchCond.getDeptNo() > 0) {
            List<Long> deptNos = userRepository.findAllSubDepartments(searchCond.getDeptNo());

            builder.and(targetSale.user.department.deptNo.in(deptNos));
        }

        if (searchCond.getUserNo() != null && searchCond.getUserNo() > 0) {
            builder.and(targetSale.user.id.eq(searchCond.getUserNo()));
        }

        LocalDate searchDate = searchCond.getSearchDate();

        int year = Integer.parseInt(String.valueOf(searchDate.getYear()));
        int month = Integer.parseInt(String.format("%02d", searchDate.getMonthValue()));

        Integer yearResult = queryFactory.select(targetSale.monthTarget.sum())
                .from(targetSale)
                .where(builder
                        .and(targetSale.year.eq(year))
                )
                .fetchOne();

        int yearSales = Optional.ofNullable(yearResult).orElse(0);

        Integer monthResult = queryFactory.select(targetSale.monthTarget.sum())
                .from(targetSale)
                .where(builder
                        .and(targetSale.month.eq(month))
                )
                .fetchOne();

        int monthSales = Optional.ofNullable(monthResult).orElse(0);

        return new TargetSalesStatusDto(monthSales, yearSales);
    }
}
