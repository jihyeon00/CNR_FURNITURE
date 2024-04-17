package com.cnr_furniture.domain.contract;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ContractVO {
  private String id;             // 계약 번호
  private String company_id;     // 거래처 번호
  private String company_name;   // 거래처 명
  private String material_id;    // 자재 번호
  private String material_name;  // 자재 명
  private String item_id;        // 제품 번호
  private String item_name;      // 제품 명
  private String c_div;            // 계약 구분
  private String money;          // 계약 금액
  private String c_date;         // 계약 체결 날짜
  private String unit;           // 단위
  private String quantity;       // 계약 수량
  private String real_quantity;  // 실제 수량
  private String ib_date;        // 계약입고일
  private String ob_date;        // 계약출고일
  private String real_ib_date;   // 실제입고일
  private String real_ob_date;   // 실제출고일
}
