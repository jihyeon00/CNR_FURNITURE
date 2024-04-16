package com.cnr_furniture.domain.work.workMNG;

import lombok.*;

/**
 * Work.jsp 의 자재투입내역 VO
 */
@Getter
@Setter
public class WorkSelectInsertMaterialVO {
    private int rn;
    private int w_lot_id;
    private int w_pi_id;
    private int ins_item_id;
    private int ct_company_id;
    private String c_name;
    private String inv_date;
    private int b_material_id;
    private String m_name;
    private String b_unit;
    private int inv_quantity;
}
