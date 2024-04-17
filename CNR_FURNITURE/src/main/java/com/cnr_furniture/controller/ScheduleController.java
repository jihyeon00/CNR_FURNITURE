package com.cnr_furniture.controller;

import com.cnr_furniture.domain.scheduler.ScheduleSearch;
import com.cnr_furniture.domain.scheduler.ScheduleVO;
import com.cnr_furniture.service.ScheduleService;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

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
    @GetMapping("/workerManagement")
    public String workerManagement(ScheduleSearch scheduleSearch, Model model
    ) {
        List<ScheduleVO> workerList = scheduleService.getWorkerList(scheduleSearch);
        model.addAttribute("workerList", workerList);
        model.addAttribute("workerSearch", scheduleSearch);


        return "process/workerManagement";
    }

}
