package com.cnr_furniture.controller;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import lombok.extern.log4j.Log4j;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@Log4j
@AllArgsConstructor
public class MaterialMNGController {
    /* 날짜 검색 - 생성자 주입 */
    /*private MaterialMNGVO materialMNGVO;
    private Constants constants;*/

    /**
     * Desc: 자재관리-자재입고현황-조회
     * @return: materialManagement/materialIB
     */
    @GetMapping("/materialIB")      // localhost:8085/materialIB
    public String materialIB() throws Exception {
        /* 날짜 검색 */
        /*materialMNGVO.setShOptionDate(materialMNGVO.getShOptionDate() == null ? 1 : materialMNGVO.getShOptionDate());
        materialMNGVO.setShDateStart(materialMNGVO.getShDateStart() == null ? UtilDateTime.calculateDayString(UtilDateTime.nowLocalDateTime(), constants.DATE_INTERVAL) : materialMNGVO.getShDateStart());
        materialMNGVO.setShDateEnd(materialMNGVO.getShDateEnd() == null ? UtilDateTime.nowString() : materialMNGVO.getShDateEnd());*/
        return "materialManagement/materialIB";
    }

    /**
     * Desc: 자재관리-자재출고현황-조회
     * @return: materialManagement/materialOB
     */
    @GetMapping("/materialOB")      // localhost:8085/materialOB
    public String materialOB() {
        return "materialManagement/materialOB";
    }

    /**
     * Desc: 자재관리-자재재고-조회
     * @return: materialManagement/materialInventory
     */
    @GetMapping("/materialInventory")   // localhost:8085/materialInventory
    public String materialInventory() {
        return "materialManagement/materialInventory";
    }

    /**
     * Desc: 자재관리-발주정보-조회
     * @return: materialManagement/materialContractInfo
     */
    @GetMapping("/materialContractInfo")    // localhost:8085/materialInventory
    public String materialContractInfo() {
        return "materialManagement/materialContractInfo";
    }
}
