package beyond.samdasoo.admin.service;

import beyond.samdasoo.admin.dto.TargetSaleRequestDto;
import beyond.samdasoo.admin.dto.TargetSaleResponseDto;
import beyond.samdasoo.admin.dto.TargetSalesStatusDto;
import beyond.samdasoo.admin.entity.Department;
import beyond.samdasoo.admin.entity.Product;
import beyond.samdasoo.admin.entity.TargetSale;
import beyond.samdasoo.admin.repository.DepartmentRepository;
import beyond.samdasoo.admin.repository.ProductRepository;
import beyond.samdasoo.admin.repository.TargetSaleRepository;
import beyond.samdasoo.common.dto.SearchCond;
import beyond.samdasoo.common.exception.BaseException;
import beyond.samdasoo.user.entity.User;
import beyond.samdasoo.user.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;

import static beyond.samdasoo.common.response.BaseResponseStatus.Product_NOT_EXIST;
import static beyond.samdasoo.common.response.BaseResponseStatus.USER_NOT_EXIST;


@Service
@RequiredArgsConstructor
public class TargetSaleServiceImpl implements TargetSaleService {

    private final TargetSaleRepository targetSaleRepository;
    private final UserRepository userRepository;
    private final ProductRepository productRepository;
    private final DepartmentRepository departmentRepository;

    @Override
    public void addTargetSale(TargetSaleRequestDto request) {

        Product product = productRepository.getByName(request.getProdName());
        User user = userRepository.getUserByName(request.getUserName());
        int origin_sum = 0;

        if (user == null) {
            throw new BaseException(USER_NOT_EXIST);
        }

        if (product == null) {
            throw new BaseException(Product_NOT_EXIST);
        }

        List<TargetSale> targetSales = targetSaleRepository.findByUserAndProductAndYear(user, product, request.getYear());


        if (targetSales.isEmpty()) {
            if (request.getSum() != 0) {
                int sum = request.getSum() - (request.getSum() % 12);

                for (int i = 0; i < 12; i++) {
                    int monthTarget = sum / 12;

                    TargetSale targetSale = TargetSale.builder()
                            .user(user)
                            .product(product)
                            .monthTarget(monthTarget)
                            .month(i + 1)
                            .year(request.getYear())
                            .build();

                    targetSaleRepository.save(targetSale);
                }
            } else {
                for (int i = 0; i < 12; i++) {
                    int monthTarget = request.getMonthTargets().get(i);

                    TargetSale targetSale = TargetSale.builder()
                            .user(user)
                            .product(product)
                            .monthTarget(monthTarget)
                            .month(i + 1)
                            .year(request.getYear())
                            .build();

                    targetSaleRepository.save(targetSale);
                }
            }
        } else {
            for(TargetSale targetSale : targetSales){
                origin_sum += targetSale.getMonthTarget();
            }
            if (request.getSum() != origin_sum) {
                int sum = request.getSum() - (request.getSum() % 12);
                for (int i = 0; i < 12; i++) {
                    int newMonthTarget = sum / 12;

                    if (targetSales.get(i).getMonthTarget() != newMonthTarget) {
                        targetSales.get(i).setMonthTarget(newMonthTarget);
                        targetSaleRepository.save(targetSales.get(i));
                    }
                }
            } else {
                for (int i = 0; i < 12; i++) {
                    int newMonthTarget = 0;
                    if (request.getMonthTargets() != null) {
                        newMonthTarget = request.getMonthTargets().get(i);

                        targetSales.get(i).setMonthTarget(newMonthTarget);
                        targetSaleRepository.save(targetSales.get(i));
                    }
                }
            }
        }
    }

    @Override
    public List<TargetSaleResponseDto> getTargetSaleByUserName(String userName, int year) {

        User user = userRepository.getUserByName(userName);

        if(user == null){
            throw new BaseException(USER_NOT_EXIST);
        }

        List<TargetSale> targetSales = targetSaleRepository.findByUserAndYear(user, year);

        return targetSales.stream()
                .map(targetSale -> new TargetSaleResponseDto(targetSale))
                .collect(Collectors.toList());
    }

    @Transactional(readOnly = true)
    public TargetSalesStatusDto getTargetSalesStatus(SearchCond searchCond) {
        return targetSaleRepository.findTargetSalesStatus(searchCond);
    }

    @Transactional(readOnly = true)
    public Map<Integer, Integer> getMonthlyTargetSalesData(int year) {
        Map<Integer, Integer> monthlySales = new HashMap<>();

        List<Object[]> results = targetSaleRepository.findMonthlyTargetSalesByYear(year);
        for (Object[] result : results) {
            Integer month = (Integer) result[0];
            Integer totalSales = ((Number) result[1]).intValue();
            monthlySales.put(month, totalSales);
        }

        return monthlySales;
    }

    @Override
    public Map<Integer, Integer> getTargetSaleByDeptName(String deptName, int year) {
        Map<Integer, Integer> deptSales = new HashMap<>();

        Optional<Department> department = departmentRepository.findByDeptName(deptName);

        List<Object[]> results = targetSaleRepository.findMonthlyTargetSalesByYearAndDeptId(department.get().getDeptNo(), year);

        if (results.isEmpty()) {
            for (int month = 1; month <= 12; month++) {
                deptSales.put(month, 0);
            }
        } else {
            for (Object[] result : results) {
                Integer month = (Integer) result[0];
                Integer totalSales = ((Number) result[1]).intValue();
                deptSales.put(month, totalSales);
            }
        }
        return deptSales;
    }

    @Transactional(readOnly = true)
    public Map<Integer, Integer> getMonthlyTargetSalesByuserName(String userName, int year) {
        List<TargetSale> targetSales = targetSaleRepository.findByUserNameAndYear(userName, year);

        Map<Integer, Integer> monthlyTargetSales = new HashMap<>();

        for (TargetSale targetSale : targetSales) {
            int month = targetSale.getMonth();
            int monthTarget = targetSale.getMonthTarget();

            monthlyTargetSales.put(month, monthlyTargetSales.getOrDefault(month, 0) + monthTarget);
        }

        return monthlyTargetSales;
    }
}
