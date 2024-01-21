package kr.or.crud.vo;

import java.util.Date;

import lombok.Data;

@Data
public class subscriptionVO {

    private String subId;
    private String memId;
    private String serId;
    private Date subStartDate;
    private Date subEndDate;
    private int period;
    private String serName;
}
