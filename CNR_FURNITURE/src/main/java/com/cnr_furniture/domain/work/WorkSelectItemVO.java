package com.cnr_furniture.domain.work;

import lombok.*;

/**
 * 제품 테이블
 */

@Getter
@Setter
public class WorkSelectItemVO {
    private int itemId;
    private String itemName;
    private String itemColor;
    private String itemStandard;
    private String itemType;
    private String itemUses;
}
