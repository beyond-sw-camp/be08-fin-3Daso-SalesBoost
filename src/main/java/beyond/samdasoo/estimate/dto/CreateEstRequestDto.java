package beyond.samdasoo.estimate.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;

import java.time.LocalDate;
import java.util.List;

@Getter
@AllArgsConstructor
public class CreateEstRequestDto {
    private Long estNo;
    private String name;
    private Long propNo;
    private LocalDate estDate;
    private String taxCls;
    private String surtaxYn;
    private int prodCnt;
    private Long supplyPrice;
    private Long tax;
    private Long totalPrice;
    private String note;
    private List<CreateProdRequestDto> products;
}
