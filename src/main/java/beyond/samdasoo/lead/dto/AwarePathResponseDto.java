package beyond.samdasoo.lead.dto;

import beyond.samdasoo.lead.Entity.AwarePath;
import com.querydsl.core.annotations.QueryProjection;
import lombok.Data;

@Data
public class AwarePathResponseDto {
    private AwarePath awarePath;
    private Long totalExpSales;
    private Long totalExpProfit;
    private Long leadCount;

    @QueryProjection
    public AwarePathResponseDto(AwarePath awarePath, Long totalExpSales, Long totalExpProfit, Long leadCount) {
        this.awarePath = awarePath;
        this.totalExpSales = totalExpSales != null ? totalExpSales : 0;
        this.totalExpProfit = totalExpProfit != null ? totalExpProfit : 0;
        this.leadCount = leadCount != null ? leadCount : 0;
    }

}
