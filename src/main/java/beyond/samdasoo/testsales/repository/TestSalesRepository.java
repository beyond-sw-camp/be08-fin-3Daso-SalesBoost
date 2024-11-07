package beyond.samdasoo.testsales.repository;


import beyond.samdasoo.testsales.entity.TestSales;
import io.lettuce.core.dynamic.annotation.Param;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.Optional;

public interface TestSalesRepository extends JpaRepository<TestSales, Long> {
    @Query("SELECT SUM(s.price) FROM TestSales s WHERE FUNCTION('DATE_FORMAT', s.salesDate, '%Y-%m') = :yearMonth")
    Optional<Integer> findSalesCountByMonth(@Param("yearMonth") String yearMonth);


}
