package beyond.samdasoo.estimate.repository;

import beyond.samdasoo.contract.entity.QContract;
import beyond.samdasoo.estimate.dto.EstimateResponseDto;
import beyond.samdasoo.estimate.dto.EstimateSearchDto;
import beyond.samdasoo.estimate.dto.QEstimateResponseDto;
import beyond.samdasoo.estimate.entity.Estimate;
import beyond.samdasoo.estimate.entity.QEstimate;
import beyond.samdasoo.proposal.entity.QProposal;
import com.querydsl.core.BooleanBuilder;
import com.querydsl.jpa.impl.JPAQueryFactory;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@RequiredArgsConstructor
public class EstimateRepositoryImpl implements EstimateRepositoryCustom {
    private final JPAQueryFactory queryFactory;

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
        BooleanBuilder builder = new BooleanBuilder();

        if (searchDto.getEstName() != null && !searchDto.getEstName().isEmpty()) {
            builder.and(estimate.name.contains(searchDto.getEstName()));
        }

        if (searchDto.getPropName() != null && !searchDto.getPropName().isEmpty()) {
            builder.and(proposal.name.contains(searchDto.getPropName()));
        }

        if (searchDto.getEstDate() != null) {
            builder.and(estimate.estDate.eq(searchDto.getEstDate()));
        }

        return queryFactory
                .select(new QEstimateResponseDto(estimate))
                .from(estimate)
                .leftJoin(estimate.proposal, proposal)
                .where(builder)
                .fetch();
    }

}
