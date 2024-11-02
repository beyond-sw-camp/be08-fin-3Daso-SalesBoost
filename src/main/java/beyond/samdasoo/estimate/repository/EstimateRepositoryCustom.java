package beyond.samdasoo.estimate.repository;

import beyond.samdasoo.estimate.dto.EstimateResponseDto;
import beyond.samdasoo.estimate.dto.EstimateSearchDto;

import java.util.List;

public interface EstimateRepositoryCustom {
    EstimateResponseDto findEstimateByLead(Long leadNo);

    List<EstimateResponseDto> findEstimatesWithoutContract();
    List<EstimateResponseDto> searchEstimates(EstimateSearchDto searchDto);
}
