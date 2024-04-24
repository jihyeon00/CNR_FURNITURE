package com.cnr_furniture.domain.quality.defectiveProcess;

import lombok.Data;

@Data
public class CriteriaDftProcessVO {
  private Long lotID; // 제조LOT번호
  private Long processID;  // 공정번호
  private String qsDiv1;  // 불량유형1
  private String qsDiv2;  // 불량유형2
  private String inspectionDate1;
  private String inspectionDate2;

  /* 검색옵션 */
  public CriteriaDftProcessVO() {}
  public CriteriaDftProcessVO(
          Long lotID,
          Long processID,
          String qsDiv1,
          String qsDiv2,
          String inspectionDate1,
          String inspectionDate2
  ) {
    this.lotID = lotID;
    this.processID = processID;
    this.qsDiv1 = qsDiv1;
    this.qsDiv2 = qsDiv2;
    this.inspectionDate1 = inspectionDate1;
    this.inspectionDate2 = inspectionDate2;
  }
}
