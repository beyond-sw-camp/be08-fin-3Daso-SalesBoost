package beyond.samdasoo.proposal.repository;

import beyond.samdasoo.proposal.dto.ProposalResponseDto;

public interface ProposalRepositoryCustom {
    ProposalResponseDto findLatestProposalWithEstimatesByLeadId(Long leadNo);
}
