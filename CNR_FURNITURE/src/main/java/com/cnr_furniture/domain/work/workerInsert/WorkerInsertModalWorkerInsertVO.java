package com.cnr_furniture.domain.work.workerInsert;
import lombok.Getter;
import lombok.Setter;

/**
 * WorkerInsert.jsp 의 작업자관리 모달창 - 작업자등록 VO
 */
@Getter
@Setter
public class WorkerInsertModalWorkerInsertVO {
    private int edit_w_id;
    private String edit_w_start_time;
    private String edit_w_end_time;
    private int edit_w_emp_id;

    private int wr_work_id;
    private String wr_start_time;
    private String wr_end_time;
    private int wr_emp_id;

}
