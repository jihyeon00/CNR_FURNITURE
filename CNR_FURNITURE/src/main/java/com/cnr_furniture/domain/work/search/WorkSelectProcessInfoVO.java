package com.cnr_furniture.domain.work.search;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


/**
 * 공정 정보 테이블 + 설비테이블의 설비명, 위치
 */

@Data
@AllArgsConstructor
@NoArgsConstructor
public class WorkSelectProcessInfoVO {
    private int pi_id;
    private int pi_machine_id;
    private String pi_name;
    private String mi_name;
    private String position;
}
