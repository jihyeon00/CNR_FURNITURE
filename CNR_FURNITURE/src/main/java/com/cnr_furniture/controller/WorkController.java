package com.cnr_furniture.controller;

import com.cnr_furniture.domain.work.*;
import com.cnr_furniture.service.WorkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import lombok.extern.log4j.Log4j;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

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
    public String work(WorkSearchVO workSearchVO, Model model){
        // 검색을 위한 거래처 리스트
        List<WorkSelectCompanyVO> companyList = workService.findCompanyList();
        // 검색을 위한 제품 리스트
        List<WorkSelectItemVO> itemList = workService.findItemList();
        // 검색을 위한 제조지시 리스트
        List<WorkSelectInstructionVO> instructionList = workService.findInstructionList();
        // 검색을 위한 공정정보 리스트
        List<WorkSelectProcessInfoVO> processInfoList = workService.findProcessInfoList();

        // 제조수행정보 목록 조회
        List<WorkProcessInfoVO> workProcessInfoList = workService.selectWorkProcessInfo(workSearchVO);
        // 작업 목록 조회
        List<WorkVO> workList = workService.selectWork(workSearchVO);
        // 생산실적 조회
        List<WorkVO> productionPerformanceList = workService.selectWorkProductionPerformance(workSearchVO);


        // view에서 사용할 모델명 지정
        model.addAttribute("companyList", companyList);
        model.addAttribute("itemList", itemList);
        model.addAttribute("instructionList", instructionList);
        model.addAttribute("processInfoList", processInfoList);

        model.addAttribute("workProcessInfoList", workProcessInfoList);
        model.addAttribute("workList",workList);
        model.addAttribute("productionPerformanceList",productionPerformanceList);

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
