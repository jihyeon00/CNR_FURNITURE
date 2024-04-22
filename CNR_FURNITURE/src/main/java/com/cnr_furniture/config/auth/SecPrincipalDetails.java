package com.cnr_furniture.config.auth;

import com.cnr_furniture.domain.member.MemberVO;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Map;

public class SecPrincipalDetails implements UserDetails {

  private MemberVO memberVO;
  private Map<String, Object> attrs;

  // 일반 로그인시 사용
  public SecPrincipalDetails(MemberVO memberVO) {
    this.memberVO = memberVO;
  }

  public MemberVO getMemberVO() {
    return memberVO;
  }

  /** 계정이 갖고있는 권한 목록은 리턴 **/
  @Override
  public Collection<? extends GrantedAuthority> getAuthorities() {
    Collection<GrantedAuthority> collect = new ArrayList<>();
    collect.add(() -> {
      return memberVO.getRole();      // ROLE_Director 문자열을 가져온다
    });

    return collect;
  }

  @Override
  public String getPassword() {
    return memberVO.getPassword();
  }

  @Override
  public String getUsername() {
    return memberVO.getEmail();
  }

  /** 계정이 만료되지 않았는지 리턴 (true: 만료 안됨) **/
  @Override
  public boolean isAccountNonExpired() {
    return true;
  }

  /** 계정이 잠겨있는지 않았는지 리턴 (true: 잠기지 않음) **/
  @Override
  public boolean isAccountNonLocked() {
    return true;
  }

  /** 비밀번호가 만료되지 않았는지 리턴 (true: 만료 안됨) **/
  @Override
  public boolean isCredentialsNonExpired() {
    return true;
  }

  /** 계정이 활성화(사용가능)인지 리턴 (true: 활성화) **/
  @Override
  public boolean isEnabled() {
    return true;
  }


}
