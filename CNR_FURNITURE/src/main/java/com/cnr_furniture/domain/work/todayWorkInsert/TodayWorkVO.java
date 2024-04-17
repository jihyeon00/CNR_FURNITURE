package com.cnr_furniture.domain.work.todayWorkInsert;

import lombok.Getter;
import lombok.Setter;

/**
 * todayWorkInsert.jsp 의 당일작업목록 VO
 */

@Getter
@Setter
public class TodayWorkVO {
    // 당일작업목록
    private int rn;
    private int w_id;
    private int w_lot_id;
    private String w_date;
    private String e_dp_name;
    private int w_pi_id;
    private String pi_name;
    private String mi_name;
    private String position;
    private int ins_item_id;
    private String i_name;
    private String w_status;
    private String i_standard;
    private String ct_unit;
    private String w_time;
    private int w_plan_quantity;
    private int w_item_quantity;
}
