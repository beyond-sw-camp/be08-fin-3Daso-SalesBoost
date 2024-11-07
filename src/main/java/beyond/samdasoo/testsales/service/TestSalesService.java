package beyond.samdasoo.testsales.service;

import beyond.samdasoo.testsales.dto.TestSalesPredictionDto;
import beyond.samdasoo.testsales.dto.TestSalesResponseDto;
import beyond.samdasoo.testsales.repository.TestSalesRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.client.RestTemplate;

import java.util.*;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class TestSalesService {

    @Value("${flask.api.url}")
    private String flaskApiUrl;

    private final TestSalesRepository salesRepository;

    // 전체 매출 조회
    public List<TestSalesResponseDto> getAllSales() {
        return salesRepository.findAll()
                .stream()
                .map(TestSalesResponseDto::new)
                .collect(Collectors.toList());
    }

    public List<TestSalesPredictionDto> getYearsPredictedSales(List<TestSalesResponseDto> salesData) {
        RestTemplate restTemplate = new RestTemplate();
        // 파이썬 url 저장
        String pythonApiUrl = flaskApiUrl+"/api/forecast/years";

        // 요청 헤더 설정
        HttpHeaders headers = new HttpHeaders();
        headers.set("Content-Type", "application/json");

        HttpEntity<List<TestSalesResponseDto>> entity = new HttpEntity<>(salesData, headers);

        // 매출 데이터를 파이썬 API로 전달하고 예측된 매출을 받음
        ResponseEntity<Map<String, Object>> response = restTemplate.exchange(
                pythonApiUrl,
                HttpMethod.POST,
                entity,
                new ParameterizedTypeReference<Map<String, Object>>() {
                }
        );

        return convertPredictionResponseToDto(response.getBody(), "years_total_predictions");
    }

    public List<TestSalesPredictionDto> getMonthlyPredictedSales(List<TestSalesResponseDto> salesData) {
        RestTemplate restTemplate = new RestTemplate();
        String pythonApiUrl = flaskApiUrl + "/api/forecast/month";

        // 요청 헤더 설정
        HttpHeaders headers = new HttpHeaders();
        headers.set("Content-Type", "application/json");

        HttpEntity<List<TestSalesResponseDto>> entity = new HttpEntity<>(salesData, headers);

        // 매출 데이터를 파이썬 API로 전달하고 예측된 매출을 받음
        ResponseEntity<Map<String, Object>> response = restTemplate.exchange(
                pythonApiUrl,
                HttpMethod.POST,
                entity,
                new ParameterizedTypeReference<Map<String, Object>>() {
                }
        );

        return convertPredictionResponseToDto(response.getBody(), "month_total_predictions");
    }

    public List<TestSalesPredictionDto> getQuarterlyPredictedSales(List<TestSalesResponseDto> salesData) {
        RestTemplate restTemplate = new RestTemplate();
        String pythonApiUrl = flaskApiUrl + "/api/forecast/quarter";

        // 요청 헤더 설정
        HttpHeaders headers = new HttpHeaders();
        headers.set("Content-Type", "application/json");

        HttpEntity<List<TestSalesResponseDto>> entity = new HttpEntity<>(salesData, headers);

        // 매출 데이터를 파이썬 API로 전달하고 예측된 매출을 받음
        ResponseEntity<Map<String, Object>> response = restTemplate.exchange(
                pythonApiUrl,
                HttpMethod.POST,
                entity,
                new ParameterizedTypeReference<Map<String, Object>>() {
                }
        );

        return convertPredictionResponseToDto(response.getBody(), "quarter_total_predictions");
    }

    // 파이썬 API 응답을 SalesPredictionDto 리스트로 변환하는 메서드
    private List<TestSalesPredictionDto> convertPredictionResponseToDto(Map<String, Object> responseBody, String predictionKey) {
        List<TestSalesPredictionDto> predictions = new ArrayList<>();

        List<Double> predictedPrices = (List<Double>) responseBody.get(predictionKey);
        List<String> predictedTimes = (List<String>) responseBody.get("predicted_times");
        Double growthRate = (Double) responseBody.get("growthRate");
//        System.out.println("grow" + responseBody);

        for (int i = 0; i < predictedPrices.size(); i++) {
            TestSalesPredictionDto dto = new TestSalesPredictionDto();
            dto.setPredictedPrice(predictedPrices.get(i));
            dto.setPredictedTime(predictedTimes.get(i));
            dto.setPredictGrowRate(growthRate);
            predictions.add(dto);
        }
        return predictions;
    }


    // 해당 연도의 월별 매출 데이터를 조회하는 메서드
    public Map<String, Integer> getMonthlySalesData(String year) {
        Map<String, Integer> monthlySales = new HashMap<>();
        for (int i = 1; i <= 12; i++) {
            String yearMonth = String.format("%s-%02d", year, i);
            // 월별 매출 데이터를 조회하여 없으면 0으로 설정
            Integer salesCount = salesRepository.findSalesCountByMonth(yearMonth).orElse(0);
            monthlySales.put(yearMonth, salesCount);
        }
        return monthlySales;
    }
}
