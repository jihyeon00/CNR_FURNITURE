package com.cnr_furniture.controller;

import com.cnr_furniture.domain.CompanyVO;
import com.cnr_furniture.domain.member.MemberSearch;
import com.cnr_furniture.mapper.CompanyMapper;
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
  private CompanyMapper companyMapper;

  /**
   * Desc: 거래처정보 조회 페이지
   * @return 거래처정보 조회 view page
   */
  @GetMapping("/companyInfo")
  public String companyInfo(MemberSearch search, Model model) {
    // 검색창
    model.addAttribute("search", search);

    List<CompanyVO> getCompanyList = companyMapper.getCompanyList(search);
    model.addAttribute("getCompanyList", getCompanyList);

    return "standardInfo/companyInfo";
  }
}
