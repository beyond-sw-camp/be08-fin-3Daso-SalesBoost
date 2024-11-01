package beyond.samdasoo.contract.controller;

import beyond.samdasoo.common.exception.BaseException;
import beyond.samdasoo.common.response.BaseResponse;
import beyond.samdasoo.common.response.BaseResponseStatus;
import beyond.samdasoo.contract.dto.ContractRequestDto;
import beyond.samdasoo.contract.dto.ContractResponseDto;
import beyond.samdasoo.contract.service.ContractService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@Tag(name = "Contract APIs", description = "계약 API")
@RequiredArgsConstructor
@RestController
@RequestMapping("/api/contract")
public class ContractController {

    private final ContractService contractService;

    @GetMapping
    @Operation(summary = "계약 전체 조회", description = "등록된 계약 전체 조회")
    public BaseResponse<List<ContractResponseDto>> getContracts() {
        List<ContractResponseDto> contracts = contractService.getAllContracts();
        return new BaseResponse<>(contracts);
    }

    @GetMapping("/{no}")
    @Operation(summary = "계약 단건 조회", description = "등록된 계약중 계약 번호로 단건 조회")
    public BaseResponse<ContractResponseDto> getContract(@PathVariable("no") Long no) {
        ContractResponseDto contract = contractService.getContract(no);
        return new BaseResponse<>(contract);
    }

    @PostMapping
    @Operation(summary = "계약 생성", description = "신규 계약 등록")
    public BaseResponse<ContractResponseDto> createContract(@RequestBody ContractRequestDto contractRequestDto) {
        ContractResponseDto contractDto = contractService.createContract(contractRequestDto);
        return new BaseResponse<>(contractDto);
    }

    @DeleteMapping("/{no}")
    @Operation(summary = "계약 삭제", description = "기존 계약 삭제")
    public BaseResponse<String> deleteContract(@PathVariable("no") Long no) {
        contractService.deleteContract(no);
        return new BaseResponse<>("계약 번호 " + no + " 삭제 완료");
    }

    @PatchMapping("/{no}")
    @Operation(summary = "계약 수정", description = "기존 계약 수정")
    public BaseResponse<ContractResponseDto> updateContract(@PathVariable("no") Long no, @RequestBody ContractRequestDto contractRequestDto) {
        ContractResponseDto contract = contractService.updateContract(no, contractRequestDto);

        return new BaseResponse<>(contract);
    }

    @GetMapping("/chart/count/monthly")
    @Operation(summary = "월별 계약 개수", description = "월별 계약 횟수 집계")
    public ResponseEntity<BaseResponse<Map<String, Long>>> countMonthlyContracts(@RequestParam int year) {
        try {
            Map<String, Long> result = contractService.countMonthlyContracts(year);
            return ResponseEntity.ok(new BaseResponse<>(result));
        } catch (BaseException ex) {
            BaseResponseStatus status = ex.getStatus();
            return new ResponseEntity<>(new BaseResponse<>(status), HttpStatus.valueOf(status.getCode()));
        }
    }

    @GetMapping("/chart/total/monthly")
    @Operation(summary = "월별 계약 총액", description = "월별 계약 총액 집계")
    public ResponseEntity<BaseResponse<Map<String, Long>>> totalAmountMonthlyContracts(@RequestParam int year) {
        try {
            Map<String, Long> result = contractService.totalAmountMonthlyContracts(year);
            return ResponseEntity.ok(new BaseResponse<>(result));
        } catch (BaseException ex) {
            BaseResponseStatus status = ex.getStatus();
            return new ResponseEntity<>(new BaseResponse<>(status), HttpStatus.valueOf(status.getCode()));
        }
    }

    @GetMapping("/timeline/{leadNo}")
    public BaseResponse<ContractResponseDto> getContractByLead(@PathVariable Long leadNo) {
        return new BaseResponse<>(contractService.getContractByLead(leadNo));
    }

    @GetMapping("/without-sales")
    @Operation(summary = "매출건이 없는 계약 조회", description = "연관된 자식 데이터(매출)가 없는 계약 목록 조회")
    public BaseResponse<List<ContractResponseDto>> getEstimatesWithoutContract() {
        return new BaseResponse<>(contractService.getContractsWithoutSales());
    }
}
