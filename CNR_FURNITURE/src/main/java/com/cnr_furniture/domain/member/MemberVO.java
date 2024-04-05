package com.cnr_furniture.domain.member;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class MemberVO {
  private String E_ID;        // 사원 번호
  private String E_NAME;      // 사원 이름
  private String E_EMAIL;     // 사원 이메일 [ ~ @ ~.com 형식]
  private String E_PH;        // 사원 연락처
  private String E_PWD;       // 사원 비밀번호
  private String E_DP_NAME;   // 사원 부서이름 [생산(1,2,3)팀, 품질(1,2)팀, 재고(1,2)팀, 설비팀, 기획팀]
  private String E_ROLE;      // 사원 권한 [디렉터(Director)/매니저(manager)/사원()]

}
