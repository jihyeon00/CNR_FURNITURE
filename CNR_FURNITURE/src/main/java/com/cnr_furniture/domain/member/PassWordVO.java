package com.cnr_furniture.domain.member;

import lombok.Getter;
import lombok.Setter;

/**
 *비밀번호 변경을 위한 클래스
 */
@Getter
@Setter
public class PassWordVO {
  private String email;     // 사원 이메일 [ ~ @ ~.com 형식]
  private String password;  // 사원 비밀번호
}