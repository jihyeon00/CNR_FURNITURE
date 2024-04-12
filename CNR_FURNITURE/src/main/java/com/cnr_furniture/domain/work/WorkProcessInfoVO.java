package com.cnr_furniture.domain.work;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Work.jsp 의 제조수행정보 VO
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class WorkProcessInfoVO {
    private int RN;
    private int P_PI_ID;
    private int P_LOT_ID;
    private int INS_LOT_ID;
    private int P_B_ITEM_ID;
    private String I_NAME;
    private String C_ID;
    private String C_NAME;
    private String P_START_DATE;
    private String P_END_DATE;
    private String P_STATUS;
    private int P_PLAN_QUANTITY;
    private int P_ITEM_QUANTITY;
    private int P_DEFECTIVE_QUANTITY;
    private String CT_UNIT;
}
