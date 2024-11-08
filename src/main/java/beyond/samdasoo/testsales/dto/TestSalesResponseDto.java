package beyond.samdasoo.testsales.dto;

import beyond.samdasoo.testsales.entity.TestSales;
import com.querydsl.core.annotations.QueryProjection;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

@Getter
@NoArgsConstructor
@AllArgsConstructor
public class TestSalesResponseDto {
    private Long salesNo;
    private String salesName;
    private LocalDate salesDate;
    private String taxCls;
    private String surtaxYn;
    private int productCount;
    private int supplyPrice;
    private int tax;
    private int price;
    private LocalDate expArrivalDate;
    private String busiType;
    private String busiTypeDetail;
    private String note;
//    private Long contractNo;
//    private String contractName;

    @QueryProjection
    public TestSalesResponseDto(TestSales sales) {
        this.salesNo = sales.getSalesNo();
        this.salesName = sales.getSalesName();
        this.salesDate = sales.getSalesDate();
        this.taxCls = sales.getTaxCls();
        this.surtaxYn = sales.getSurtaxYn();
        this.productCount = sales.getProductCount();
        this.supplyPrice = sales.getSupplyPrice();
        this.tax = sales.getTax();
        this.price = sales.getPrice();
        this.expArrivalDate = sales.getExpArrivalDate();
        this.busiType = sales.getBusiType();
        this.busiTypeDetail = sales.getBusiTypeDetail();
        this.note = sales.getNote();
//        this.contractNo = sales.getContract().getContractNo();
//        this.contractName = sales.getContract().getName();
    }

}
