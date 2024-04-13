package com.cnr_furniture.controller;

import com.cnr_furniture.domain.bom.BomVO;
import com.cnr_furniture.domain.process.*;
import com.cnr_furniture.domain.quality.CriteriaInspIBVO;
import com.cnr_furniture.domain.quality.InspectionIBListVO;
import com.cnr_furniture.service.ProcessService;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
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
            ProcessVO processVO,
            RedirectAttributes rttr
    ){

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











    /**제조 수행지시*/

    /**
     * Desc: 검색창 -
     */
    @GetMapping("/insItemList")
    @ResponseBody
    public List<ProcessVO> selectItemsByLotId(
            @RequestParam("ins_lot_id") int ins_lot_id
    ) {
        return processService.selectItemsByLotId(ins_lot_id);
    }

    @GetMapping("/insPiList")
    @ResponseBody
    public List<ProcessVO> selectProcessIdsByItemAndLotId(
            @RequestParam("ins_lot_id") int ins_lot_id,
            @RequestParam("ins_item_id") int ins_item_id) {
        return processService.selectProcessIdsByItemAndLotId(ins_lot_id, ins_item_id);
    }

    @GetMapping("/manufacturingPerform")
        public String manufacturingPerform(ProcessDate processDate, Model model) {
            List<ProcessRunVO> proRunList = processService.selectProcessRun(processDate);
            List<ProcessRunVO> proRunList1 = processService.selectProcessRun1();
            List<ProcessVO> insLotList = processService.selectLotIdsByItemAndProcessId();
            List<ProcessVO> insItemList = null;
            List<ProcessVO> insPiList = null;

            if (processDate.getIns_lot_id() > 0) {
                insItemList = processService.selectItemsByLotId(processDate.getIns_lot_id());
                if (processDate.getIns_item_id() > 0) {
                    insPiList = processService.selectProcessIdsByItemAndLotId(processDate.getIns_lot_id(), processDate.getIns_item_id());
                } else {
                    insPiList = List.of();
                }
            } else {
                insItemList = List.of();
                insPiList = List.of();
            }
            model.addAttribute("proRunList", proRunList);
            model.addAttribute("proRunList1", proRunList1);
            model.addAttribute("insLotList", insLotList);
            model.addAttribute("insItemList", insItemList);
            model.addAttribute("insPiList", insPiList);

            return "process/manufacturingPerform";   // 해당하는 View의 이름을 반환
        }

    /**
     * Desc: 제조 수행지시 등록
     * @return: manufacturingPerform 페이지
     */
    @PostMapping("/manufacturingPerformInsert")
    public String manufacturingPerformInsert (
            ProcessRunVO processRunVO,
            RedirectAttributes rttr
    ){

        int rtn = processService.insertProcessDa(
                processRunVO.getP_lot_id()
                , processRunVO.getP_pi_id()
                , processRunVO.getP_b_item_id()
                , processRunVO.getP_plan_quantity()
                , processRunVO.getP_note()
        );
        rttr.addFlashAttribute("insertSuccessCount", rtn);
        return "redirect:manufacturingPerform";
     }
    }














