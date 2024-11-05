package beyond.samdasoo.estimate.service;

import beyond.samdasoo.admin.entity.Product;
import beyond.samdasoo.admin.entity.SubProcess;
import beyond.samdasoo.admin.repository.ProductRepository;
import beyond.samdasoo.admin.repository.SubProcessRepository;
import beyond.samdasoo.common.exception.BaseException;
import beyond.samdasoo.common.response.BaseResponseStatus;
import beyond.samdasoo.estimate.dto.*;
import beyond.samdasoo.estimate.entity.EstProduct;
import beyond.samdasoo.estimate.entity.Estimate;
import beyond.samdasoo.estimate.repository.EstProductRepository;
import beyond.samdasoo.estimate.repository.EstimateRepository;
import beyond.samdasoo.lead.dto.LeadRequestDto;
import beyond.samdasoo.lead.service.LeadService;
import beyond.samdasoo.proposal.entity.Proposal;
import beyond.samdasoo.proposal.repository.ProposalRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;


@Service
public class EstimateService {

    private final EstimateRepository estimateRepository;
    private final ProposalRepository proposalRepository;
    private final EstProductRepository estProductRepository;
    private final ProductRepository productRepository;
    private final LeadService leadService;
    private final SubProcessRepository subProcessRepository;

    @Autowired
    public EstimateService(EstimateRepository estimateRepository, ProposalRepository proposalRepository,
                           EstProductRepository estProductRepository, ProductRepository productRepository,
                           LeadService leadService, SubProcessRepository subProcessRepository) {
        this.estimateRepository = estimateRepository;
        this.proposalRepository = proposalRepository;
        this.estProductRepository = estProductRepository;
        this.productRepository = productRepository;
        this.leadService = leadService;
        this.subProcessRepository = subProcessRepository;
    }

    @Transactional
    public EstimateResponseDto createEstimate(CreateEstRequestDto createEstimateDto) {

        Proposal proposal = proposalRepository.findById(createEstimateDto.getPropNo())
                .orElseThrow(() -> new BaseException(BaseResponseStatus.PROPOSAL_NOT_EXIST));

        Estimate estimate = new Estimate();
        estimate.setName(createEstimateDto.getName());
        estimate.setEstDate(createEstimateDto.getEstDate());
        estimate.setTaxCls(createEstimateDto.getTaxCls());
        estimate.setSurtaxYn(createEstimateDto.getSurtaxYn());
        estimate.setProdCnt(createEstimateDto.getProdCnt());
        estimate.setSupplyPrice(createEstimateDto.getSupplyPrice());
        estimate.setTax(createEstimateDto.getTax());
        estimate.setTotalPrice(createEstimateDto.getTotalPrice());
        estimate.setNote(createEstimateDto.getNote());
        estimate.setProposal(proposal);

        Estimate createEst = estimateRepository.save(estimate);

        if (!createEstimateDto.getProducts().isEmpty()) {
            createEstProd(createEst, createEstimateDto);
        }

        SubProcess subProcess = subProcessRepository.searchSubProcesses(proposal.getLead().getProcess(), "협상");

        LeadRequestDto leadRequestDto = leadService.objToDto(proposal.getLead());
        leadRequestDto.setSubProcess(subProcess.getSubProcessNo());
        leadRequestDto.setSuccessPer(subProcess.getSuccessRate());

        leadService.updateLead(proposal.getLead().getNo(), leadRequestDto);

        return new EstimateResponseDto(createEst);
    }

    public List<EstimateResponseDto> getAllEstimates() {
        List<Estimate> estimates = estimateRepository.findAll();
        return estimates.stream()
                .map(EstimateResponseDto::new)
                .collect(Collectors.toList());
    }

    @Transactional(readOnly = true)
    public EstimateDtlResponseDto getEstimateById(Long estNo) {
        Estimate estimate = estimateRepository.findById(estNo)
                .orElseThrow(() -> new BaseException(BaseResponseStatus.ESTIMATE_NOT_EXIST));
        return new EstimateDtlResponseDto(estimate);
    }

    @Transactional
    public EstimateResponseDto updateEstimate(Long estNo, CreateEstRequestDto estimateRequestDto) {

        Estimate estimate = estimateRepository.findById(estNo)
                .orElseThrow(() -> new BaseException(BaseResponseStatus.ESTIMATE_NOT_EXIST));

        Proposal proposal = proposalRepository.findById(estimateRequestDto.getPropNo())
                .orElseThrow(() -> new BaseException(BaseResponseStatus.PROPOSAL_NOT_EXIST));

        estimate.setProposal(proposal);
        Optional.ofNullable(estimateRequestDto.getName()).ifPresent(estimate::setName);
        Optional.ofNullable(estimateRequestDto.getEstDate()).ifPresent(estimate::setEstDate);
        Optional.ofNullable(estimateRequestDto.getTaxCls()).ifPresent(estimate::setTaxCls);
        Optional.ofNullable(estimateRequestDto.getSurtaxYn()).ifPresent(estimate::setSurtaxYn);
        Optional.of(estimateRequestDto.getProdCnt()).ifPresent(estimate::setProdCnt);
        Optional.ofNullable(estimateRequestDto.getSupplyPrice()).ifPresent(estimate::setSupplyPrice);
        Optional.ofNullable(estimateRequestDto.getTax()).ifPresent(estimate::setTax);
        Optional.ofNullable(estimateRequestDto.getTotalPrice()).ifPresent(estimate::setTotalPrice);
        Optional.of(estimateRequestDto.getNote()).ifPresent(estimate::setNote);


        if (!estimateRequestDto.getProducts().isEmpty()) {
            estProductRepository.deleteByEstimate(estimate);

            createEstProd(estimate, estimateRequestDto);
        }

        return new EstimateResponseDto(estimate);
    }

    @Transactional
    public void deleteEstimate(Long estNo) {
        Estimate estimate = estimateRepository.findById(estNo)
                .orElseThrow(() -> new BaseException(BaseResponseStatus.ESTIMATE_NOT_EXIST));

        estimateRepository.delete(estimate);
    }

    @Transactional(readOnly = true)
    public EstimateResponseDto getEstimateByLead(Long leadNo) {
        return estimateRepository.findEstimateByLead(leadNo);
    }

    @Transactional(readOnly = true)
    public List<EstimateResponseDto> getEstimatesWithoutContract() {
        return estimateRepository.findEstimatesWithoutContract();
    }

    @Transactional(readOnly = true)
    public List<EstimateResponseDto> searchEstimates(EstimateSearchDto searchDto) {
        return estimateRepository.searchEstimates(searchDto);
    }

    void createEstProd(Estimate estimate, CreateEstRequestDto createEstimateDto) {
        System.out.println(createEstimateDto.getProducts());

        for (CreateProdRequestDto estProductDto : createEstimateDto.getProducts()) {

            Long prodNo = estProductDto.getProdNo();
            Product product = productRepository.findById(prodNo)
                    .orElseThrow(() -> new BaseException(BaseResponseStatus.Product_NOT_EXIST));

            EstProduct estProduct = new EstProduct();
            estProduct.setUnitAmt(estProductDto.getUnitAmt());
            estProduct.setDiscount(estProductDto.getDiscount());
            estProduct.setUnitPropAmt(estProductDto.getUnitPropAmt());
            estProduct.setQty(estProductDto.getQty());
            estProduct.setSupplyPrice(estProductDto.getSupplyPrice());
            estProduct.setTaxRate(estProductDto.getTaxRate());
            estProduct.setTax(estProductDto.getTax());
            estProduct.setTotalAmt(estProductDto.getTotalAmt());
            estProduct.setEstimate(estimate);
            estProduct.setProduct(product);

            EstProduct newEstProduct = estProductRepository.save(estProduct);
            estimate.getEstProducts().add(newEstProduct);
        }
    }
}
