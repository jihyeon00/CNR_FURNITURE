package com.cnr_furniture.domain.Machine;

import lombok.Data;

/**
 * 설비 가동 현황 VO
 */
@Data
public class MachineWorkVO {
    private int mw_mi_id;           // 설비 번호
    private String mw_status;       // 설비 가동 상태
    private String mw_condition;    // 설비 상태
    private String mi_name;         // 설비 이름
    private String  mi_type;        // 설비 유형
    private String pi_seq;          // 공정 정보 테이블에 있는 라인별 공정위치
    private String mi_position;        // 설비 위치
    private String w_start_time;    // 작동 시작 시간
    private String w_end_time;      // 작동 종료 시간
    private int rownum;             // 목차


    private int mcr_mi_id;

}
