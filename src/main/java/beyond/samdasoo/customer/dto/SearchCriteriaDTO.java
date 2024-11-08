package beyond.samdasoo.customer.dto;

import beyond.samdasoo.common.dto.SearchCond;
import lombok.Getter;

import java.time.LocalDate;

@Getter
public class SearchCriteriaDTO extends SearchCond {
    private final String selectedItem; // 검색 조건
    private final String searchQuery; // 검색어
    private final Long personInCharge; // 담당자 (pk)
    private final String selectedKey; // 키맨 여부


    public SearchCriteriaDTO(LocalDate searchDate, LocalDate startDate, LocalDate endDate, Long deptNo, Long userNo
            , String selectedItem, String searchQuery, Long personInCharge, String selectedKey) {
        super(searchDate, startDate, endDate, deptNo, userNo);
        this.selectedItem = selectedItem;
        this.searchQuery = searchQuery;
        this.personInCharge = personInCharge;
        this.selectedKey = selectedKey;
    }
}
