package beyond.samdasoo.estimate.dto;

import beyond.samdasoo.common.dto.SearchCond;
import lombok.Getter;

import java.time.LocalDate;

@Getter
public class EstimateSearchDto extends SearchCond {
    private final String estName;  // 견적명
    private final String propName;   // 제안명


    public EstimateSearchDto(LocalDate searchDate, LocalDate startDate, LocalDate endDate, Long deptNo, Long userNo,
                             String estName, String propName) {
        super(searchDate, startDate, endDate, deptNo, userNo);
        this.estName = estName;
        this.propName = propName;
    }
}
