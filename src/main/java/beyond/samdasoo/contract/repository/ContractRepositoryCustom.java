package beyond.samdasoo.contract.repository;

import beyond.samdasoo.contract.dto.ContractResponseDto;

public interface ContractRepositoryCustom {
    ContractResponseDto findContractByLead(Long leadNo);
}
