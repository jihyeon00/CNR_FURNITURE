package com.cnr_furniture.domain.production.search;

import lombok.Getter;
import lombok.Setter;

/**
 * 제품 테이블
 */

@Getter
@Setter
public class ProductionSelectItemVO {
    private int itemId;
    private String itemName;
    private String itemColor;
    private String itemStandard;
    private String itemType;
    private String itemUses;
}
