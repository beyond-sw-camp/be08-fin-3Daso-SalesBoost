package beyond.samdasoo.testsales.controller;

import beyond.samdasoo.common.response.BaseResponse;
import beyond.samdasoo.sales.dto.SalesResponseDto;
import beyond.samdasoo.testsales.dto.TestSalesPredictionDto;
import beyond.samdasoo.testsales.dto.TestSalesResponseDto;
import beyond.samdasoo.testsales.service.TestSalesService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@Tag(name = "Sales APIs", description = "매출 API")
@RequiredArgsConstructor
@RestController
@RequestMapping("api/testsales")
public class TestSalesController {

    private final TestSalesService salesService;


    // 매출 예측 api 호출 (년도별)
    @GetMapping("/forecast/years")
    @Operation(summary = "년도별 매출 예측", description = "년도별 매출 예측 데이터 조회")
    public BaseResponse<List<TestSalesPredictionDto>> getAnnualSalesForecast() {
        List<TestSalesResponseDto> sales = salesService.getAllSales();  // 모든 매출 데이터를 가져옴

        // 매출 데이터를 파이썬 API로 전달하여 예측 데이터 가져옴
        List<TestSalesPredictionDto> predictions = salesService.getYearsPredictedSales(sales);  // 년도별 예측된 매출 리스트

        return new BaseResponse<>(predictions);  // 예측된 DTO 리스트 반환
    }

    // 매출 예측 api 호출 (월별)
    @GetMapping("/forecast/month")
    @Operation(summary = "월별 매출 예측", description = "월별 매출 예측 데이터 조회")
    public BaseResponse<List<TestSalesPredictionDto>> getMonthlySalesForecast() {
        List<TestSalesResponseDto> sales = salesService.getAllSales();  // 모든 매출 데이터를 가져옴

        // 매출 데이터를 파이썬 API로 전달하여 예측 데이터 가져옴
        List<TestSalesPredictionDto> predictions = salesService.getMonthlyPredictedSales(sales);  // 월별 예측된 매출 리스트

        return new BaseResponse<>(predictions);  // 예측된 DTO 리스트 반환
    }

    // 매출 예측 api 호출 (분기별)
    @GetMapping("/forecast/quarter")
    @Operation(summary = "분기별 매출 예측", description = "분기별 매출 예측 데이터 조회")
    public BaseResponse<List<TestSalesPredictionDto>> getQuarterlySalesForecast() {
        List<TestSalesResponseDto> sales = salesService.getAllSales();  // 모든 매출 데이터를 가져옴

        // 매출 데이터를 파이썬 API로 전달하여 예측 데이터 가져옴
        List<TestSalesPredictionDto> predictions = salesService.getQuarterlyPredictedSales(sales);  // 분기별 예측된 매출 리스트

        return new BaseResponse<>(predictions);  // 예측된 DTO 리스트 반환
    }

    // 특정 년도 매출 조회
    @GetMapping("/count/monthly")
    @Operation(summary = "특정 년도 매출 조회", description = "특정 년도에 대한 월별 매출 데이터 조회")
    public BaseResponse<Map<String, Integer>> getMonthlySalesData(@RequestParam("year") String year) {
        Map<String, Integer> monthlySales = salesService.getMonthlySalesData(year);
        return new BaseResponse<>(monthlySales);
    }

}