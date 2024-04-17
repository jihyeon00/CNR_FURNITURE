package com.cnr_furniture.domain.work.todayWorkInsert;

import lombok.Getter;
import lombok.Setter;

/**
 * todayWorkInsert.jsp 의 공정별 설비상태 VO
 */

@Getter
@Setter
public class WorkProcessMachineVO {
    private int rn;
    private int pi_id;
    private String pi_name;
    private int pi_machine_id;
    private String mi_name;
    private String position;
    private String mw_status;
    private String mw_condition;
}
