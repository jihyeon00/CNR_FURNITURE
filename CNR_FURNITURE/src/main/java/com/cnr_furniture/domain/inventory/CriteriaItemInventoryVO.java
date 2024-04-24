package com.cnr_furniture.domain.inventory;

import lombok.Data;

@Data
public class CriteriaItemInventoryVO {
  private Long itemID;          // 제품번호
  private String itemName;      // 제품명
  private String itemStandard;  // 제품규격
  private String itemUses;      // 제품용도

  public CriteriaItemInventoryVO() {}
  public CriteriaItemInventoryVO(
          Long itemID,
          String itemName,
          String itemStandard,
          String itemUses
  ) {
    this.itemID =itemID;
    this.itemName = itemName;
    this.itemStandard = itemStandard;
    this.itemUses = itemUses;
  }
}
