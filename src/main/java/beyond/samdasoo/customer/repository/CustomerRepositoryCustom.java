package beyond.samdasoo.customer.repository;

import beyond.samdasoo.common.dto.SearchCond;
import beyond.samdasoo.customer.dto.PopupCustomerGetRes;
import beyond.samdasoo.customer.dto.SearchCriteriaDTO;

import java.util.List;

public interface CustomerRepositoryCustom {
    List<PopupCustomerGetRes> searchCustomers(SearchCriteriaDTO searchCriteriaDTO);

    long getCustomerCount(SearchCond searchCond);
}
