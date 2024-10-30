package beyond.samdasoo.contract.repository;

import beyond.samdasoo.contract.dto.ContractResponseDto;

import java.util.List;

public interface ContractRepositoryCustom {
    ContractResponseDto findContractByLead(Long leadNo);

    List<ContractResponseDto> findContractWithoutSales();
}
