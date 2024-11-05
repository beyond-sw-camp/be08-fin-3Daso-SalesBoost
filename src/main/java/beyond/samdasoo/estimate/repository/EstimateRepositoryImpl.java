package beyond.samdasoo.estimate.repository;

import beyond.samdasoo.contract.entity.QContract;
import beyond.samdasoo.customer.entity.QCustomer;
import beyond.samdasoo.estimate.dto.EstimateResponseDto;
import beyond.samdasoo.estimate.dto.EstimateSearchDto;
import beyond.samdasoo.estimate.dto.QEstimateResponseDto;
import beyond.samdasoo.estimate.entity.Estimate;
import beyond.samdasoo.estimate.entity.QEstimate;
import beyond.samdasoo.lead.Entity.QLead;
import beyond.samdasoo.proposal.entity.QProposal;
import beyond.samdasoo.user.repository.UserRepository;
import com.querydsl.core.BooleanBuilder;
import com.querydsl.jpa.impl.JPAQueryFactory;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@RequiredArgsConstructor
public class EstimateRepositoryImpl implements EstimateRepositoryCustom {
    private final JPAQueryFactory queryFactory;
    private final UserRepository userRepository;

    QContract contract = QContract.contract;
    QEstimate estimate = QEstimate.estimate;
    QProposal proposal = QProposal.proposal;

    @Override
    public EstimateResponseDto findEstimateByLead(Long leadNo) {
        List<Long> estimateNoes = queryFactory
                .select(contract.estimate.estNo)
                .from(contract)
                .join(contract.estimate, estimate)
                .join(estimate.proposal, proposal).on(proposal.lead.no.eq(leadNo))
                .fetch();

        BooleanBuilder builder = new BooleanBuilder();

        if (!estimateNoes.isEmpty()) {
            builder.and(estimate.estNo.in(estimateNoes));
        } else {
            builder.and(estimate.proposal.lead.no.eq(leadNo));
        }

        return queryFactory
                .select(new QEstimateResponseDto(estimate))
                .from(estimate)
                .where(builder)
                .orderBy(estimate.estDate.desc())
                .limit(1)
                .fetchOne();
    }

    @Override
    public List<EstimateResponseDto> findEstimatesWithoutContract() {
        return queryFactory
                .select(new QEstimateResponseDto(estimate))
                .from(estimate)
                .leftJoin(estimate.contract, contract)
                .where(contract.isNull())
                .fetch();
    }

    @Override
    public List<EstimateResponseDto> searchEstimates(EstimateSearchDto searchDto) {
        QLead lead = QLead.lead;
        QCustomer customer = QCustomer.customer;

        BooleanBuilder builder = new BooleanBuilder();

        if (searchDto.getStartDate() != null) {
            builder.and(estimate.estDate.goe(searchDto.getStartDate()));
        }

        if (searchDto.getEndDate() != null) {
            builder.and(estimate.estDate.loe(searchDto.getEndDate()));
        }

        if (searchDto.getDeptNo() != null && searchDto.getDeptNo() > 0) {
            List<Long> deptNos = userRepository.findAllSubDepartments(searchDto.getDeptNo());

            builder.and(customer.user.department.deptNo.in(deptNos));
        }

        if (searchDto.getUserNo() != null && searchDto.getUserNo() > 0) {
            builder.and(customer.user.id.eq(searchDto.getUserNo()));
        }

        if (searchDto.getEstName() != null && !searchDto.getEstName().isEmpty()) {
            builder.and(estimate.name.contains(searchDto.getEstName()));
        }

        if (searchDto.getPropName() != null && !searchDto.getPropName().isEmpty()) {
            builder.and(proposal.name.contains(searchDto.getPropName()));
        }

        return queryFactory
                .select(new QEstimateResponseDto(estimate))
                .from(estimate)
                .join(estimate.proposal, proposal)
                .join(proposal.lead, lead)
                .join(lead.customer, customer)
                .where(builder)
                .fetch();
    }

}
