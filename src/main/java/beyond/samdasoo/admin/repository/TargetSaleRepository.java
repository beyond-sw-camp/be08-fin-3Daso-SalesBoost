package beyond.samdasoo.admin.repository;

import beyond.samdasoo.admin.entity.Product;
import beyond.samdasoo.admin.entity.TargetSale;
import beyond.samdasoo.user.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Optional;


public interface TargetSaleRepository extends JpaRepository<TargetSale, Long>, TargetSaleRepositoryCustom {

    List<TargetSale> findByUserAndYear(User user, int year);

    List<TargetSale> findByUserAndProductAndYear(User user, Product product, int year);

    @Query("SELECT ts.month, SUM(ts.monthTarget) " +
            "FROM TargetSale ts " +
            "WHERE ts.year = :year " +
            "GROUP BY ts.month " +
            "ORDER BY ts.month")
    List<Object[]> findMonthlyTargetSalesByYear(int year);
}
