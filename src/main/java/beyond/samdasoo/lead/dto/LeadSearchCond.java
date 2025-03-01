package beyond.samdasoo.lead.dto;

import beyond.samdasoo.common.dto.SearchCond;
import beyond.samdasoo.lead.Entity.LeadStatus;
import lombok.Getter;

import java.time.LocalDate;

@Getter
public class LeadSearchCond extends SearchCond {
    private final LeadStatus status;
    private final Long process;
    private final Long subProcess;
    private final String name;

    public LeadSearchCond(LocalDate searchDate, LocalDate startDate, LocalDate endDate, Long deptNo, Long userNo,
                          LeadStatus status, Long process, Long subProcess, String name) {
        super(searchDate, startDate, endDate, deptNo, userNo);
        this.status = status;
        this.process = process;
        this.subProcess = subProcess;
        this.name = name;
    }
}
