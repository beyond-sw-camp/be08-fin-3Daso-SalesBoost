package beyond.samdasoo.estimate.repository;

import beyond.samdasoo.estimate.dto.EstimateResponseDto;

import java.util.List;

public interface EstimateRepositoryCustom {
    EstimateResponseDto findEstimateByLead(Long leadNo);

    List<EstimateResponseDto> findEstimatesWithoutContract();
}
