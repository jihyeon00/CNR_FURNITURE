package com.cnr_furniture.domain.work.search;
import lombok.*;


/**
 * work 테이블
 */

@Getter
@Setter
public class WorkSelectWorkVO {
    private int w_id;
    private int w_lot_id;
    private int w_pi_id;
    private String w_start_time;
    private String w_end_time;
    private int w_time;
    private String w_status;
    private int w_plan_quantity;
    private int w_item_quantity;
    private String w_note;
    private int w_dft_quantity;
}
