package beyond.samdasoo.lead.dto;

import beyond.samdasoo.common.dto.SearchCond;
import beyond.samdasoo.lead.Entity.LeadStatus;
import lombok.Getter;
import lombok.ToString;

import java.time.LocalDate;

@Getter
@ToString
public class LeadSearchCond extends SearchCond {
    private final LeadStatus status;
    private final Long process;
    private final Long subProcess;

    public LeadSearchCond(LocalDate searchDate, LocalDate startDate, LocalDate endDate, Long deptNo, Long userNo,
                          LeadStatus status, Long process, Long subProcess) {
        super(searchDate, startDate, endDate, deptNo, userNo); // 부모 클래스의 생성자를 호출합니다.
        this.status = status;
        this.process = process;
        this.subProcess = subProcess;
    }
}
