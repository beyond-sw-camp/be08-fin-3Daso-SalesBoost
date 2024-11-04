package beyond.samdasoo.lead.repository;

import beyond.samdasoo.common.dto.SearchCond;
import beyond.samdasoo.lead.dto.*;

import java.util.List;

public interface LeadRepositoryCustom {
    List<LeadResponseDto> findFilteredLeads(LeadSearchCond searchCond);

    List<LeadStatusDto> findLeadStatusGroupedByStatus(SearchCond searchCond);

    MonthResponseDto findMonthlyLeadData(SearchCond searchCond);

    List<SuccessChartDto> findSuccessData(SearchCond searchCond);

    List<AwarePathResponseDto> findLeadDataByAwarePath(SearchCond searchCond);
}
