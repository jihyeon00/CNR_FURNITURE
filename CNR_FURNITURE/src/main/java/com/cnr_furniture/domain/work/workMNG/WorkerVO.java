package com.cnr_furniture.domain.work.workMNG;

import lombok.Getter;
import lombok.Setter;

/**
 * Work.jsp 의 작업자 VO
 */
@Getter
@Setter
public class WorkerVO {
    private int rn;
    private String e_dp_name;
    private String e_name;
    private String e_role;
    private int wr_emp_id;
    private int w_lot_id;
    private int w_pi_id;
    private String position;
    private String wr_start_time;
    private String wr_end_time;
}
