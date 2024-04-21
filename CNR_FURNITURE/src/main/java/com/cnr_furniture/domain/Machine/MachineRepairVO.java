package com.cnr_furniture.domain.Machine;

import lombok.Data;

/**
 * 설비 수리 이력 관리 리스트로 보여주는 VO
 */
@Data
public class MachineRepairVO {
    private int rownum;         // 목차
    private int mr_mi_id;       //  설비 번호
    private String mi_name;     // 설비 이름
    private String mi_type;     // 설비 유형
    private String pi_seq;      // 공정 정보 테이블에 있는 라인별 공정위치
    private int mi_position;    // 설비 위치
    private String mcr_note;    // 수리 내용(비고)
    private String mr_date;     // 수리 날짜
}
