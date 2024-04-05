package com.cnr_furniture.controller;

import org.springframework.stereotype.Controller;
import lombok.extern.log4j.Log4j;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@Log4j
public class ProcessController {

    /*제조지시*/
    @GetMapping("/process")
    public String Process(){
        return "process/instruction";
    }

    /*제조수행지시*/
    @GetMapping("/processPlan")
    public String processPlan(){
        return "process/instructionPlan";
    }

    /*공정정보*/
    @GetMapping("/processInfo")
    public String processInfo(){
        return "process/processInfo";
    }


}
