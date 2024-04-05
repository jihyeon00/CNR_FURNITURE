package com.cnr_furniture.controller;

import org.springframework.stereotype.Controller;
import lombok.extern.log4j.Log4j;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@Log4j
public class ProcessController {
    @GetMapping("/process")
    public String Process(){
        return "process/instruction";
    }

    @GetMapping("/processPlan")
    public String processPlan(){
        return "process/instructionPlan";
    }


}
