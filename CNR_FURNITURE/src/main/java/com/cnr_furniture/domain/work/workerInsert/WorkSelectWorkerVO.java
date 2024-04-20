package com.cnr_furniture.domain.work.workerInsert;

import lombok.Getter;
import lombok.Setter;

/**
 * WorkerInsert.jsp 의 작업자배치 VO
 */
@Getter
@Setter
public class WorkSelectWorkerVO {
    private int rn;
    private int w_id;
    private String w_start_time;
    private String w_end_time;
    private int w_lot_id;
    private int w_pi_id;
    private String pi_name;
    private int pi_machine_id;
    private String mi_name;
    private String position;
    private String allemplist;
    private String substrallemp;
}
