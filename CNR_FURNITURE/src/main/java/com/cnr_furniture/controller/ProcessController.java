package com.cnr_furniture.controller;

import org.springframework.stereotype.Controller;
import lombok.extern.log4j.Log4j;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@Log4j
public class ProcessController {

    /*제조지시*/
    @GetMapping("/manufacturingInstruction")
    public String Process(){
        return "process/manufacturingInstruction";
    }

    /*제조수행지시*/
    @GetMapping("/manufacturingPerform")
    public String processPlan(){
        return "process/manufacturingPerform";
    }

    /*공정정보*/
    @GetMapping("/processInfo")
    public String processInfo(){
        return "process/processInfo";
    }


}
