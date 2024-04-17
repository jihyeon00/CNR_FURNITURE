package com.cnr_furniture.controller;

import com.cnr_furniture.domain.CompanyVO;
import com.cnr_furniture.domain.member.MemberSearch;
import com.cnr_furniture.mapper.CompanyMapper;
import com.cnr_furniture.service.CompanyService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import lombok.extern.log4j.Log4j;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import java.util.List;

@AllArgsConstructor
@Controller
@Log4j
public class CompanyController {
  private CompanyService companyService;

  /**
   * Desc: 거래처정보 조회 페이지
   * @return 거래처정보 조회 view page
   */
  @GetMapping("/companyInfo")
  public String companyInfo(MemberSearch search, Model model) {
    // 검색창
    model.addAttribute("search", search);
    // 거래처 정보 조회
    List<CompanyVO> CompanyList = companyService.getCompanyList(search);
    model.addAttribute("CompanyList", CompanyList);
    // 거래처명 리스트
    List<CompanyVO> CompanyNameList = companyService.CompanyNameList();
    model.addAttribute("CompanyNameList", CompanyNameList);
    return "standardInfo/companyInfo";
  }
}
