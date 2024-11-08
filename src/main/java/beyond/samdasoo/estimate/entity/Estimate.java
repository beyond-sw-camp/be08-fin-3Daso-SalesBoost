package beyond.samdasoo.estimate.entity;

import beyond.samdasoo.common.entity.BaseEntity;
import beyond.samdasoo.contract.entity.Contract;
import beyond.samdasoo.proposal.entity.Proposal;
import jakarta.persistence.*;
import lombok.*;

import java.util.ArrayList;

import java.time.LocalDate;
import java.util.List;

@Table(name = "tb_estimate")
@Getter
@Setter
@Entity
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Estimate extends BaseEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "est_no")
    private Long estNo;  // 견적번호 (PK)

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "prop_no", nullable = false)
    private Proposal proposal;  // 제안번호 (FK)

    @Column(name = "name", nullable = false)
    private String name;  // 견적명

    @Column(name = "est_date", nullable = false)
    private LocalDate estDate;  // 견적일

    @Column(name = "tax_cls", nullable = false)
    private String taxCls;  // 과세구분

    @Column(name = "surtax_yn", nullable = false)
    private String surtaxYn;  // 단가구분

    @Column(name = "prod_cnt", nullable = false)
    private int prodCnt;  // 수량

    @Column(name = "supply_price", nullable = false)
    private Long supplyPrice;  // 공급가액

    @Column(name = "tax", nullable = false)
    private Long tax;  // 세액

    @Column(name = "total_price", nullable = false)
    private Long totalPrice;  // 합계금액

    @Column(name = "note")
    private String note;  // 비고 (optional)

    @OneToOne(mappedBy = "estimate", orphanRemoval = true, cascade = CascadeType.ALL)
    private Contract contract;

    @OneToMany(mappedBy = "estimate", cascade = CascadeType.ALL)
    private List<EstProduct> estProducts = new ArrayList<>();

    }

