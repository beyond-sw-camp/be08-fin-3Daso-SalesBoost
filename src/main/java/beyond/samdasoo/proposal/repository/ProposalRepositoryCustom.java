package beyond.samdasoo.proposal.repository;

import beyond.samdasoo.proposal.dto.ProposalResponseDto;
import beyond.samdasoo.proposal.dto.ProposalSearchCriteriaDTO;

import java.util.List;

public interface ProposalRepositoryCustom {
    ProposalResponseDto findLatestProposalWithEstimatesByLeadId(Long leadNo);

    List<ProposalResponseDto> searchProposals(ProposalSearchCriteriaDTO searchDto);

}


