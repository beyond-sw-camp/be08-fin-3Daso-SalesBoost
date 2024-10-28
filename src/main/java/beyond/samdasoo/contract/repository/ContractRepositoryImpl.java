package beyond.samdasoo.contract.repository;

import beyond.samdasoo.contract.dto.ContractResponseDto;
import beyond.samdasoo.contract.dto.QContractResponseDto;
import beyond.samdasoo.contract.entity.QContract;
import beyond.samdasoo.estimate.entity.QEstimate;
import beyond.samdasoo.proposal.entity.QProposal;
import beyond.samdasoo.sales.entity.QSales;
import com.querydsl.core.BooleanBuilder;
import com.querydsl.jpa.impl.JPAQueryFactory;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@RequiredArgsConstructor
public class ContractRepositoryImpl implements ContractRepositoryCustom {
    private final JPAQueryFactory queryFactory;

    QSales sales = QSales.sales;
    QContract contract = QContract.contract;
    QEstimate estimate = QEstimate.estimate;
    QProposal proposal = QProposal.proposal;

    @Override
    public ContractResponseDto findContractByLead(Long leadNo) {
        List<Long> contractNoes = queryFactory
                .select(sales.contract.contractNo)
                .from(sales)
                .join(sales.contract, contract)
                .join(contract.estimate, estimate)
                .join(estimate.proposal, proposal).on(proposal.lead.no.eq(leadNo))
                .fetch();

        BooleanBuilder builder = new BooleanBuilder();

        if (!contractNoes.isEmpty()) {
            builder.and(contract.contractNo.in(contractNoes));
        } else {
            builder.and(contract.estimate.proposal.lead.no.eq(leadNo));
        }

        return queryFactory
                .select(new QContractResponseDto(contract))
                .from(contract)
                .where(builder)
                .orderBy(contract.contractDate.desc())
                .limit(1)
                .fetchOne();
    }
}
