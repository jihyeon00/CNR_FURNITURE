package com.cnr_furniture.domain.work.workMNG;

import lombok.*;

/**
 * Work.jsp 의 자재투입수정 VO
 */
@Getter
@Setter
public class WorkUpdateMaterialModalVO {
    private int inv_lot_id;
    private int inv_pi_id;
    private int inv_material_id;
    private int inv_quantity;
    private int updateInvQuantity;
}
