package com.cnr_furniture.controller;

import org.springframework.stereotype.Controller;
import lombok.extern.log4j.Log4j;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@Log4j
public class MaterialInfoController {


    @GetMapping("/materialInfo")
    public String materialInfo() {
        return "standardInfo/materialInfo";
    }
}
