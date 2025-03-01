package beyond.samdasoo.admin.dto;

import beyond.samdasoo.admin.entity.Product;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ProductResponseDto {

    private Long prodNo;

    private String prodCode;

    private String name;

    private String engName;

    private String abbrName;

    private String uppGroup;

    private LocalDate releaseDate;

    private String dept;

    private int quantity;

    private String unit;

    private String field;

    private int supplyPrice;

    private Integer taxRate;

    private int price;

    public ProductResponseDto(Product product) {
        this.prodNo = product.getProdNo();
        this.prodCode = product.getProdCode();
        this.name = product.getName();
        this.engName = product.getEngName();
        this.abbrName = product.getAbbrName();
        this.uppGroup = product.getField();
        this.releaseDate = product.getReleaseDate();
        this.dept = product.getDepartment().getDeptName();
        this.quantity = product.getQuantity();
        this.unit = product.getUnit();
        this.field = product.getField();
        this.supplyPrice = product.getSupplyPrice();
        this.taxRate = product.getTaxRate();
        this.price = product.getPrice();
    }
}

