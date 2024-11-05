package beyond.samdasoo.estimate.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.ToString;

@Getter
@AllArgsConstructor
@ToString
public class CreateProdRequestDto {
    private Long estProdNo;
    private Long prodNo;
    private Long unitAmt; // 단가
    private int discount;   // 할인율
    private Long unitPropAmt; // 판매단가
    private int qty;   // 수량
    private Long supplyPrice;  // 공급가액
    private int taxRate;    //  세율
    private Long tax; // 세액
    private Long totalAmt;   // 합계금액
}
