package com.cnr_furniture.controller;

import com.cnr_furniture.domain.CompanyVO;
import com.cnr_furniture.domain.MaterialInfo.MaterialInfoVO;
import com.cnr_furniture.domain.contract.ContractSearch;
import com.cnr_furniture.domain.contract.ContractVO;
import com.cnr_furniture.domain.work.search.WorkSelectItemVO;
import com.cnr_furniture.service.CompanyService;
import com.cnr_furniture.service.ContractService;
import com.cnr_furniture.service.WorkService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import lombok.extern.log4j.Log4j;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@AllArgsConstructor
@Controller
@Log4j
public class ContractController {
  private ContractService contractService;
  private CompanyService companyService;
  private WorkService workService;

  /**
   * Desc: 계약 정보 조회 페이지
   * @return 계약 정보 조회 view page
   */
  @GetMapping("/standardInfo/contractInfo")
  public String contractInfo(ContractSearch search, Model model) {
    // 검색창
    model.addAttribute("search", search);
    // 계약 조회
    List<ContractVO> ContractList = contractService.selectByContract(search);
    model.addAttribute("ContractList", ContractList);
    // 검색을 위한 거래처 리스트
    List<CompanyVO> CompanyNameList = companyService.CompanyNameList();
    model.addAttribute("CompanyNameList", CompanyNameList);
    // 검색을 위한 제품 리스트
    List<WorkSelectItemVO> itemList = workService.findItemList();
    model.addAttribute("itemList", itemList);
    // 검색을 위한 자재 리스트
    List<MaterialInfoVO> materialList = contractService.materialList();
    model.addAttribute("materialList", materialList);
    return "standardInfo/contractInfo";
  }
}
