package beyond.samdasoo.lead.repository;

import beyond.samdasoo.common.dto.SearchCond;
import beyond.samdasoo.customer.entity.QCustomer;
import beyond.samdasoo.lead.Entity.AwarePath;
import beyond.samdasoo.lead.Entity.Lead;
import beyond.samdasoo.lead.Entity.LeadStatus;
import beyond.samdasoo.lead.Entity.QLead;
import beyond.samdasoo.lead.dto.*;
import beyond.samdasoo.user.repository.UserRepository;
import com.querydsl.core.BooleanBuilder;
import com.querydsl.core.Tuple;
import com.querydsl.core.types.Projections;
import com.querydsl.core.types.dsl.Expressions;
import com.querydsl.jpa.impl.JPAQueryFactory;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Repository
@RequiredArgsConstructor
public class LeadRepositoryImpl implements LeadRepositoryCustom {
    private final JPAQueryFactory queryFactory;
    private final UserRepository userRepository;

    QLead lead = QLead.lead;
    QCustomer customer = QCustomer.customer;
    BooleanBuilder builder;

    @Override
    public List<LeadResponseDto> findFilteredLeads(LeadSearchCond searchCond) {
        builder = new BooleanBuilder();

        if (searchCond.getStartDate() != null) {
            builder.and(lead.startDate.goe(searchCond.getStartDate()));
        }

        if (searchCond.getEndDate() != null) {
            builder.and(lead.endDate.loe(searchCond.getEndDate()));
        }

        if (searchCond.getStatus() != null) {
            builder.and(lead.status.eq(searchCond.getStatus()));
        }

        if (searchCond.getProcess() != null && searchCond.getProcess() > 0) {
            builder.and(lead.process.eq(searchCond.getProcess()));
        }

        if (searchCond.getSubProcess() != null && searchCond.getSubProcess() > 0) {
            builder.and(lead.subProcess.eq(searchCond.getSubProcess()));
        }

        if (searchCond.getDeptNo() != null && searchCond.getDeptNo() > 0) {
            List<Long> deptNos = userRepository.findAllSubDepartments(searchCond.getDeptNo());

            builder.and(customer.user.department.deptNo.in(deptNos));
        }

        if (searchCond.getUserNo() != null && searchCond.getUserNo() > 0) {
            builder.and(customer.user.id.eq(searchCond.getUserNo()));
        }

        List<Lead> leads = queryFactory
                .selectFrom(lead)
                .where(builder)  // 동적 조건
                .fetch();

        return leads.stream()
                .map(LeadResponseDto::new)
                .collect(Collectors.toList());
    }

    @Override
    public List<LeadStatusDto> findLeadStatusGroupedByStatus(SearchCond searchCond) {
        List<LeadStatusDto> results;
        builder = new BooleanBuilder();

        if (searchCond.getSearchDate() != null) {
            builder.and(lead.endDate.loe(searchCond.getSearchDate()));
        }

        if (searchCond.getStartDate() != null) {
            builder.and(lead.endDate.goe(searchCond.getStartDate()));
        }

        if (searchCond.getEndDate() != null) {
            builder.and(lead.endDate.lt(searchCond.getEndDate()));
        }

        if (searchCond.getDeptNo() != null && searchCond.getDeptNo() > 0) {
            List<Long> deptNos = userRepository.findAllSubDepartments(searchCond.getDeptNo());

            builder.and(customer.user.department.deptNo.in(deptNos));
        }

        if (searchCond.getUserNo() != null && searchCond.getUserNo() > 0) {
            builder.and(customer.user.id.eq(searchCond.getUserNo()));
        }

        results = queryFactory
                .select(Projections.constructor(LeadStatusDto.class,
                        lead.status,
                        lead.count().as("count"),
                        Expressions.numberTemplate(Integer.class, "floor({0} / 1000)", lead.expSales.sum().coalesce(0L))
                ))
                .from(lead)
                .join(lead.customer, customer)
                .where(builder)
                .groupBy(lead.status)
                .fetch();

        List<LeadStatusDto> completeResults = new ArrayList<>();

        long totalCnt = results.stream().mapToLong(LeadStatusDto::getCount).sum();
        int totalAmt = results.stream().mapToInt(LeadStatusDto::getAmt).sum();

        for (LeadStatus status : LeadStatus.values()) {
            completeResults.add(
                    results.stream()
                            .filter(dto -> dto.getStatus() == status)
                            .findFirst()
                            .orElse(new LeadStatusDto(status, 0L, 0))
            );
        }

        completeResults.addFirst(new LeadStatusDto(null, totalCnt, totalAmt));

        return completeResults;
    }

    @Override
    public MonthResponseDto findMonthlyLeadData(SearchCond searchCond) {
        builder = new BooleanBuilder();

        if (searchCond.getStartDate() != null) {
            builder.and(lead.endDate.goe(searchCond.getStartDate()));
        }

        if (searchCond.getEndDate() != null) {
            builder.and(lead.endDate.lt(searchCond.getEndDate()));
        }

        if (searchCond.getDeptNo() != null && searchCond.getDeptNo() > 0) {
            List<Long> deptNos = userRepository.findAllSubDepartments(searchCond.getDeptNo());

            builder.and(customer.user.department.deptNo.in(deptNos));
        }

        if (searchCond.getUserNo() != null && searchCond.getUserNo() > 0) {
            builder.and(customer.user.id.eq(searchCond.getUserNo()));
        }

        List<Tuple> salesData = queryFactory
                .select(lead.endDate.month(), Expressions.numberTemplate(Integer.class, "floor({0} / 1000)", lead.expSales.sum().coalesce(0L)))
                .from(lead)
                .where(builder.and(
                        lead.endDate.year().eq(searchCond.getStartDate().getYear()))
                )
                .groupBy(lead.endDate.month())
                .fetch();

        List<Tuple> profitData = queryFactory
                .select(lead.endDate.month(), Expressions.numberTemplate(Integer.class, "floor({0} / 1000)", lead.expProfit.sum().coalesce(0L)))
                .from(lead)
                .where(builder.and(
                        lead.endDate.year().eq(searchCond.getEndDate().getYear()))
                )
                .groupBy(lead.endDate.month())
                .fetch();

        List<Tuple> leadCountData = queryFactory
                .select(lead.endDate.month(), lead.count().intValue())
                .from(lead)
                .where(builder.and(
                        lead.endDate.year().eq(searchCond.getStartDate().getYear()))
                )
                .groupBy(lead.endDate.month())
                .fetch();

        List<Integer> monthExpSales = initializeMonthlyData();
        List<Integer> monthExpProfit = initializeMonthlyData();
        List<Integer> monthLeadCount = initializeMonthlyData();

        salesData.forEach(tuple -> monthExpSales.set(tuple.get(lead.endDate.month()) - 1, tuple.get(1, Integer.class)));
        profitData.forEach(tuple -> monthExpProfit.set(tuple.get(lead.endDate.month()) - 1, tuple.get(1, Integer.class)));
        leadCountData.forEach(tuple -> monthLeadCount.set(tuple.get(lead.endDate.month()) - 1, tuple.get(1, Integer.class)));

        int totalSales = 0;
        int totalProfit = 0;
        int totalLeadCount = 0;

        for (Integer month : monthExpSales) {
            totalSales += month;
        }

        for (Integer month : monthExpProfit) {
            totalProfit += month;
        }

        for (Integer month : monthLeadCount) {
            totalLeadCount += month;
        }

        return new MonthResponseDto(monthExpSales, monthExpProfit, monthLeadCount, totalSales, totalProfit, totalLeadCount);
    }

    @Override
    public List<SuccessChartDto> findSuccessData(SearchCond searchCond) {
        builder = new BooleanBuilder();

        if (searchCond.getStartDate() != null) {
            builder.and(lead.endDate.goe(searchCond.getStartDate()));
        }

        if (searchCond.getEndDate() != null) {
            builder.and(lead.endDate.lt(searchCond.getEndDate()));
        }

        if (searchCond.getDeptNo() != null && searchCond.getDeptNo() > 0) {
            List<Long> deptNos = userRepository.findAllSubDepartments(searchCond.getDeptNo());

            builder.and(customer.user.department.deptNo.in(deptNos));
        }

        if (searchCond.getUserNo() != null && searchCond.getUserNo() > 0) {
            builder.and(customer.user.id.eq(searchCond.getUserNo()));
        }

        return queryFactory
                .select(new QSuccessChartDto(
                        lead.successPer,
                        lead.count()
                ))
                .from(lead)
                .where(builder)
                .groupBy(lead.successPer)
                .fetch();
    }

    @Override
    public List<AwarePathResponseDto> findLeadDataByAwarePath(SearchCond searchCond) {
        builder = new BooleanBuilder();

        if (searchCond.getStartDate() != null) {
            builder.and(lead.endDate.goe(searchCond.getStartDate()));
        }

        if (searchCond.getEndDate() != null) {
            builder.and(lead.endDate.lt(searchCond.getEndDate()));
        }

        if (searchCond.getDeptNo() != null && searchCond.getDeptNo() > 0) {
            List<Long> deptNos = userRepository.findAllSubDepartments(searchCond.getDeptNo());

            builder.and(customer.user.department.deptNo.in(deptNos));
        }

        if (searchCond.getUserNo() != null && searchCond.getUserNo() > 0) {
            builder.and(customer.user.id.eq(searchCond.getUserNo()));
        }

        List<AwarePathResponseDto> results = queryFactory
                .select(
                        new QAwarePathResponseDto(
                                lead.awarePath,
                                lead.expSales.sum(),
                                lead.expProfit.sum(),
                                lead.count()
                        )
                )
                .from(lead)
                .where(builder)
                .groupBy(lead.awarePath)
                .fetch();

        List<AwarePathResponseDto> completeResults = new ArrayList<>();
        for (AwarePath path : AwarePath.values()) {
            completeResults.add(
                    results.stream()
                            .filter(dto -> dto.getAwarePath() == path)
                            .findFirst()
                            .orElse(new AwarePathResponseDto(path, 0L, 0L, 0L))
            );
        }

        return completeResults;
    }

    private List<Integer> initializeMonthlyData() {
        List<Integer> data = new ArrayList<>();
        for (int i = 0; i < 12; i++) {
            data.add(0);
        }
        return data;
    }
}
