package beyond.samdasoo.customer.dto;


import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class PopupCustomerGetRes {
    private Long CustomerNo;
    private String name;
    private String company;
    private String dept;
    private String position;
    private String userName;
}
