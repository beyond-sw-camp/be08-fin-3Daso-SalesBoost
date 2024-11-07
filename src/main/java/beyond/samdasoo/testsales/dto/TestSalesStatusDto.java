package beyond.samdasoo.testsales.dto;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class TestSalesStatusDto {
    private long monthSales;
    private long yearSales;
}
