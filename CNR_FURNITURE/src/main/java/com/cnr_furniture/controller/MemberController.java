package com.cnr_furniture.controller;

import org.springframework.stereotype.Controller;
import lombok.extern.log4j.Log4j;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@Log4j
public class MemberController {

  /**
   * Desc: 로그인 페이지
   * @return 로그인 view page
   */
  @GetMapping("/login")
  public String login() {
    return "member/login";
  }

  /**
   * Desc: 비밀번호변경 페이지
   * @return 비밀번호변경 view page
   */
  @GetMapping("/pwChange")
  public String pwChange() {


    return "member/pwChange";
  }

  /**
   * Desc: 사용자별 권한관리
   * @return 사용자별 권한관리 view page
   */
  @GetMapping("/memberRole")
  public String memberRole() {


    return "member/memberRole";
  }
}
