package com.cnr_furniture.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.cnr_furniture.service.ProductionService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class ProductionController {
	
	@Autowired
    private ProductionService productionService;

    /**
     * Desc: 생산관리-생산현황
     * @return: production/productionStatus
     */
    
    @GetMapping("/productionStatus")
    public String productionStatus(){
        return "production/productionStatus";
    }
    
    /**
     * Desc: 생산관리-공정별 설비가동현황
     * @return: production/machineOperationStatusByProcess
     */
    
    @GetMapping("/machineOperationStatusByProcess")
    public String machineOperationStatusByProcess(){
    	return "production/machineOperationStatusByProcess";
    }
}
