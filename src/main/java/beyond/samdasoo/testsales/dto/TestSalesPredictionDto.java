package beyond.samdasoo.testsales.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class TestSalesPredictionDto {
    private double predictedPrice;
    private String predictedTime;
    private double predictGrowRate;
}
