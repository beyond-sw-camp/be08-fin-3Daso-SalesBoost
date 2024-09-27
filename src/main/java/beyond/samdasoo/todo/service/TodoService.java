package beyond.samdasoo.todo.service;

import beyond.samdasoo.member.entity.Member;
import beyond.samdasoo.member.repository.MemberRepository;
import beyond.samdasoo.todo.dto.TodoRequestDto;
import beyond.samdasoo.todo.dto.TodoResponseDto;
import beyond.samdasoo.todo.entity.Todo;
import beyond.samdasoo.todo.repository.TodoRepository;
import jakarta.persistence.EntityNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class TodoService {

    private final TodoRepository todoRepository;

    private final MemberRepository memberRepository;

    @Autowired
    public TodoService(TodoRepository todoRepository, MemberRepository memberRepository) {
        this.todoRepository = todoRepository;
        this.memberRepository = memberRepository;
    }

    @Transactional
    public TodoResponseDto createTodo(TodoRequestDto todoRequestDto){

        Member member = memberRepository.findById(todoRequestDto.getMemberNo())
                .orElseThrow(() -> new EntityNotFoundException("회원 ID 조회 불가: " + todoRequestDto.getMemberNo()));

        Todo todo = Todo.builder()
                .title(todoRequestDto.getTitle())
                .todoCls(todoRequestDto.getTodoCls())
                .priority(todoRequestDto.getPriority())
                .dueDate(todoRequestDto.getDueDate())
                .status(todoRequestDto.getStatus())
                .privateYn(todoRequestDto.getPrivateYn())
                .content(todoRequestDto.getContent())
                .memberNo(member)
                .build();

        todo = todoRepository.save(todo);

        return new TodoResponseDto(todo);
    }

    @Transactional(readOnly = true)
    public TodoResponseDto getTodoById(Long id) {
        Todo todo = todoRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("할 일을 찾을 수 없습니다: " + id));
        return new TodoResponseDto(todo);
    }


}
