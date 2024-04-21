package com.cnr_furniture.controller;

import com.cnr_furniture.domain.production.search.ProductionSearchVO;
import com.cnr_furniture.domain.work.search.WorkSearchVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.cnr_furniture.service.ProductionService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class ProductionController {
    @Autowired
    private ProductionService productionService;

    /**
     * Decs: 검색용 데이터를 로드하는 메소드.
     */
    private void loadSearchData(ProductionSearchVO productionSearchVO, Model model) {
        model.addAttribute("companyList", productionService.findCompanyList());
        model.addAttribute("itemList", productionService.findItemList());
        model.addAttribute("instructionList", productionService.findInstructionList());
        model.addAttribute("processInfoList", productionService.findProcessInfoList());
        model.addAttribute("machineInfoList", productionService.findMachineInfoList());
    }
	
    /**
     * Desc: 생산관리-생산현황
     * @return: production/productionStatus
     */
    
    @GetMapping("/productionStatus")
    public String productionStatus(ProductionSearchVO productionSearchVO, Model model){

        loadSearchData(productionSearchVO, model); // 검색용 데이터 로드

        return "production/productionStatus";
    }
    
    /**
     * Desc: 생산관리-공정별 설비가동현황
     * @return: production/machineOperationStatusByProcess
     */
    
    @GetMapping("/machineOperationStatusByProcess")
    public String machineOperationStatusByProcess(ProductionSearchVO productionSearchVO, Model model){

        loadSearchData(productionSearchVO, model); // 검색용 데이터 로드

    	return "production/machineOperationStatusByProcess";
    }
}
