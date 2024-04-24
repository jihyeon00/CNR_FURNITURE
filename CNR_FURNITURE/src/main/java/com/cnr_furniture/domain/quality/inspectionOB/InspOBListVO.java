package com.cnr_furniture.domain.quality.inspectionOB;

import lombok.Data;

import java.math.BigDecimal;

/**
 * [출하검사관리] - 검색 및 현황(목록) 조회
 * '/inspectionOB'
 */
@Data
public class InspOBListVO {
  private Long qiID;                // 검사번호(수정할 때, 보내줘야함)
  private Long listSeq;             // 순서
  private Long productID;           // 제품번호

  private Long lotID;               // Lot번호
  private Long processID;           // 공정번호
  private Long workID;              // 작업번호

  private String productName;       // 제품명
  private String productColor;      // 제품색상
  private String productStandard;   // 제품규격
  
  private String unit;              // 단위
  private Long dailyWorkQuantity;   // 일일총작업수량(WORK 테이블: W_ITEM_QUANTITY)
  private Long inspectionQuantity;  // 검사수량(Quality_Inspection 테이블)
  private Long defectQuantity;      // 불량수량(Quality_Inspection 테이블)
  // Long: 정수형이므로, 불량률(소숫점) 표현에 적합하지 않음.
  // BigDecimal: 금융이나 정밀 계산이 필요한 애플리케이션에서 BigDecimal을 사용하면 더욱 정확한 계산이 가능
  private BigDecimal defectRate;    // 불량률 = (불량품 수 / 검사수량) * 100
  private Long goodQuantity;        // 양품수량(Quality_Inspection 테이블)
  private String qsDiv1;            // 불량유형1(Quality_Standard), [검색 keywork]
  private String qsDiv2;            // 불량유형2(Quality_Standard), [검색 keywork]
  private String inspectionDate;    // 검사일자
  private String note;              // 비고(Quality_Inspection 테이블)
}
