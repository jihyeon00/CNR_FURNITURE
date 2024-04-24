package com.cnr_furniture.domain.inventory;

import lombok.Data;

@Data
public class ItemInventoryListVO {
  private Long listSeq;         // 순서
  private Long itemID;          // 제품번호
  private String itemUses;      // 제품용도
  private String itemStandard;  // 제품규격
  private String itemName;      // 제품명
  private String unit;          // 단위
  private Long quantity;        // 재고수량
}
