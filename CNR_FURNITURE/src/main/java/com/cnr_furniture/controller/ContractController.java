package com.cnr_furniture.controller;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import lombok.extern.log4j.Log4j;
import org.springframework.web.bind.annotation.GetMapping;

@AllArgsConstructor
@Controller
@Log4j
public class ContractController {

  /**
   * Desc: 계약 정보 조회 페이지
   * @return 계약 정보 조회 view page
   */
  @GetMapping("/contractInfo")
  public String contractInfo() {
    return "standardInfo/contractInfo";
  }
}
