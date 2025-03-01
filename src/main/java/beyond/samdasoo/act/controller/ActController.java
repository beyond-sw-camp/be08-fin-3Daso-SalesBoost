package beyond.samdasoo.act.controller;

import beyond.samdasoo.act.dto.ActRequestDto;
import beyond.samdasoo.act.dto.ActResponseDto;
import beyond.samdasoo.act.dto.ActStatusDto;
import beyond.samdasoo.act.service.ActService;
import beyond.samdasoo.common.dto.SearchCond;
import beyond.samdasoo.common.exception.BaseException;
import beyond.samdasoo.common.response.BaseResponse;
import beyond.samdasoo.common.response.BaseResponseStatus;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/acts")
@Tag(name = "Act APIs", description = "영업활동 API")
public class ActController {
    private final ActService actService;

    @Autowired
    public ActController(ActService actService) {
        this.actService = actService;
    }


    @PostMapping
    @Operation(summary = "영업활동 등록", description = "새로운 영업활동 등록")
    public ResponseEntity<BaseResponse<ActResponseDto>> createAct(@RequestBody ActRequestDto actRequestDto) {
        ActResponseDto responseDto = actService.createAct(actRequestDto);
        return ResponseEntity.status(HttpStatus.CREATED).body(new BaseResponse<>(responseDto));
    }

    @GetMapping("/{no}")
    @Operation(summary = "영업활동 조회", description = "특정 영업활동 조회")
    public ResponseEntity<BaseResponse<ActResponseDto>> getActById(@PathVariable("no") Long no) {
        try {
            ActResponseDto responseDto = actService.getActById(no);
            return ResponseEntity.ok(new BaseResponse<>(responseDto));
        } catch (BaseException ex) {
            BaseResponseStatus status = ex.getStatus();
            return new ResponseEntity<>(new BaseResponse<>(status), HttpStatus.valueOf(status.getCode()));
        }
    }

    @GetMapping
    @Operation(summary = "전체 영업활동 조회", description = "모든 영업활동 조회")
    public ResponseEntity<BaseResponse<List<ActResponseDto>>> getAllActs() {
        try {
            List<ActResponseDto> acts = actService.getAllActs();
            return ResponseEntity.ok(new BaseResponse<>(acts));
        } catch (BaseException ex) {
            BaseResponseStatus status = ex.getStatus();
            return new ResponseEntity<>(new BaseResponse<>(status), HttpStatus.valueOf(status.getCode()));
        }
    }

    @PatchMapping("/{no}")
    @Operation(summary = "영업활동 수정", description = "특정 영업활동 수정")
    public ResponseEntity<BaseResponse<ActResponseDto>> patchUpdateAct(@PathVariable("no") Long no, @RequestBody ActRequestDto actUpdateDto) {
        try {
            ActResponseDto updateAct = actService.updateAct(no, actUpdateDto);
            return ResponseEntity.ok(new BaseResponse<>(updateAct));
        } catch (BaseException ex) {
            BaseResponseStatus status = ex.getStatus();
            return new ResponseEntity<>(new BaseResponse<>(status), HttpStatus.valueOf(status.getCode()));
        }
    }

    @DeleteMapping("/{no}")
    @Operation(summary = "영업활동 삭제", description = "특정 영업활동 삭제")
    public ResponseEntity<BaseResponse<String>> deleteAct(@PathVariable("no") Long no) {
        try {
            actService.deleteAct(no);
            return ResponseEntity.ok(new BaseResponse<>("영업활동 삭제에 성공했습니다."));
        } catch (BaseException ex) {
            BaseResponseStatus status = ex.getStatus();
            return new ResponseEntity<>(new BaseResponse<>(status), HttpStatus.valueOf(status.getCode()));
        }
    }

    @GetMapping("/chart/count/category")
    @Operation(summary = "분류별 영업활동 개수", description = "영업활동을 분류별로 집계")
    public ResponseEntity<BaseResponse<Map<String, Long>>> countActsCategory() {
        try {
            Map<String, Long> result = actService.countActsCategory();
            return ResponseEntity.ok(new BaseResponse<>(result));
        } catch (BaseException ex) {
            BaseResponseStatus status = ex.getStatus();
            return new ResponseEntity<>(new BaseResponse<>(status), HttpStatus.valueOf(status.getCode()));
        }
    }

    @GetMapping("/chart/count/monthly")
    @Operation(summary = "월별 영업활동 개수", description = "월별 영업활동 횟수 집계")
    public ResponseEntity<BaseResponse<Map<String, Long>>> countMonthlyActsByYear(@RequestParam int year) {
        try {
            Map<String, Long> result = actService.countMonthlyActs(year);
            return ResponseEntity.ok(new BaseResponse<>(result));
        } catch (BaseException ex) {
            BaseResponseStatus status = ex.getStatus();
            return new ResponseEntity<>(new BaseResponse<>(status), HttpStatus.valueOf(status.getCode()));
        }
    }

    @GetMapping("/chart/ratio/user")
    @Operation(summary = "영업사원별 활동 비율", description = "전체 영업활동 대비 각 영업사원의 활동 비율")
    public ResponseEntity<BaseResponse<Map<String, Double>>> activityRatio() {
        try {
            Map<String, Double> result = actService.activityRatio();
            return ResponseEntity.ok(new BaseResponse<>(result));
        } catch (BaseException ex) {
            BaseResponseStatus status = ex.getStatus();
            return new ResponseEntity<>(new BaseResponse<>(status), HttpStatus.valueOf(status.getCode()));
        }
    }

    @PostMapping("/status/main")
    public ResponseEntity<ActStatusDto> getActStatus(@RequestBody SearchCond searchCond) {
        ActStatusDto actStatus = actService.getActStatus(searchCond);
        return ResponseEntity.ok(actStatus);
    }

    @GetMapping("/timeline/{leadNo}")
    @Operation(summary = "영업활동 리스트 조회", description = "영업기회에 해당하는 영업활동 조회")
    public BaseResponse<List<ActResponseDto>> getActsByLead(@PathVariable Long leadNo) {
        List<ActResponseDto> acts = actService.getActsByLead(leadNo);

        return new BaseResponse<>(acts);
    }
}