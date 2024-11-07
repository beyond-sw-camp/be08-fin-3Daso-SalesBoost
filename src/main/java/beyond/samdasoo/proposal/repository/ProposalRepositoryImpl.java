package beyond.samdasoo.proposal.repository;

import beyond.samdasoo.customer.entity.QCustomer;
import beyond.samdasoo.estimate.entity.QEstimate;
import beyond.samdasoo.lead.Entity.QLead;
import beyond.samdasoo.proposal.dto.*;
import beyond.samdasoo.proposal.entity.QProposal;
import beyond.samdasoo.user.repository.UserRepository;
import com.querydsl.core.BooleanBuilder;
import com.querydsl.jpa.impl.JPAQueryFactory;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@RequiredArgsConstructor
public class ProposalRepositoryImpl implements ProposalRepositoryCustom {
    private final JPAQueryFactory queryFactory;
    private final UserRepository userRepository;

    QProposal proposal = QProposal.proposal;
    QEstimate estimate = QEstimate.estimate;
    QLead lead = QLead.lead;
    QCustomer customer = QCustomer.customer;
    BooleanBuilder builder;

    @Override
    public ProposalResponseDto findLatestProposalWithEstimatesByLeadId(Long leadNo) {
        List<Long> proposalIdsWithEstimates =
                queryFactory
                        .select(estimate.proposal.propNo)
                        .from(estimate)
                        .join(estimate.proposal, proposal).on(proposal.lead.no.eq(leadNo))
                        .fetch();

        builder = new BooleanBuilder();

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

    @Override
    public List<ProposalResponseDto> searchProposals(ProposalSearchCriteriaDTO searchDto) {
        builder = new BooleanBuilder();

        if (searchDto.getStartDate() != null) {
            builder.and(proposal.startDate.goe(searchDto.getStartDate()));
        }

        if (searchDto.getEndDate() != null) {
            builder.and(proposal.endDate.loe(searchDto.getEndDate()));
        }

        if (searchDto.getSubmitDate() != null) {
            builder.and(proposal.submitDate.eq(searchDto.getSubmitDate()));
        }

        if (searchDto.getPropName() != null && !searchDto.getPropName().isEmpty()) {
            builder.and(proposal.name.contains(searchDto.getPropName()));
        }

        if (searchDto.getDeptNo() != null && searchDto.getDeptNo() > 0) {
            List<Long> deptNos = userRepository.findAllSubDepartments(searchDto.getDeptNo());

            builder.and(customer.user.department.deptNo.in(deptNos));
        }

        if (searchDto.getUserNo() != null && searchDto.getUserNo() > 0) {
            builder.and(customer.user.id.eq(searchDto.getUserNo()));
        }

        return queryFactory
                .select(new QProposalResponseDto(proposal))
                .from(proposal)
                .join(proposal.lead, lead)
                .join(lead.customer, customer)
                .where(builder)
                .fetch();
    }

    @Override
    public List<ProposalPopResponseDto> searchProposalsPopup(ProposalSearchCriteriaDTO searchDto) {
        builder = new BooleanBuilder();

        if (searchDto.getPropName() != null && !searchDto.getPropName().isEmpty()) {
            builder.and(proposal.name.contains(searchDto.getPropName()));
        }

        if (searchDto.getDeptNo() != null && searchDto.getDeptNo() > 0) {
            List<Long> deptNos = userRepository.findAllSubDepartments(searchDto.getDeptNo());

            builder.and(customer.user.department.deptNo.in(deptNos));
        }

        if (searchDto.getUserNo() != null && searchDto.getUserNo() > 0) {
            builder.and(customer.user.id.eq(searchDto.getUserNo()));
        }

        return queryFactory
                .select(new QProposalPopResponseDto(proposal))
                .from(proposal)
                .join(proposal.lead, lead)
                .join(lead.customer, customer)
                .where(builder)
                .fetch();
    }
}
