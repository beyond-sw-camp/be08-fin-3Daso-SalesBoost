package beyond.samdasoo.admin.service;

import beyond.samdasoo.admin.dto.DepartmentDto;
import beyond.samdasoo.admin.dto.DepartmentRequestDto;
import beyond.samdasoo.admin.dto.DepartmentResponseDto;
import beyond.samdasoo.admin.entity.Department;
import beyond.samdasoo.admin.repository.DepartmentRepository;
import beyond.samdasoo.common.exception.BaseException;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import static beyond.samdasoo.common.response.BaseResponseStatus.*;


@Service
@RequiredArgsConstructor
public class DepartmentServiceImpl implements DepartmentService {
    @Autowired
    private final DepartmentRepository departmentRepository;

    @Override
    public void addDepartment(DepartmentRequestDto request) {
        boolean exists = departmentRepository.existsByDeptName(request.getDeptName());

        if (exists) {
            throw new BaseException(DEPARTMENT_ALREADY_EXIST);
        }

        Optional<Department> upprDepartment = Optional.empty();

        if (!request.getUpperDeptName().isEmpty()) {
            upprDepartment = departmentRepository.findByDeptName(request.getUpperDeptName());

            if (upprDepartment.isEmpty()) {
                throw new BaseException(UPPER_DEPARTMENT_NOT_EXIST);
            }
        }

        Department department = Department.builder()
                .engName(request.getEngName())
                .parent(upprDepartment.orElse(null))
                .deptName(request.getDeptName())
                .deptCode(request.getDeptCode())
                .deptHead(request.getDeptHead())
                .build();

        departmentRepository.save(department);
    }

    public List<DepartmentDto> getAllDepartments() {
        List<Department> topDepartments = departmentRepository.findByParentIsNull();
        List<DepartmentDto> result = new ArrayList<>();

        for (Department department : topDepartments) {
            result.add(departmentTree(department));
        }

        return result;
    }

    @Override
    public List<DepartmentDto> getAllDept2() {
        return departmentRepository.findAll().stream()
                .map(DepartmentDto::new).collect(Collectors.toList());
    }

    private DepartmentDto departmentTree(Department department) {

        String upperDeptName = "";

        if (department.getParent() != null) {
            Optional<Department> upperDept = departmentRepository.findById(department.getParent().getDeptNo());

            upperDeptName = upperDept.get().getDeptName();

        }

        if (!department.getChildren().isEmpty()) {
            List<DepartmentDto> childDtos = new ArrayList<>();
            for (Department child : department.getChildren()) {
                childDtos.add(departmentTree(child));
            }
            return new DepartmentDto(department.getDeptNo(), department.getDeptName(),
                    department.getDeptCode(), department.getEngName(), department.getDeptHead(), childDtos, upperDeptName);
        } else {
            return new DepartmentDto(department.getDeptNo(), department.getDeptName(),
                    department.getDeptCode(), department.getEngName(), department.getDeptHead(), upperDeptName);
        }
    }


    @Override
    public DepartmentResponseDto getDepartmentByNo(Long deptNo) {
        Optional<Department> optionalDepartment = departmentRepository.findById(deptNo);

        if (optionalDepartment.isEmpty()) {
            throw new BaseException(DEPARTMENT_NOT_EXIST);
        }

        return new DepartmentResponseDto(optionalDepartment.get());
    }

    @Override
    public void deleteDepartmentByNo(Long deptNo) {
        Optional<Department> optionalDepartment = departmentRepository.findById(deptNo);

        if (optionalDepartment.isEmpty()) {
            throw new BaseException(DEPARTMENT_NOT_EXIST);
        }

        departmentRepository.deleteById(deptNo);
    }

    @Override
    public void updateDepartmentByNo(Long deptNo, DepartmentRequestDto request) {
        Optional<Department> optionalDepartment = departmentRepository.findById(deptNo);

        if (optionalDepartment.isEmpty()) {
            throw new BaseException(DEPARTMENT_NOT_EXIST);
        }

        Department department = optionalDepartment.get();

        if (request.getEngName() != null) {
            department.setEngName(request.getEngName());
        }
        if (request.getDeptName() != null) {
            department.setDeptName(request.getDeptName());
        }
        if (request.getDeptCode() != null) {
            department.setDeptCode(request.getDeptCode());
        }
        if (request.getDeptHead() != null) {
            department.setDeptHead(request.getDeptHead());
        }
        if (request.getUpperDeptName().equals(" ")) {
            Optional<Department> optionalUpperDepartment = departmentRepository.findByDeptName(request.getUpperDeptName());

            if (optionalUpperDepartment.isEmpty()) {
                throw new BaseException(UPPER_DEPARTMENT_NOT_EXIST);
            }

            department.setParent(optionalUpperDepartment.get());
        }


        departmentRepository.save(department);
    }
}
