package com.cnr_furniture.controller;

import org.springframework.stereotype.Controller;
import lombok.extern.log4j.Log4j;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@Log4j
public class BomController {
    @GetMapping("/bom")
    public String bomInfo() {
        return "standardInfo/bom";
    }

    @GetMapping("/bomInsert")
    public String bomInsert() {
        return "standardInfo/bomInsert";
    }

}
