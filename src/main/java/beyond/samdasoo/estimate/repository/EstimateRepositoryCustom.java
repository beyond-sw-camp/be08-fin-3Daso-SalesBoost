package beyond.samdasoo.estimate.repository;

import beyond.samdasoo.estimate.dto.EstimateResponseDto;

public interface EstimateRepositoryCustom {
    EstimateResponseDto findEstimateByLead(Long leadNo);
}
