package beyond.samdasoo.admin.service;

import beyond.samdasoo.admin.dto.DepartmentDto;
import beyond.samdasoo.admin.dto.DepartmentRequestDto;
import beyond.samdasoo.admin.dto.DepartmentResponseDto;
import beyond.samdasoo.admin.entity.Department;
import beyond.samdasoo.admin.repository.DepartmentRepository;
import beyond.samdasoo.common.exception.BaseException;
import beyond.samdasoo.user.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.Optional;
import java.util.stream.Collectors;

import static beyond.samdasoo.common.response.BaseResponseStatus.*;


@Service
@RequiredArgsConstructor
public class DepartmentServiceImpl implements DepartmentService {
    @Autowired
    private final DepartmentRepository departmentRepository;
    private final UserRepository userRepository;

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
                .isDeleted(false)
                .build();

        departmentRepository.save(department);
    }

    public List<DepartmentDto> getAllDepartments() {
        List<Department> topDepartments = departmentRepository.findByParentIsNull()
                .stream()
                .filter(department -> !department.isDeleted())
                .collect(Collectors.toList());

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
        if (department.isDeleted()) {
            return null;
        }

        String upperDeptName = "";
        if (department.getParent() != null) {
            Optional<Department> upperDept = departmentRepository.findById(department.getParent().getDeptNo());
            if (upperDept.isPresent() && !upperDept.get().isDeleted()) {
                upperDeptName = upperDept.get().getDeptName();
            }
        }

        List<DepartmentDto> childDtos = department.getChildren().stream()
                .map(this::departmentTree)
                .filter(Objects::nonNull)
                .collect(Collectors.toList());

        return new DepartmentDto(
                department.getDeptNo(), department.getDeptName(), department.getDeptCode(),
                department.getEngName(), department.getDeptHead(), childDtos, upperDeptName
        );
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

        if(userRepository.findUsersByDepartment(optionalDepartment.get().getDeptNo()) != null){
            throw new BaseException(DEPARTMENT_IS_USING);
        }else{
            setDeletedFlag(optionalDepartment.get());
        }


    }

    private void setDeletedFlag(Department department) {
        department.setDeleted(true);
        departmentRepository.save(department);

        for (Department child : department.getChildren()) {
            setDeletedFlag(child);
        }
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
