package com.cnr_furniture.domain.materialMNG;

import lombok.Data;

@Data
public class MaterialMNGVO {
    /* 날짜 검색을 위한 파라미터들 */
    private String ShDateStart;
    private String ShDateEnd;
    private Integer ShOptionDate;
}
