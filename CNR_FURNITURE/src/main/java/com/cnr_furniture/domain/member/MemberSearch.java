package com.cnr_furniture.domain.member;

import lombok.Getter;
import lombok.Setter;

/**
 *검색을 위한 클래스
 */
@Getter
@Setter
public class MemberSearch {
  private String type;            // 이름/번호 선택
  private String keyword;         // 검색 입력값

  private String find_DP_name;    // 부서 선택
  private String find_emp_name;   // 사원이름 검색
  private String find_Role;       // 권한 선택


  // type [select name='type' option value="D"|"E"  ]
  public String[] getTypeArr() {
    return type == null ? new String[] {} : type.split("");
  }
}
