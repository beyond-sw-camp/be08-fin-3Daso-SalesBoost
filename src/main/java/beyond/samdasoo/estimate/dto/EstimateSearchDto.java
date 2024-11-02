package beyond.samdasoo.estimate.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class EstimateSearchDto {
    private String estName;  // 견적명
    private String propName;   // 제안명
    private LocalDate estDate; // 견적일
}
