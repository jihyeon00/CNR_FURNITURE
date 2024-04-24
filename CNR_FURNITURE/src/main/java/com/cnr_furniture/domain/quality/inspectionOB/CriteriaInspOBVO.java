package com.cnr_furniture.domain.quality.inspectionOB;

import lombok.Data;

import java.math.BigDecimal;

/**
 * [출하검사관리] - 검색용
 * '/inspectionOB'
 */
@Data
public class CriteriaInspOBVO {
  // 페이지 상단 - 검색용
  private Long lotID;         // lot번호
  private Long productID;     // 제품번호
  private String productName; // 제품명
  private String qsDiv1;      // 불량유형1
  private String qsDiv2;      // 불량유형2
  private Long workID;        // 작업번호
  private Long processID;     // 공정번호

  /* inspectionOB 검색 옵션 */
  public CriteriaInspOBVO() {}
  public CriteriaInspOBVO(
          // 검색용
          Long lotID,
          Long productID,
          String productName,
          String qsDiv1,
          String qsDiv2,
          Long workID,
          Long processID
  ) {
    this.lotID = lotID;
    this.productID = productID;
    this.productName = productName;
    this.qsDiv1 = qsDiv1;
    this.qsDiv2 = qsDiv2;
    this.workID = workID;
    this.processID = processID;
  }

}
