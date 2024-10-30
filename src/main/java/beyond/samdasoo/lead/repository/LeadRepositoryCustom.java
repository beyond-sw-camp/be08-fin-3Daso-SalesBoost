package beyond.samdasoo.lead.repository;

import beyond.samdasoo.common.dto.SearchCond;
import beyond.samdasoo.lead.dto.LeadStatusDto;

import java.util.List;

public interface LeadRepositoryCustom {
    List<LeadStatusDto> findLeadStatusGroupedByStatus(SearchCond searchCond);
}
