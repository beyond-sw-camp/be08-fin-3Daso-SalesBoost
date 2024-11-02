package beyond.samdasoo.lead.dto;

import com.querydsl.core.annotations.QueryProjection;
import lombok.Data;

@Data
public class SuccessChartDto {
    private int successPer;
    private long count;

    @QueryProjection
    public SuccessChartDto(int successPer, long count) {
        this.successPer = successPer;
        this.count = count;
    }
}
