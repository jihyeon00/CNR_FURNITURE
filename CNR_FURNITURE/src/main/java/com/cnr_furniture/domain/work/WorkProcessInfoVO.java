package com.cnr_furniture.domain.work;

import lombok.*;

/**
 * Work.jsp 의 제조수행정보 VO
 */
@Getter
@Setter
public class WorkProcessInfoVO {
    private int rn;
    private int p_lot_id;
    private int ins_lot_id;
    private int p_pi_id;
    private String pi_name;
    private int p_b_item_id;
    private String i_name;
    private String c_id;
    private String c_name;
    private String p_start_date;
    private String p_end_date;
    private String p_status;
    private int p_plan_quantity;
    private int p_item_quantity;
    private int p_defective_quantity;
    private String ct_unit;
}
