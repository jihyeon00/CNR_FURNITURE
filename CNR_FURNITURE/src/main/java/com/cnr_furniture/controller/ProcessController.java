package com.cnr_furniture.controller;

import com.cnr_furniture.domain.process.*;
import com.cnr_furniture.service.ProcessService;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
public class ProcessController {

    @Autowired
    private ProcessService processService;

    /**
     * Desc: 제품, 공정, 계약 조회
     * @return: manufacturingInstruction 페이지
     */
    @GetMapping("/manufacturingInstruction")
    public String manufacturingInstruction(ProcessDate processDate, Model model) {
        List<ProcessVO> processVOList = processService.selectProcess(processDate);
        List<ProcessItemVO> itemProList = processService.findAllItems();                // 아이템 정보 조회
        List<ProcessInfoVO> piProList= processService.findAllPi();                      //공정 정보 조회
        List<ProcessCtVO> ctProList= processService.findAllProCt(processDate);          //계약 정보 조회
        model.addAttribute("proList", processVOList);
        model.addAttribute("itemProList", itemProList);                    // 모델에 아이템 정보 추가
        model.addAttribute("piProList", piProList);                        // 모델에 공정 정보 추가
        model.addAttribute("ctProList", ctProList);                        // 모델에 계약 정보 추가
        model.addAttribute("processDate", processDate);
        return "process/manufacturingInstruction";
    }

    /**
     * Desc: 제조 지시 등록
     * @return: manufacturingInstruction 페이지
     */
    @PostMapping("/manufacturingInstructionInsert")
    public String manufacturingInstructionInsert (
//            @RequestParam("ins_lot_id") int ins_lot_id,
//            @RequestParam("ins_item_id") int ins_item_id,
//            @RequestParam("ins_emp_id") int ins_emp_id,
//            @RequestParam("ins_ct_id") int ins_ct_id,
//            @RequestParam("ins_pi_id") int ins_pi_id,
//            @RequestParam("ins_lot_size") int ins_lot_size,
//            @RequestParam("ins_start_date") String ins_start_date,
//            @RequestParam("ins_end_date") String ins_end_date,
            ProcessVO processVO,
            RedirectAttributes rttr
    ){
//        int rtn = processService.insertProInstruction(
//                  ins_lot_id
//                , ins_item_id
//                , ins_emp_id
//                , ins_ct_id
//                , ins_pi_id
//                , ins_lot_size
//                , ins_start_date
//                , ins_end_date
//        );
        int rtn = processService.insertProInstruction(
                processVO.getIns_lot_id()
                , processVO.getIns_item_id()
                , processVO.getIns_emp_id()
                , processVO.getIns_ct_id()
                , processVO.getIns_pi_id()
                , processVO.getIns_lot_size()
                , processVO.getIns_start_date()
                , processVO.getIns_end_date()
        );
        rttr.addFlashAttribute("insertSuccessCount", rtn);
        return "redirect:manufacturingInstruction";
    }


    /*제조수행지시*/
    @GetMapping("/manufacturingPerform")
    public String processPlan(ProcessDate processDate, Model model) {
            List<ProcessVO> proList = processService.selectProcess(processDate);
            model.addAttribute("proList", proList);
            model.addAttribute("processDate", processDate);
        return "process/manufacturingPerform";
    }

    /*공정정보*/
    @GetMapping("/processInfo")
    public String processInfo() {
        return "process/processInfo";
    }

}
