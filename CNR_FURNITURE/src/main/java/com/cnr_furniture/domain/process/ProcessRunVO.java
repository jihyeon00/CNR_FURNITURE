package com.cnr_furniture.domain.process;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 *제조수행 테이블 클래스
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProcessRunVO {
    private int rn;
    private int p_lot_id;
    private int p_pi_id;
    private int p_b_item_id;
    private int p_plan_quantity;
    private int p_item_quantity;
    private int p_defective_quantity;
    private String p_start_date;
    private String P_end_date;
    private String p_Status;
    private String p_note;
}
