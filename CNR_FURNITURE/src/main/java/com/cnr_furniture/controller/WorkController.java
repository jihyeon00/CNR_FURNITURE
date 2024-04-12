package com.cnr_furniture.controller;

import com.cnr_furniture.domain.process.ProcessDate;
import com.cnr_furniture.service.WorkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import lombok.extern.log4j.Log4j;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@Log4j

public class WorkController {
    @Autowired
    private WorkService workService;

    /**
     * Desc: 공정관리-작업관리-제조수행, 작업목록, 생산실적, 자재투입내역, 작업자 조회
     * @return: work/work
     */
    
    @GetMapping("/work")
    public String work(ProcessDate processDate, Model model){
        return "work/work";
    }
    
    /**
     * Desc: 공정관리-작업관리-당일작업등록-공정조회, 당일작업목록, 당일작업등록, 당일작업상세(수정), 당일작업삭제
     * @return: work/todayWorkInsert
     */
    
    @GetMapping("/todayWorkInsert")
    public String todayWorkInsert(){
    	return "work/todayWorkInsert";
    }
    
    /**
     * Desc: 공정관리-작업관리-당일작업등록-작업자등록-당일 작업자 배치 조회, 작업자등록
     * @return: work/todayWorkInsert
     */
    
    @GetMapping("/workerInsert")
    public String workerInsert(){
    	return "work/workerInsert";
    }

}
