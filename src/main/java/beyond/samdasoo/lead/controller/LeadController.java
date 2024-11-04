package beyond.samdasoo.lead.controller;

import beyond.samdasoo.common.dto.SearchCond;
import beyond.samdasoo.common.response.BaseResponse;
import beyond.samdasoo.lead.dto.*;
import beyond.samdasoo.lead.service.LeadService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/leads")
@Tag(name = "Lead APIs", description = "영업기회 API")
public class LeadController {
    private final LeadService leadService;

    @PostMapping
    @Operation(summary = "영업기회 등록", description = "신규 영업기회 등록")
    public BaseResponse<LeadResponseDto> createLead(@RequestBody LeadRequestDto leadRequestDto) {
        LeadResponseDto createdLead = leadService.createLead(leadRequestDto);
        return new BaseResponse<>(createdLead);
    }

    @GetMapping
    @Operation(summary = "전체 영업기회 조회", description = "모든 영업기회 조회")
    public BaseResponse<List<LeadResponseDto>> getAllLeads() {
        List<LeadResponseDto> leads = leadService.getAllLeads();
        return new BaseResponse<>(leads);
    }

    @PostMapping("/filter")
    @Operation(summary = "검색조건 영업기회 조회", description = "검색조건에 따른 영업기회 조회")
    public BaseResponse<List<LeadResponseDto>> getLeadsByDto(@RequestBody LeadSearchCond searchCond) {
        List<LeadResponseDto> leads = leadService.getFilteredLeads(searchCond);
        return new BaseResponse<>(leads);
    }

    @GetMapping("/{no}")
    @Operation(summary = "영업기회 상세 조회", description = "특정 영업기회 조회")
    public BaseResponse<LeadResponseDto> getLeadById(@PathVariable Long no) {
        LeadResponseDto lead = leadService.getLeadById(no);
        return new BaseResponse<>(lead);
    }

    @PatchMapping("/{no}")
    @Operation(summary = "영업기회 수정", description = "특정 영업기회 수정")
    public BaseResponse<String> updateLead(@PathVariable Long no, @RequestBody LeadRequestDto leadRequestDto) {
        leadService.updateLead(no, leadRequestDto);
        return new BaseResponse<>(no + " 영업기회가 수정됐습니다.");
    }

    @DeleteMapping("/{no}")
    @Operation(summary = "영업기회 삭제", description = "특정 영업기회 삭제")
    public BaseResponse<String> deleteLead(@PathVariable Long no) {
        leadService.deleteLead(no);
        return new BaseResponse<>(no + " 영업기회가 삭제됐습니다.");
    }

    @PostMapping("/status/main")
    @Operation(summary = "영업기회 상태별 조회", description = "영업기회 Status group by 조회(검색조건: 시작일자, 고객.담당자번호)")
    public BaseResponse<List<LeadStatusDto>> getLeadStatusMain(@RequestBody SearchCond searchCond) {
        List<LeadStatusDto> leadStatus = leadService.getLeadStatusGroupedByStatus(searchCond);
        return new BaseResponse<>(leadStatus);
    }

    @PostMapping("/chart/month")
    public BaseResponse<MonthResponseDto> getMonthlyChart(@RequestBody SearchCond searchCond) {
        MonthResponseDto monthResponse = leadService.getMonthlyChart(searchCond);
        return new BaseResponse<>(monthResponse);
    }

    @PostMapping("/chart/success")
    public BaseResponse<List<SuccessChartDto>> getSuccessChart(@RequestBody SearchCond searchCond) {
        List<SuccessChartDto> successChartDto = leadService.getSuccessChart(searchCond);
        return new BaseResponse<>(successChartDto);
    }

    @PostMapping("/chart/path")
    public BaseResponse<List<AwarePathResponseDto>> getPathChart(@RequestBody SearchCond searchCond) {
        List<AwarePathResponseDto> pathChartDto = leadService.getPathChart(searchCond);
        return new BaseResponse<>(pathChartDto);
    }
}
