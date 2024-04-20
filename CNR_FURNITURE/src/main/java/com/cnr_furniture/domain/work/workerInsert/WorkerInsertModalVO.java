package com.cnr_furniture.domain.work.workerInsert;
import lombok.Getter;
import lombok.Setter;

/**
 * WorkerInsert.jsp 의 작업자관리 모달창 VO
 */
@Getter
@Setter
public class WorkerInsertModalVO {
    /** 작업번호에 따른 데이터 조회 */
    /* 모달창 1행 */
    private int edit_w_id;              // 작업번호

    /* 모달창 2행 */
    private int edit_w_lot_id;          // 제조로트번호
    private int edit_w_pi_id;           // 공정번호
    private int edit_pi_machine_id;     // 설비번호

    /* 모달창 3행 */
    private String edit_w_start_time;   // 작업시작시간
    private String edit_w_end_time;     // 작업종료시간

}
