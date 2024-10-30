package beyond.samdasoo.potentialcustomer.repository;

import beyond.samdasoo.common.dto.SearchCond;

import java.time.LocalDate;

public interface PotentialCustomerRepositoryCustom {
    long getPotentialCustomerCount(SearchCond searchCond);
}
