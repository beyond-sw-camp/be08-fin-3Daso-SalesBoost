package beyond.samdasoo.proposal.dto;

import beyond.samdasoo.common.dto.SearchCond;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDate;

@Getter
@Setter
public class ProposalSearchCriteriaDTO extends SearchCond {
    private String propName;
    private LocalDate submitDate;

    public ProposalSearchCriteriaDTO(LocalDate searchDate, LocalDate startDate, LocalDate endDate
            , Long deptNo, Long userNo, String propName, LocalDate submitDate) {
        super(searchDate, startDate, endDate, deptNo, userNo);
        this.propName = propName;
        this.submitDate = submitDate;
    }
}
