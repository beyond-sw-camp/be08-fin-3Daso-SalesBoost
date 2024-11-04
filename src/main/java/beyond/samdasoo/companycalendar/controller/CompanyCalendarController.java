package beyond.samdasoo.companycalendar.controller;

import beyond.samdasoo.companycalendar.dto.CompanyCalendarResponseDto;
import beyond.samdasoo.companycalendar.service.CompanyCalendarService;
import beyond.samdasoo.common.response.BaseResponse;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/company/calendars")
@Tag(name = "Company calendars APIs", description = "전사일정 API")
public class CompanyCalendarController {

    private final CompanyCalendarService companyCalendarService;

    @Autowired
    public CompanyCalendarController(CompanyCalendarService companyCalendarService) {
        this.companyCalendarService = companyCalendarService;
    }

    @GetMapping
    public ResponseEntity<BaseResponse<CompanyCalendarResponseDto>> getAllCompanyEvents() {
        CompanyCalendarResponseDto responseDto = companyCalendarService.getAllCompanyEvents();
        BaseResponse<CompanyCalendarResponseDto> response = new BaseResponse<>(responseDto);
        return ResponseEntity.ok(response);
    }
}
