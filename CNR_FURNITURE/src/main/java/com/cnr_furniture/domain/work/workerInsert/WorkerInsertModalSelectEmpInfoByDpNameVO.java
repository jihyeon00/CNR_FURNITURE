package com.cnr_furniture.domain.work.workerInsert;
import lombok.Getter;
import lombok.Setter;

/**
 * WorkerInsert.jsp 의 작업자관리 모달창 - 부서명에 따른 사원번호 조회를 위한 VO
 */
@Getter
@Setter
public class WorkerInsertModalSelectEmpInfoByDpNameVO {
    private String edit_dp_name;        // 부서명
    private int edit_emp_id;            // 사원이름
    private String edit_e_name;         // 사원명
    private String edit_e_role;         // 직급
}
