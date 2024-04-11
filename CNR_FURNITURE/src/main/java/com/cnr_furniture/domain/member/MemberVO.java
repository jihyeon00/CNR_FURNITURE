package com.cnr_furniture.domain.member;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MemberVO {
  private String id;        // 사원 번호
  private String name;      // 사원 이름
  private String email;     // 사원 이메일 [ ~ @ ~.com 형식]
  private String ph;        // 사원 연락처
  private String password;       // 사원 비밀번호
  private String dp_name;   // 사원 부서이름 [생산(1,2,3)팀, 품질(1,2)팀, 재고(1,2)팀, 설비팀, 기획팀]
  private String role;      // 사원 권한 [디렉터(Director)/매니저(manager)/사원()]

  @Builder
  public MemberVO(String name, String email, String password, String role, String ph, String dp_name) {
    this.name = name;
    this.email = email;
    this.password = password;
    this.role = role;
    this.ph = ph;
    this.dp_name = dp_name;
  }
}
