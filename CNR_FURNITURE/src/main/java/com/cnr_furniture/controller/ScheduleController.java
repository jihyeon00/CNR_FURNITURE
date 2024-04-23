package com.cnr_furniture.controller;

import com.cnr_furniture.domain.bom.BomVO;
import com.cnr_furniture.domain.scheduler.ScheduleSearch;
import com.cnr_furniture.domain.scheduler.ScheduleVO;
import com.cnr_furniture.service.ScheduleService;
import jakarta.servlet.http.HttpServletRequest;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.Calendar;
import java.util.List;

@Controller
@Log4j
public class ScheduleController {

    @Autowired
    ScheduleService scheduleService;

    /**
     * Desc:  작업자관리 목록
     * @return "process/workerManagement"
     */
    @GetMapping("/D/process/workerManagement")
    public String workerManagement(ScheduleSearch scheduleSearch, Model model
    ) {
        List<ScheduleVO> workerList = scheduleService.getWorkerList(scheduleSearch);
        model.addAttribute("workerList", workerList);
        model.addAttribute("workerSearch", scheduleSearch);

        List<ScheduleVO> scheduleList = scheduleService.getScheduleAll();
        model.addAttribute("schedule", scheduleList);

        return "process/workerManagement";
    }

    /**
     * Desc: 사원의 모든 일정
     * @return: /schedule
     */
    @ResponseBody
    @GetMapping("/schedule")
    public List<ScheduleVO> getScheduleAll() {
        List<ScheduleVO> scheduleList = scheduleService.getScheduleAll();
        return scheduleList;
    }






}
