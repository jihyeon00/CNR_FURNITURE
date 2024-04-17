package com.cnr_furniture.domain.member;

import lombok.Getter;
import lombok.Setter;

/**
 * 사원 검색을 위한 클래스
 */
@Getter
@Setter
public class MemberSearch {
  private String find_DP_name;    // 부서 선택
  private String find_emp_name;   // 사원이름 검색
  private String find_Role;       // 권한 선택
  private String find_c_div;      // 거래처 구분 선택
  private String find_c_name;     // 거래처명 선택
}
