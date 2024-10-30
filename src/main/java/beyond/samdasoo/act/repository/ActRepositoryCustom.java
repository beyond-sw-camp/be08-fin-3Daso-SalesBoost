package beyond.samdasoo.act.repository;

import beyond.samdasoo.act.dto.ActStatusDto;
import beyond.samdasoo.common.dto.SearchCond;

public interface ActRepositoryCustom {
    ActStatusDto findActStatus(SearchCond searchCond);
}
