package com.cnr_furniture.controller;

import com.cnr_furniture.service.WorkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import lombok.extern.log4j.Log4j;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@Log4j
public class WorkController {
    @Autowired
    private WorkService workService;

    @GetMapping("/work")
    public String work(){
        return "work/work";
    }

}
