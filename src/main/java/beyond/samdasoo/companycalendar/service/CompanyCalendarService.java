package beyond.samdasoo.companycalendar.service;

import beyond.samdasoo.companycalendar.dto.CompanyCalendarResponseDto;
import beyond.samdasoo.plan.dto.PlanResponseDto;
import beyond.samdasoo.plan.entity.Plan;
import beyond.samdasoo.plan.entity.PlanStatus;
import beyond.samdasoo.plan.entity.QPlan;
import beyond.samdasoo.todo.dto.TodoResponseDto;
import beyond.samdasoo.todo.entity.QTodo;
import beyond.samdasoo.todo.entity.Todo;
import com.querydsl.jpa.impl.JPAQueryFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class CompanyCalendarService {

    private final JPAQueryFactory queryFactory;

    public CompanyCalendarService(JPAQueryFactory queryFactory) {
        this.queryFactory = queryFactory;
    }

    @Transactional(readOnly = true)
    public CompanyCalendarResponseDto getAllCompanyEvents() {
        List<PlanResponseDto> plans = getCompanyPlans().stream()
                .map(PlanResponseDto::new)
                .collect(Collectors.toList());

        List<TodoResponseDto> todos = getCompanyTodos().stream()
                .map(TodoResponseDto::new)
                .collect(Collectors.toList());

        return new CompanyCalendarResponseDto(plans, todos);
    }

    private List<Plan> getCompanyPlans() {
        QPlan plan = QPlan.plan;
        return queryFactory.selectFrom(plan)
                .where(plan.personalYn.eq("N").or(plan.planCls.eq(PlanStatus.COMPANY)))
                .fetch();
    }

    private List<Todo> getCompanyTodos() {
        QTodo todo = QTodo.todo;
        return queryFactory.selectFrom(todo)
                .where(todo.privateYn.eq("N"))
                .fetch();
    }
}