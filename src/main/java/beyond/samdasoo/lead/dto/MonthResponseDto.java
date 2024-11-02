package beyond.samdasoo.lead.dto;

import lombok.AllArgsConstructor;
import lombok.Data;

import java.util.List;

@Data
@AllArgsConstructor
public class MonthResponseDto {
    private List<Integer> monthExpSales;
    private List<Integer> monthExpProfit;
    private List<Integer> monthLeadCount;
    private int totalSales;
    private int totalProfit;
    private int totalLeadCount;
}
