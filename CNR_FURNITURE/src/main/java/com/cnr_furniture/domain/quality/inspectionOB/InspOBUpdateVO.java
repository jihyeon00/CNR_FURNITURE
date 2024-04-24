package com.cnr_furniture.domain.quality.inspectionOB;

import lombok.Data;

/**
 * [출하검사관리] - UPDATE 모달
 * '/inspectionOB'
 */
@Data
public class InspOBUpdateVO {
  private Long qiID;                // 수입검사번호(from QUALITY_INSPECTION 테이블)

  /* 수정 모달창 1행 */
  private Long workID;              // 작업번호

  /* 수정 모달창 2행 */
  private Long lotID;               // Lot번호
  private Long processID;           // 공정번호
  private Long productID;           // 제품번호

  /* 수정 모달창 3행 */
  private String productName;       // 제품명
  private String productColor;      // 제품색상
  private String productStandard;   // 제품규격

  /* 수정 모달창 4행 */
  private String unit;              // 단위
  private Long dailyWorkQuantity;   // 일일총작업수량(WORK 테이블: W_ITEM_QUANTITY)
  private Long inspectionQuantity;  // 검사수량(Quality_Inspection 테이블)

  /* 수정 모달창 5행 */
  private String qsDiv1;            // 불량유형1(Quality_Standard), [검색 keywork]
  private String qsDiv2;            // 불량유형2(Quality_Standard), [검색 keywork]
  private Long defectQuantity;      // 불량수량(Quality_Inspection 테이블)

  /* 수정 모달창 6행 */
  private String note;              // 비고(Quality_Inspection 테이블)
}
