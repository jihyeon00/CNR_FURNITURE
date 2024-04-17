package com.cnr_furniture.domain.contract;

import lombok.Getter;
import lombok.Setter;

/**
 * 계약 검색을 위한 클래스
 */
@Getter
@Setter
public class ContractSearch {
  private String find_item;                 // 제품명/번호 검색
  private String find_material;             // 자재명/번호 검색
  private String find_name;                 // 거래처명 검색
  private String find_contract_start_date;  // 계약날짜 검색 1
  private String find_contract_end_date;    // 계약날짜 검색 2
  private String find_ib_start_Date;        // 입고일 검색 1
  private String find_ib_end_Date;          // 입고일 검색 2
  private String find_ob_start_Date;        // 출고일 검색 1
  private String find_ob_end_Date;          // 출고일 검색 2
}
