package beyond.samdasoo.contract.service;

import beyond.samdasoo.admin.entity.SubProcess;
import beyond.samdasoo.admin.repository.SubProcessRepository;
import beyond.samdasoo.common.exception.BaseException;
import beyond.samdasoo.common.response.BaseResponseStatus;
import beyond.samdasoo.contract.dto.ContractRequestDto;
import beyond.samdasoo.contract.dto.ContractResponseDto;
import beyond.samdasoo.contract.entity.Contract;
import beyond.samdasoo.contract.entity.QContract;
import beyond.samdasoo.contract.repository.ContractRepository;
import beyond.samdasoo.estimate.entity.Estimate;
import beyond.samdasoo.estimate.repository.EstimateRepository;
import beyond.samdasoo.lead.dto.LeadRequestDto;
import beyond.samdasoo.lead.service.LeadService;
import com.querydsl.core.types.dsl.Expressions;
import com.querydsl.core.types.dsl.NumberTemplate;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.querydsl.jpa.impl.JPAQueryFactory;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class ContractService {

    private final ContractRepository contractRepository;
    private final EstimateRepository estimateRepository;
    private final LeadService leadService;
    private final SubProcessRepository subProcessRepository;
    private final JPAQueryFactory queryFactory;

    // 모든 계약 조회
    public List<ContractResponseDto> getAllContracts() {
        return contractRepository.findAll()
                .stream()
                .map(ContractResponseDto::new)
                .collect(Collectors.toList());
    }

    // 계약 조회 (단일)
    public ContractResponseDto getContract(Long no) {
        return contractRepository.findById(no)
                .map(ContractResponseDto::new)
                .orElseThrow(() -> new BaseException(BaseResponseStatus.CONTRACT_NOT_EXIST));
    }

    @Transactional
    public ContractResponseDto createContract(ContractRequestDto requestDto) {
        Estimate estimate = estimateRepository.findById(requestDto.getEstimateNo())
                .orElseThrow(() -> new BaseException(BaseResponseStatus.CONTRACT_NOT_EXIST));

        if (estimate.getContract() != null) {
            throw new BaseException(BaseResponseStatus.ESTIMATE_ALREADY_HAVEN_CONTRACT);
        }

        Contract contract = Contract.builder()
                .name(requestDto.getName())
                .contractDate(requestDto.getContractDate())
                .startDate(requestDto.getStartDate())
                .endDate(requestDto.getEndDate())
                .taxCls(requestDto.getTaxCls())
                .surtaxYn(requestDto.getSurtaxYn())
                .productCount(requestDto.getProductCount())
                .supplyPrice(requestDto.getSupplyPrice())
                .tax(requestDto.getTax())
                .totalPrice(requestDto.getTotalPrice())
                .paymentTerms(requestDto.getPaymentTerms())
                .warrenty(requestDto.getWarrenty())
                .contractCls(requestDto.getContractCls())
                .expectedArrivalDate(requestDto.getExpectedArrivalDate())
                .arrivalNotificationYn(requestDto.getArrivalNotificationYn())
                .arrivalNotificationDay(requestDto.getArrivalNotificationDay())
                .renewalNotificationYn(requestDto.getRenewalNotificationYn())
                .renewalNotificationDay(requestDto.getRenewalNotificationDay())
                .note(requestDto.getNote())
                .estimate(estimate)
                .build();

        Contract savedContract = contractRepository.save(contract);

        SubProcess subProcess = subProcessRepository.searchSubProcesses(estimate.getProposal().getLead().getProcess(), "계약");

        LeadRequestDto leadRequestDto = leadService.objToDto(estimate.getProposal().getLead());
        leadRequestDto.setSubProcess(subProcess.getSubProcessNo());
        leadRequestDto.setSuccessPer(subProcess.getSuccessRate());

        leadService.updateLead(estimate.getProposal().getLead().getNo(), leadRequestDto);

        return new ContractResponseDto(savedContract);
    }

    // 계약 수정
    @Transactional
    public ContractResponseDto updateContract(Long no, ContractRequestDto requestDto) {
        Contract contract = contractRepository.findById(no)
                .orElseThrow(() -> new BaseException(BaseResponseStatus.CONTRACT_NOT_EXIST));
        Estimate estimate = estimateRepository.findById(requestDto.getEstimateNo())
                .orElseThrow(() -> new BaseException(BaseResponseStatus.ESTIMATE_NOT_EXIST));

        if ((!estimate.getEstNo().equals(contract.getEstimate().getEstNo()))
                && estimate.getContract() != null) {
            throw new BaseException(BaseResponseStatus.ESTIMATE_ALREADY_HAVEN_CONTRACT);
        }

        contract = Contract.builder()
                .contractNo(contract.getContractNo())  // 기존 계약번호 유지
                .name(requestDto.getName())
                .contractDate(requestDto.getContractDate())
                .startDate(requestDto.getStartDate())
                .endDate(requestDto.getEndDate())
                .taxCls(requestDto.getTaxCls())
                .surtaxYn(requestDto.getSurtaxYn())
                .productCount(requestDto.getProductCount())
                .supplyPrice(requestDto.getSupplyPrice())
                .tax(requestDto.getTax())
                .totalPrice(requestDto.getTotalPrice())
                .paymentTerms(requestDto.getPaymentTerms())
                .warrenty(requestDto.getWarrenty())
                .contractCls(requestDto.getContractCls())
                .expectedArrivalDate(requestDto.getExpectedArrivalDate())
                .arrivalNotificationYn(requestDto.getArrivalNotificationYn())
                .arrivalNotificationDay(requestDto.getArrivalNotificationDay())
                .renewalNotificationYn(requestDto.getRenewalNotificationYn())
                .renewalNotificationDay(requestDto.getRenewalNotificationDay())
                .note(requestDto.getNote())
                .estimate(estimate)
                .build();

        Contract updatedContract = contractRepository.save(contract);
        return new ContractResponseDto(updatedContract);
    }

    // 삭제를 위한 no 찾기 메소드 생성
    private Contract findContractId(Long no) {
        return contractRepository.findById(no)
                .orElseThrow(() -> new BaseException(BaseResponseStatus.CONTRACT_NOT_EXIST));
    }

    // 계약 삭제
    @Transactional
    public void deleteContract(Long no) {
        contractRepository.delete(findContractId(no));
    }

    @Transactional(readOnly = true)
    public ContractResponseDto getContractByLead(Long leadNo) {
        return contractRepository.findContractByLead(leadNo);
    }

    @Transactional(readOnly = true)
    public List<ContractResponseDto> getContractsWithoutSales() {
        return contractRepository.findContractWithoutSales();
    }


    @Transactional(readOnly = true)
    public Map<String, Long> countMonthlyContracts(int year) {
        QContract contract = QContract.contract;
        NumberTemplate<Integer> monthTemplate = Expressions.numberTemplate(Integer.class, "month({0})", contract.contractDate);
        NumberTemplate<Integer> yearTemplate = Expressions.numberTemplate(Integer.class, "year({0})", contract.contractDate);

        return queryFactory
                .select(monthTemplate, contract.count())
                .from(contract)
                .where(yearTemplate.eq(year))
                .groupBy(monthTemplate)
                .fetch()
                .stream()
                .collect(Collectors.toMap(
                        tuple -> year + "-" + String.format("%02d", tuple.get(monthTemplate)),
                        tuple -> tuple.get(contract.count())
                ));
    }

    @Transactional(readOnly = true)
    public Map<String, Long> totalAmountMonthlyContracts(int year) {
        QContract contract = QContract.contract;
        NumberTemplate<Integer> monthTemplate = Expressions.numberTemplate(Integer.class, "month({0})", contract.contractDate);
        NumberTemplate<Integer> yearTemplate = Expressions.numberTemplate(Integer.class, "year({0})", contract.contractDate);

        return queryFactory
                .select(monthTemplate, contract.totalPrice.sum()) // Use totalPrice instead of price
                .from(contract)
                .where(yearTemplate.eq(year))
                .groupBy(monthTemplate)
                .fetch()
                .stream()
                .collect(Collectors.toMap(
                        tuple -> year + "-" + String.format("%02d", tuple.get(monthTemplate)),
                        tuple -> tuple.get(contract.totalPrice.sum()).longValue()
                ));
    }

}

