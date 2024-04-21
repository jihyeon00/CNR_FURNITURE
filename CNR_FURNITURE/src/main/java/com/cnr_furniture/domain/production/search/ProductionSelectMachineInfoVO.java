package com.cnr_furniture.domain.production.search;

import lombok.Getter;
import lombok.Setter;

/**
 * 설비정보 테이블
 */

@Getter
@Setter
public class ProductionSelectMachineInfoVO {
    private int mi_id;
    private String mi_name;
    private String position;
}
