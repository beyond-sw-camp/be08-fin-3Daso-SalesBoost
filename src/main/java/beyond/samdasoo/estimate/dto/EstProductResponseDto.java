package beyond.samdasoo.estimate.dto;

import beyond.samdasoo.estimate.entity.EstProduct;
import lombok.Data;

@Data
public class EstProductResponseDto {
    private Long estProdNo;  // 견적번호 (PK)
    private String name;    // 물품이름
    private String unit;    // 물품규격
    private Long unitAmt;    // 단가
    private int discount;   // 할인율
    private Long unitPropAmt;    // 판매단가
    private int qty;  // 수량
    private Long supplyPrice;  // 공급가액
    private int taxRate;    // 세율
    private Long tax;  // 세액
    private Long totalAmt;  // 합계금액
    private Long prodNo;  // 제품번호 (FK)
    private Long estNo;  // 견적번호 (FK)

    public EstProductResponseDto(EstProduct estProduct) {
        this.estProdNo = estProduct.getNo();
        this.name = estProduct.getProduct().getName();
        this.unit = estProduct.getProduct().getUnit();
        this.unitAmt = estProduct.getUnitAmt();
        this.discount = estProduct.getDiscount();
        this.unitPropAmt = estProduct.getUnitPropAmt();
        this.qty = estProduct.getQty();
        this.supplyPrice = estProduct.getSupplyPrice();
        this.taxRate = estProduct.getTaxRate();
        this.tax = estProduct.getTax();
        this.totalAmt = estProduct.getTotalAmt();
        this.prodNo = estProduct.getProduct().getProdNo();
        this.estNo = estProduct.getEstimate().getEstNo();
    }
}
