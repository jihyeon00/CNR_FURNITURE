package com.cnr_furniture.domain.work;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 제품 테이블
 */

@Data
@AllArgsConstructor
@NoArgsConstructor
public class WorkSelectItemVO {
    private int I_ID;
    private String I_NAME;
    private String I_COLOR;
    private String I_STANDARD;
    private String I_TYPE;
    private String I_USES;
}
