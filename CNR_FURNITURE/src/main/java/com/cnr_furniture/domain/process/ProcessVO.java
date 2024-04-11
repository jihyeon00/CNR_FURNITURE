package com.cnr_furniture.domain.process;

import lombok.*;

import java.util.Date;

/**
 *제조지시 테이블 클래스
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProcessVO {
    private int rn;
    private int ins_lot_id;
    private int ins_item_id;
    private int ins_emp_id;
    private int ins_ct_id;
    private int ins_pi_id;
    private int ins_lot_size;
    private String ins_start_date;
    private String ins_end_date;
}


