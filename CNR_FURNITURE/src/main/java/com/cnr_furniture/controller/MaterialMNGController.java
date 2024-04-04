package com.cnr_furniture.controller;

import org.springframework.stereotype.Controller;
import lombok.extern.log4j.Log4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Log4j
public class MaterialMNGController {
    /* 자재관리-자재입고현황-조회 */
    /* localhost:8085/materialIB */
    @GetMapping("/materialIB")
    public String materialMNG() {
        return "materialManagement/materialIB";
    }

}
