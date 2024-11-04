package beyond.samdasoo.admin.service;


import beyond.samdasoo.admin.dto.TargetSaleRequestDto;
import beyond.samdasoo.admin.dto.TargetSaleResponseDto;
import beyond.samdasoo.admin.dto.TargetSalesStatusDto;
import beyond.samdasoo.common.dto.SearchCond;

import java.util.List;
import java.util.Map;

public interface TargetSaleService {

    void addTargetSale(TargetSaleRequestDto request);

    List<TargetSaleResponseDto> getTargetSaleByUserName(String userName, int year);

    TargetSalesStatusDto getTargetSalesStatus(SearchCond searchCond);

    Map<Integer, Integer> getMonthlyTargetSalesData(int year);

    Map<Integer, Integer> getTargetSaleByDeptName(String deptName, int year);

    Map<Integer, Integer> getMonthlyTargetSalesByuserName(String userName, int year);
}
