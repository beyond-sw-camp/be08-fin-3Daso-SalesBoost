package beyond.samdasoo.lead.Entity;

import beyond.samdasoo.act.entity.Act;
import beyond.samdasoo.common.entity.BaseEntity;
import beyond.samdasoo.customer.entity.Customer;
import beyond.samdasoo.proposal.entity.Proposal;
import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDate;
import java.util.List;

@Entity
@Builder
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "tb_lead")
public class Lead extends BaseEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "lead_no", nullable = false)
    private Long no;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "customer_no", nullable = false)
    private Customer customer;

    @Column(name = "name", nullable = false)
    private String name;    // 이름

    @Column(name = "status", nullable = false)
    @Enumerated(EnumType.STRING)
    private LeadStatus status;  // 진행상태

    @Column(name = "exp_sales")
    private Long expSales;   // 예상 매출

    @Column(name = "exp_margin")
    private int expMargin;  // 예상 이익률

    @Column(name = "exp_profit")
    private Long expProfit;  // 예상 이익금액

    @Column(name = "process", nullable = false)
    private Long process;    // 프로세스

    @Column(name = "sub_process", nullable = false)
    private Long subProcess; // 서브프로세스

    @Column(name = "sucess_per")
    private int successPer;  // 성공확률

    @Column(name = "start_date")
    private LocalDate startDate;

    @Column(name = "end_date")
    private LocalDate endDate;

    @Column(name = "aware_path")
    @Enumerated(EnumType.STRING)
    private AwarePath awarePath;    // 인지경로

    @Column(name = "note")
    private String note;    // 노트

    @OneToMany(mappedBy = "lead", cascade = CascadeType.ALL)
    private List<Step> steps;   // 진행단계

    @OneToMany(mappedBy = "lead", cascade = CascadeType.ALL)
    private List<Act> acts;

    @OneToMany(mappedBy = "lead", cascade = CascadeType.ALL)
    private List<Proposal> proposals;
}
