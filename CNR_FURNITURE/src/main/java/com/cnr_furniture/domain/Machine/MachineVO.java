package com.cnr_furniture.domain.Machine;

import lombok.Data;

@Data
public class MachineVO {

    private int mi_id;  // 설비 번호
    private String mi_name; // 설비 이름
    private String mi_position; // 설비 위치
    private String mi_type; // 설비 유형
    private int rownum; // 목차 번호
    private  String pi_seq; //  공정에 있는 설비 위치

}
