package beyond.samdasoo.estimate.dto;

import lombok.Data;

@Data
public class EstProductRequestDto {
    private Long unitAmt;
    private int discount;
    private Long unitPropAmt;
    private int qty;
    private Long supplyPrice;
    private Long tax;
    private Long totalAmt;
    private Long estNo;
    private Long prodNo;
}
