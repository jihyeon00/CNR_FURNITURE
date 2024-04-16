package com.cnr_furniture.domain.Machine;

import lombok.Data;

@Data
public class MachineWorkVO {
    private int mw_mi_id;       // 설비 번호
    private String mw_status;   // 설비 가동 상태
    private String mw_condition;    // 설비 상태

}
