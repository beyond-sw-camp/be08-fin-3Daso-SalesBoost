package beyond.samdasoo.proposal.dto;

import beyond.samdasoo.proposal.entity.Proposal;
import lombok.Data;

import java.time.LocalDate;

@Data
public class ProposalPopResponseDto {
    private Long propNo;
    private String name;
    private LocalDate submitDate;
    private String custName;
    private String company;
    private String userName;

    public ProposalPopResponseDto(Proposal proposal) {
        this.propNo = proposal.getPropNo();
        this.name = proposal.getName();
        this.submitDate = proposal.getSubmitDate();
        this.custName = proposal.getLead().getCustomer().getName();
        this.company = proposal.getLead().getCustomer().getCompany();
        this.userName = proposal.getLead().getCustomer().getUser().getName();
    }
}
