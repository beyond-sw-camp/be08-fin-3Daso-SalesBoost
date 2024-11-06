package beyond.samdasoo.estimate.dto;

import beyond.samdasoo.estimate.entity.Estimate;
import lombok.Data;

import java.time.LocalDate;
import java.util.List;
import java.util.stream.Collectors;

@Data
public class EstimateDtlResponseDto {
    private Long estNo;
    private String name;
    private String company;
    private String customerName;
    private Long propNo;
    private String propName;
    private LocalDate estDate;
    private String taxCls;
    private String surtaxYn;
    private int prodCnt;
    private Long supplyPrice;
    private Long tax;
    private Long totalPrice;
    private String userName;
    private String note;
    private List<EstProductResponseDto> products;

    public EstimateDtlResponseDto(Estimate estimate) {
        this.estNo = estimate.getEstNo();
        this.name = estimate.getName();
        this.company = estimate.getProposal().getLead().getCustomer().getCompany();
        this.customerName = estimate.getProposal().getLead().getCustomer().getName();
        this.propNo = estimate.getProposal().getPropNo();
        this.propName = estimate.getProposal().getName();
        this.estDate = estimate.getEstDate();
        this.taxCls = estimate.getTaxCls();
        this.surtaxYn = estimate.getSurtaxYn();
        this.prodCnt = estimate.getProdCnt();
        this.supplyPrice = estimate.getSupplyPrice();
        this.tax = estimate.getTax();
        this.totalPrice = estimate.getTotalPrice();
        this.userName = estimate.getProposal().getLead().getCustomer().getUser().getName();
        this.note = estimate.getNote();
        if (estimate.getEstProducts() != null) {
            this.products = estimate.getEstProducts().stream()
                    .map(EstProductResponseDto::new)
                    .collect(Collectors.toList());
        }
    }
}
