package com.cnr_furniture.domain.Machine;

import lombok.Data;

@Data
public class MachineCheckVO {
    private int mci_id;     // 체크리스트 기준 번호
    private int mci_mi_id;  // 설비 번호
    private String mci_div;         // 유형
    private String mci_condition;   // 조건
    private String mci_method;      // 방법

    private String rownum;      // 목차 번호


    private String modalAddNumber;  // 체크리스트 기준 번호
    private String modalAddTypeCheck;  // 체크리스트 유형
    private String modalAddMethod;  // 체크리스트 방법
    private String modalAddCondition;  // 체크리스트 조건

}
