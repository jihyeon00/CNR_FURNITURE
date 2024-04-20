package com.cnr_furniture.domain.work.workerInsert;

import lombok.Getter;
import lombok.Setter;

/**
 * WorkerInsert.jsp 의 작업자관리 모달창 - 작업번호에 따른 작업자 정보 조회를 위한 VO
 */
@Getter
@Setter
public class WorkerInsertModalSelectWorkerInfoByWorkIdVO {
    private int edit_w_id;               // 작업번호
    private String workerInfoDpName;     // 부서명
    private int workerInfoEmpId;         // 사원번호
    private String workerInfoEmpName;    // 사원명
    private String workerInfoEmpRole;    // 직급
}
