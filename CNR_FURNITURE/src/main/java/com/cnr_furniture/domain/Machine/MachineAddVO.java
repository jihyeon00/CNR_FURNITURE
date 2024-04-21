package com.cnr_furniture.domain.Machine;

import lombok.Data;

/**
 * 설비 등록 VO
 */
@Data
public class MachineAddVO {

    private String modalAddName;    // 설비 이름
    private String modalAddType;    // 설비 유형
    private String modalUpdatePosition; // 설비 위치
    private String modalUpdateNumber;   // 설비 번호


}
