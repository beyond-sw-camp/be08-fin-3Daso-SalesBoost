package beyond.samdasoo.user.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;

import java.time.LocalDate;

@Getter
@AllArgsConstructor
public class UserDto {

    private String name;
    private String email;
    private String employeeId;
    private String department;
    private LocalDate joinDate; // 가입일

}
