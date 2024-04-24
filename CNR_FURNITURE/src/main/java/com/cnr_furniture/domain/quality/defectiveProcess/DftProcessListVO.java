package com.cnr_furniture.domain.quality.defectiveProcess;

import lombok.Data;

import java.math.BigDecimal;

@Data
public class DftProcessListVO {
  private Long lotID;
  private Long processID;
  private String qsDiv1;
  private String qsDiv2;
  private String inspectionDate1;
  private String inspectionDate2;

  private Long listSeq;
  private String productName;
  private String unit;

  private Long totalWorkQuantity;
  private Long totalGoodQuantity;
  private Long totalDefectQuantity;

  // Long: 정수형이므로, 불량률(소숫점) 표현에 적합하지 않음.
  // BigDecimal: 금융이나 정밀 계산이 필요한 애플리케이션에서 BigDecimal을 사용하면 더욱 정확한 계산이 가능
  private BigDecimal defectRate;    // 불량률 = (불량품 수 / 검사수량) * 100

}
