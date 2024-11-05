package beyond.samdasoo.proposal.service;

import beyond.samdasoo.admin.entity.SubProcess;
import beyond.samdasoo.admin.repository.SubProcessRepository;
import beyond.samdasoo.common.exception.BaseException;
import beyond.samdasoo.common.response.BaseResponseStatus;
import beyond.samdasoo.lead.Entity.Lead;
import beyond.samdasoo.lead.dto.LeadRequestDto;
import beyond.samdasoo.lead.repository.LeadRepository;
import beyond.samdasoo.lead.service.LeadService;
import beyond.samdasoo.proposal.dto.ProposalPopResponseDto;
import beyond.samdasoo.proposal.dto.ProposalRequestDto;
import beyond.samdasoo.proposal.dto.ProposalResponseDto;
import beyond.samdasoo.proposal.dto.ProposalSearchCriteriaDTO;
import beyond.samdasoo.proposal.entity.Proposal;
import beyond.samdasoo.proposal.repository.ProposalRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class ProposalService {

    private final ProposalRepository proposalRepository;
    private final LeadRepository leadRepository;
    private final LeadService leadService;
    private final SubProcessRepository subProcessRepository;

    @Autowired
    public ProposalService(ProposalRepository proposalRepository, LeadRepository leadRepository
            , SubProcessRepository subProcessRepository, LeadService leadService) {
        this.proposalRepository = proposalRepository;
        this.leadRepository = leadRepository;
        this.subProcessRepository = subProcessRepository;
        this.leadService = leadService;
    }

    @Transactional
    public ProposalResponseDto createProposal(ProposalRequestDto proposalRequestDto) {

        Lead lead = leadRepository.findById(proposalRequestDto.getLeadNo())
                .orElseThrow(() -> new BaseException(BaseResponseStatus.LEAD_NOT_EXIST));

        Proposal proposal = new Proposal();
        proposal.setName(proposalRequestDto.getName());
        proposal.setCont(proposalRequestDto.getCont());
        proposal.setReqDate(proposalRequestDto.getReqDate());
        proposal.setStartDate(proposalRequestDto.getStartDate());
        proposal.setEndDate(proposalRequestDto.getEndDate());
        proposal.setSubmitDate(proposalRequestDto.getSubmitDate());
        proposal.setPrDate(proposalRequestDto.getPrDate());
        proposal.setNote(proposalRequestDto.getNote());
        proposal.setLead(lead);

        proposal = proposalRepository.save(proposal);

        SubProcess subProcess = subProcessRepository.searchSubProcesses(lead.getProcess(), "제안");

        LeadRequestDto leadRequestDto = leadService.objToDto(lead);
        leadRequestDto.setSubProcess(subProcess.getSubProcessNo());
        leadRequestDto.setSuccessPer(subProcess.getSuccessRate());

        leadService.updateLead(lead.getNo(), leadRequestDto);

        return new ProposalResponseDto(proposal);
    }

    public List<ProposalResponseDto> getAllProposals() {
        List<Proposal> proposals = proposalRepository.findAll();
        return proposals.stream()
                .map(proposal -> new ProposalResponseDto(proposal))
                .collect(Collectors.toList());
    }

    @Transactional(readOnly = true)
    public List<ProposalPopResponseDto> getAllProposals2() {
        List<Proposal> proposals = proposalRepository.findAll();
        return proposals.stream()
                .map(ProposalPopResponseDto::new)
                .collect(Collectors.toList());
    }

    @Transactional(readOnly = true)
    public ProposalResponseDto getProposalById(Long propNo) {
        Proposal proposal = proposalRepository.findById(propNo)
                .orElseThrow(() -> new BaseException(BaseResponseStatus.PROPOSAL_NOT_EXIST));
        return new ProposalResponseDto(proposal);
    }

    @Transactional
    public ProposalResponseDto updateProposal(Long propNo, ProposalRequestDto proposalRequestDto) {
        Proposal proposal = proposalRepository.findById(propNo)
                .orElseThrow(() -> new BaseException(BaseResponseStatus.PROPOSAL_NOT_EXIST));

        proposal.setName(proposalRequestDto.getName());
        proposal.setCont(proposalRequestDto.getCont());
        proposal.setReqDate(proposalRequestDto.getReqDate());
        proposal.setStartDate(proposalRequestDto.getStartDate());
        proposal.setEndDate(proposalRequestDto.getEndDate());
        proposal.setSubmitDate(proposalRequestDto.getSubmitDate());
        proposal.setPrDate(proposalRequestDto.getPrDate());
        proposal.setNote(proposalRequestDto.getNote());

        if (proposalRequestDto.getLeadNo() != null) {
            Lead lead = leadRepository.findById(proposalRequestDto.getLeadNo())
                    .orElseThrow(() -> new BaseException(BaseResponseStatus.LEAD_NOT_EXIST));
            proposal.setLead(lead);
        }

        proposal = proposalRepository.save(proposal);

        return new ProposalResponseDto(proposal);
    }

    @Transactional
    public void deleteProposal(Long propNo) {
        proposalRepository.findById(propNo)
                .orElseThrow(() -> new BaseException(BaseResponseStatus.PROPOSAL_NOT_EXIST));

        proposalRepository.deleteById(propNo);
    }

    @Transactional(readOnly = true)
    public ProposalResponseDto getLatestProposalWithEstimatesByLeadId(Long leadNo) {
        return proposalRepository.findLatestProposalWithEstimatesByLeadId(leadNo);
    }

    @Transactional(readOnly = true)
    public List<ProposalResponseDto> searchProposals(ProposalSearchCriteriaDTO searchDto) {
        return proposalRepository.searchProposals(searchDto);
    }
}
