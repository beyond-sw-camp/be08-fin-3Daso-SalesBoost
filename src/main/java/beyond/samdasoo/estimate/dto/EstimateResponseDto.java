package beyond.samdasoo.estimate.dto;

import beyond.samdasoo.estimate.entity.Estimate;
import com.querydsl.core.annotations.QueryProjection;
import lombok.Data;

import java.time.LocalDate;

@Data
public class EstimateResponseDto {

    private Long estNo;  // 견적번호 (PK)
    private String name;  // 견적명
    private LocalDate estDate;  // 견적일
    private String taxCls;  // 과세구분
    private String surtaxYn;  // 단가구분
    private int prodCnt;  // 수량
    private Long supplyPrice;  // 공급가액
    private Long tax;  // 세액
    private Long totalPrice;  // 합계금액
    private String note;  // 비고 (optional)
    private Long propNo;  // 제안번호 (FK)
    private String propName;

    @QueryProjection
    public EstimateResponseDto(Estimate estimate) {
        this.estNo = estimate.getEstNo();
        this.name = estimate.getName();
        this.estDate = estimate.getEstDate();
        this.taxCls = estimate.getTaxCls();
        this.surtaxYn = estimate.getSurtaxYn();
        this.prodCnt = estimate.getProdCnt();
        this.supplyPrice = estimate.getSupplyPrice();
        this.tax = estimate.getTax();
        this.totalPrice = estimate.getTotalPrice();
        this.note = estimate.getNote();
        this.propNo = estimate.getProposal().getPropNo();
        this.propName = estimate.getProposal() != null ? estimate.getProposal().getName() : null;
    }
}
