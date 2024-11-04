package beyond.samdasoo.plan.entity;

import beyond.samdasoo.calendar.entity.Calendar;
import beyond.samdasoo.common.entity.BaseEntity;
import beyond.samdasoo.user.entity.User;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

@Data
@Entity
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Table(name="tb_plan")
public class Plan extends BaseEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long no;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "calendar_no", nullable = false)
    private Calendar calendar;

    @Column(name = "personal_yn", nullable = false, length = 1)
    private String personalYn;

    @Column(name = "plan_cls", nullable = false)
    @Enumerated(EnumType.STRING)
    private PlanStatus planCls;

    @Column(name = "plan_date", nullable = false)
    private LocalDate planDate;

    @Column(name = "title")
    private String title;

    @Column(name = "start_time")
    private String startTime;

    @Column(name = "end_time")
    private String endTime;

    @Column(name = "content")
    private String content;

    @Column(name = "domain_no")
    private Long domainNo;
}
