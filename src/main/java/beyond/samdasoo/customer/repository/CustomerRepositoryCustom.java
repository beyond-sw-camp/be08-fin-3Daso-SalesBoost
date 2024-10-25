package beyond.samdasoo.customer.repository;

import beyond.samdasoo.customer.dto.PopupCustomerGetRes;
import beyond.samdasoo.customer.dto.SearchCriteriaDTO;

import java.time.LocalDate;
import java.util.List;

public interface CustomerRepositoryCustom {
    List<PopupCustomerGetRes> searchCustomers(SearchCriteriaDTO searchCriteriaDTO);

    long getCustomerCount(LocalDate searchDate, Long userNo);
}
