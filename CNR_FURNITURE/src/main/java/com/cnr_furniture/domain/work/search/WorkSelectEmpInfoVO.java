package com.cnr_furniture.domain.work.search;

import lombok.Getter;
import lombok.Setter;

/**
 * 사원 테이블 VO
 */
@Getter
@Setter
public class WorkSelectEmpInfoVO {
    private String e_dp_name;
    private int e_id;
    private String e_name;
    private String e_role;
}