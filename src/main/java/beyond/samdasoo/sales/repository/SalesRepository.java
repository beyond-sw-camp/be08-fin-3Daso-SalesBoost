package beyond.samdasoo.sales.repository;

import beyond.samdasoo.sales.entity.Sales;
import io.lettuce.core.dynamic.annotation.Param;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;

public interface SalesRepository extends JpaRepository<Sales, Long >,SalesRepositoryCustom {

    @Query("SELECT SUM(s.price) FROM Sales s WHERE FUNCTION('DATE_FORMAT', s.salesDate, '%Y-%m') = :yearMonth")
    Optional<Integer> findSalesCountByMonth(@Param("yearMonth") String yearMonth);

    @Query("SELECT SUM(s.price) FROM Sales s " +
            "JOIN s.contract c " +
            "JOIN c.estimate e " +
            "JOIN e.proposal p " +
            "JOIN p.lead l " +
            "JOIN l.customer cu " +
            "JOIN cu.user u " +
            "JOIN u.department d " +
            "WHERE d.deptNo = :deptNo " +
            "AND FUNCTION('DATE_FORMAT', s.salesDate, '%Y-%m') = :yearMonth")
    Optional<Integer> findMonthlySalesByDepartmentAndYear(@Param("deptNo") Long deptNo,  @Param("yearMonth") String yearMonth);

    @Query("SELECT SUM(s.price) FROM Sales s " +
            "JOIN s.contract c " +
            "JOIN c.estimate e " +
            "JOIN e.proposal p " +
            "JOIN p.lead l " +
            "JOIN l.customer cu " +
            "JOIN cu.user u " +
            "WHERE u.id = :userId " +
            "AND FUNCTION('DATE_FORMAT', s.salesDate, '%Y-%m') = :yearMonth")
    Optional<Integer> findMonthlySalesByUserIdAndYear(@Param("userId") Long userId, @Param("yearMonth") String yearMonth);

    // 특정 연도의 매출 총합
    @Query("SELECT SUM(s.price) FROM Sales s WHERE YEAR(s.salesDate) = :year")
    Integer findTotalSalesByYear(int year);

    // 특정 연도 및 월의 매출 총합
    @Query("SELECT SUM(s.price) FROM Sales s WHERE YEAR(s.salesDate) = :year AND MONTH(s.salesDate) = :month")
    Integer findTotalSalesByYearAndMonth(int year, int month);
}
