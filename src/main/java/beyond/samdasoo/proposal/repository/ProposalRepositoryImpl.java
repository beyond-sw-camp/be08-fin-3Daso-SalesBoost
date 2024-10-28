package beyond.samdasoo.proposal.repository;

import beyond.samdasoo.estimate.entity.QEstimate;
import beyond.samdasoo.proposal.dto.ProposalResponseDto;
import beyond.samdasoo.proposal.dto.QProposalResponseDto;
import beyond.samdasoo.proposal.entity.QProposal;
import com.querydsl.core.BooleanBuilder;
import com.querydsl.jpa.impl.JPAQueryFactory;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@RequiredArgsConstructor
public class ProposalRepositoryImpl implements ProposalRepositoryCustom {
    private final JPAQueryFactory queryFactory;

    QProposal proposal = QProposal.proposal;
    QEstimate estimate = QEstimate.estimate;

    @Override
    public ProposalResponseDto findLatestProposalWithEstimatesByLeadId(Long leadNo) {
        List<Long> proposalIdsWithEstimates =
                queryFactory
                        .select(estimate.proposal.propNo)
                        .from(estimate)
                        .join(estimate.proposal, proposal).on(proposal.lead.no.eq(leadNo))
                        .fetch();

        BooleanBuilder builder = new BooleanBuilder();

        if (!proposalIdsWithEstimates.isEmpty()) {
            builder.and(proposal.propNo.in(proposalIdsWithEstimates));
        } else {
            builder.and(proposal.lead.no.eq(leadNo));
        }

        return queryFactory
                .select(new QProposalResponseDto(proposal))
                .from(proposal)
                .where(builder)
                .orderBy(proposal.prDate.desc())
                .limit(1)
                .fetchOne();
    }
}
