package com.cnr_furniture.domain.process;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 *공정 테이블 클래스
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProcessInfoVO {
    private int rn;
    private int pi_id;
    private int pi_machine_id;
    private String pi_name;
    private String pi_seq;
}
