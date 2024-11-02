package beyond.samdasoo.admin.dto;

import beyond.samdasoo.admin.entity.Department;
import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class DepartmentDto {
    private Long no;

    private String name;

    private String deptCode;

    private String engName;

    private String deptHead;

    @JsonInclude(JsonInclude.Include.NON_EMPTY)
    private List<DepartmentDto> children;

    private String upperDeptName;

    public DepartmentDto(Long no, String name, String deptCode, String engName, String deptHead, String upperDeptName) {
        this.no = no;

        this.name = name;

        this.deptCode = deptCode;

        this.engName = engName;

        this.deptHead = deptHead;

        this.upperDeptName = upperDeptName;
    }

    public DepartmentDto(Department department) {
        this.no = department.getDeptNo();
        this.name = department.getDeptName();
        this.deptCode = department.getDeptCode();
        this.engName = department.getEngName();
        this.deptHead = department.getDeptHead();
    }
}
