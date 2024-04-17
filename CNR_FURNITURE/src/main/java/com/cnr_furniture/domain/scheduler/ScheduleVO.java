package com.cnr_furniture.domain.scheduler;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class ScheduleVO {
    
    private int rn; //번호순서

    private int e_id; //employee 사원번호
    private String e_name; //employee 사원명
    private String e_dp_name; //employee 부서명


    private int wr_emp_id; //worker 사원번호
    private int wr_work_id; // worker 작업번호
    private String wr_start_time; // worker 시작날짜
    private String wr_end_time; // worker 종료날짜

}
