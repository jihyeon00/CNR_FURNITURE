package com.cnr_furniture.controller;

import com.cnr_furniture.domain.process.*;
import com.cnr_furniture.service.ProcessService;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.List;

@Controller
public class ProcessController {

    @Autowired
    private ProcessService processService;

    /* 제조지시 검색(날짜, 제품) */
    @GetMapping("/manufacturingInstruction")
    public String manufacturingInstruction(ProcessDate processDate, Model model) {
        List<ProcessVO> processVOList = processService.selectProcess(processDate);
        List<ProcessItemVO> itemProList = processService.findAllItems(); // 아이템 정보 조회
        List<ProcessInfoVO> piProList= processService.findAllPi(); //공정 정보 조회
        List<ProcessCtVO> ctProList= processService.findAllProCt(); //계약 정보 조회
        model.addAttribute("proList", processVOList);
        model.addAttribute("itemProList", itemProList); // 모델에 아이템 정보 추가
        model.addAttribute("piProList", piProList); // 모델에 공정 정보 추가
        model.addAttribute("ctProList", ctProList); // 모델에 계약 정보 추가
        model.addAttribute("processDate", processDate);
        return "process/manufacturingInstruction";
    }


    /*제조수행지시*/
    @GetMapping("/manufacturingPerform")
    public String processPlan() {
        return "process/manufacturingPerform";
    }

    /*공정정보*/
    @GetMapping("/processInfo")
    public String processInfo() {
        return "process/processInfo";
    }

}
