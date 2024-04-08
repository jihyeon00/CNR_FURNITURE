package com.cnr_furniture.controller;

import org.springframework.stereotype.Controller;
import lombok.extern.log4j.Log4j;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@Log4j
public class QualityController {
    /**
     * Desc: 품질관리-수입검사관리(자재IB)
     * @return: qualityInspection/IBInspection
     */
    @GetMapping("/IBInspection")
    public String ibInspection() {
        return "qualityInspection/IBInspection";
    }

}
