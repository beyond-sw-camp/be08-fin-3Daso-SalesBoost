package beyond.samdasoo.estimate.controller;

import beyond.samdasoo.common.response.BaseResponse;
import beyond.samdasoo.estimate.dto.CreateEstRequestDto;
import beyond.samdasoo.estimate.dto.EstimateDtlResponseDto;
import beyond.samdasoo.estimate.dto.EstimateResponseDto;
import beyond.samdasoo.estimate.dto.EstimateSearchDto;
import beyond.samdasoo.estimate.service.EstimateService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/estimates")
@Tag(name = "Estimate APIs", description = "견적 관련 API")
public class EstimateController {

    private final EstimateService estimateService;

    @Autowired
    public EstimateController(EstimateService estimateService) {
        this.estimateService = estimateService;
    }

    @PostMapping
    @Operation(summary = "견적 등록", description = "새로운 견적 건을 등록")
    public BaseResponse<EstimateResponseDto> createEstimate(@RequestBody CreateEstRequestDto createEstimateDto) {
        EstimateResponseDto responseDto = estimateService.createEstimate(createEstimateDto);
        return new BaseResponse<>(responseDto);
    }


    @GetMapping
    @Operation(summary = "모든 견적 조회", description = "등록되어 있는 모든 견적 조회")
    public BaseResponse<List<EstimateResponseDto>> getAllEstimates() {
        List<EstimateResponseDto> responseDtos = estimateService.getAllEstimates();
        return new BaseResponse<>(responseDtos);
    }


    @GetMapping("/{no}")
    @Operation(summary = "특정 견적 조회", description = "견적 번호로 특정 제안 조회")
    public BaseResponse<EstimateDtlResponseDto> getEstimateById(@PathVariable("no") Long estNo) {
        EstimateDtlResponseDto responseDto = estimateService.getEstimateById(estNo);
        return new BaseResponse<>(responseDto);
    }

    @PatchMapping("/{no}")
    @Operation(summary = "견적 수정", description = "견적 번호로 특정 제안 수정")
    public BaseResponse<EstimateResponseDto> patchUpdateEstimate(@PathVariable("no") Long estNo,
                                                                 @RequestBody CreateEstRequestDto estimateRequestDto) {
        EstimateResponseDto responseDto = estimateService.updateEstimate(estNo, estimateRequestDto);
        return new BaseResponse<>(responseDto);
    }

    @DeleteMapping("/{no}")
    @Operation(summary = "견적 삭제", description = "견적 번호로 특정 제안 삭제")
    public BaseResponse<String> deleteEstimate(@PathVariable("no") Long estNo) {
        estimateService.deleteEstimate(estNo);
        return new BaseResponse<>("견적이 삭제됐습니다.");
    }

    @GetMapping("/timeline/{leadNo}")
    public BaseResponse<EstimateResponseDto> getEstimateByLead(@PathVariable Long leadNo) {
        return new BaseResponse<>(estimateService.getEstimateByLead(leadNo));
    }

    @GetMapping("/without-contract")
    @Operation(summary = "계약건이 없는 견적 조회", description = "연관된 자식 데이터(계약)가 없는 견적 목록 조회")
    public BaseResponse<List<EstimateResponseDto>> getEstimatesWithoutContract() {
        return new BaseResponse<>(estimateService.getEstimatesWithoutContract());
    }

    @PostMapping("/search")
    @Operation(summary = "견적 검색", description = "검색조건(견정명, 제안명, 견적일)에 맞는 제안을 조회")
    public BaseResponse<List<EstimateResponseDto>> searchEstimates(@RequestBody EstimateSearchDto estimateSearchDto) {
        List<EstimateResponseDto> result = estimateService.searchEstimates(estimateSearchDto);
        return new BaseResponse<>(result);
    }
}

