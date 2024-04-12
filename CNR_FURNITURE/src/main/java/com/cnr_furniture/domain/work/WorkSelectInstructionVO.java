package com.cnr_furniture.domain.work;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 제조계획 테이블
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class WorkSelectInstructionVO {
    private int ins_lot_id;
    private int ins_item_id;
    private int ins_emp_id;
    private int ins_ct_id;
    private int ins_pi_id;
    private int ins_lot_size;
    private String ins_start_date;
    private String ins_end_date;
}
