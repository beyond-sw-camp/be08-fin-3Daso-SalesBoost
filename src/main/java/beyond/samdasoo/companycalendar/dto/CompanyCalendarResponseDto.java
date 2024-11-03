package beyond.samdasoo.companycalendar.dto;

import beyond.samdasoo.plan.dto.PlanResponseDto;
import beyond.samdasoo.todo.dto.TodoRequestDto;
import beyond.samdasoo.todo.dto.TodoResponseDto;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CompanyCalendarResponseDto {
    private List<PlanResponseDto> plans;
    private List<TodoResponseDto> todos;
}
