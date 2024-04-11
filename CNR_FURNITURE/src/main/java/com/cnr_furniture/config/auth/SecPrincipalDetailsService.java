package com.cnr_furniture.config.auth;

import com.cnr_furniture.domain.member.MemberVO;
import com.cnr_furniture.mapper.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class SecPrincipalDetailsService implements UserDetailsService {
  @Autowired
  private MemberMapper memberMapper;

  @Override
  public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
    System.out.println("loadUserByUsername 메소드 호출");

    // DB 에서 user 정보를 가져옴
    MemberVO memberVO = memberMapper.selectByMember(email);
    if (memberVO == null) return null;

    return new SecPrincipalDetails(memberVO);
  }
}
