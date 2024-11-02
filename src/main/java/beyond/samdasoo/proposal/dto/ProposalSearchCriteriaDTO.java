package beyond.samdasoo.proposal.dto;

import lombok.Getter;
import lombok.Setter;

import java.time.LocalDate;

@Getter
@Setter
public class ProposalSearchCriteriaDTO {
    private String propName;
    private LocalDate startDate;
    private LocalDate reqDate;

}
