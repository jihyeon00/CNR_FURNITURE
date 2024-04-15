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

    /** ***********************************제조 지시*********************************************** **/

    /**
     * 제품, 공정, 계약 정보를 조회하여 제조 지시 페이지에 표시
     *
     * @param processDate 제조 지시 검색 조건을 담고 있는 ProcessDate 객체
     * @param model 뷰에 전달할 데이터를 담고 있는 모델 객체
     * @return "process/manufacturingInstruction" - manufacturingInstruction 뷰 페이지 경로
     */
    @GetMapping("/manufacturingInstruction")
    public String manufacturingInstruction(ProcessDate processDate, Model model) {
        List<ProcessVO> processVOList = processService.selectProcess(processDate);
        List<ProcessItemVO> itemProList = processService.findAllItems();
        List<ProcessInfoVO> piProList= processService.findAllPi();
        List<ProcessCtVO> ctProList= processService.findAllProCt(processDate);
        model.addAttribute("proList", processVOList);
        model.addAttribute("itemProList", itemProList);
        model.addAttribute("piProList", piProList);
        model.addAttribute("ctProList", ctProList);
        model.addAttribute("processDate", processDate);
        return "process/manufacturingInstruction";
    }

    /**
     * 제조 지시 정보를 데이터베이스에 등록
     *
     * @param processVO 입력 받은 제조 지시 데이터를 담고 있는 ProcessVO 객체
     * @param rttr 리다이렉트 시 속성을 전달할 RedirectAttributes 객체
     * @return "redirect:manufacturingInstruction" - 제조 지시 페이지로 리다이렉트
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




    /** ***********************************제조 수행 지시 *********************************************** **/


    /**
     * 제조 LOT 번호에 따라 LOT 번호에 해당하는 제품 번호를 조회하는 컨트롤러 메소드.
     * `processService`의 `selectItemsByLotId`를 호출하여
     * 주어진 LOT 번호에 해당하는 모든 제품 번호를 리스트 형태로 반환
     *
     * @param ins_lot_id 입력받은 제조 LOT 번호
     * @return List<ProcessVO> - 제조 LOT 번호에 따른 제품 번호 리스트
     */
    @GetMapping("/insItemList")
    @ResponseBody
    public List<ProcessVO> selectItemsByLotId(
            @RequestParam("ins_lot_id") int ins_lot_id          // 입력받은 제조 LOT 번호
    ) {
        return processService.selectItemsByLotId(ins_lot_id);   // 서비스를 호출하여 데이터를 조회한 후 반환
    }


    /**
     * 제조 LOT 번호와 제품 번호를 기반으로 해당 제품의 가능한 공정 번호를 조회하는 컨트롤러 메소드.
     * `processService`의 `selectProcessIdsByItemAndLotId`를 호출하여
     * 주어진 LOT 번호와 제품 번호에 해당하는 모든 공정 번호를 리스트 형태로 반환
     *
     * @param ins_lot_id 입력받은 제조 LOT 번호
     * @param ins_item_id 입력받은 제품 번호
     * @return List<ProcessVO> - 제조 LOT 번호와 제품 번호에 따른 공정 번호 리스트
     */
    @GetMapping("/insPiList")
    @ResponseBody
    public List<ProcessVO> selectProcessIdsByItemAndLotId(
            @RequestParam("ins_lot_id") int ins_lot_id,                                      // 입력받은 제조 LOT 번호
            @RequestParam("ins_item_id") int ins_item_id) {                                 // 입력받은 제조 LOT 번호
        return processService.selectProcessIdsByItemAndLotId(ins_lot_id, ins_item_id);      // 서비스를 호출하여 데이터를 조회한 후 반환
    }


    /**
     * 제조 수행 지시에 대한 검색 및 목록 조회를 위한 컨트롤러 메소드
     * 제조 LOT 번호, 공정 번호, 시작 날짜, 종료 날짜 등을 기준으로 데이터 검색
     *
     * @param processDate 검색 조건을 담고 있는 ProcessDate 객체 (제조 LOT 번호, 공정 번호, 날짜 범위 포함)
     * @param model 뷰에 데이터를 전달하기 위한 Model 객체
     * @return "manufacturingPerform" 뷰의 이름을 문자열로 반환
     */
    @GetMapping("/manufacturingPerform")
        public String manufacturingPerform(ProcessDate processDate, Model model) {
        // 제조 LOT 번호에 따라 고유한 LOT 목록을 조회
        List<ProcessRunVO> proRunList = processService.selectProcessRun(processDate);

        // 제조 수행 지시 목록을 조회 (ROWNUM, LOT 번호, 공정 번호 등 포함)
        List<ProcessRunVO> proRunList1 = processService.selectProcessRun1(processDate);

        // 공정 번호에 따라 고유한 공정 목록을 조회
        List<ProcessRunVO> proRunList2 = processService.selectProcessRun2(processDate);

        // 현재 선택된 제품번호와 공정 번호에 기반한 LOT 번호 목록을 조회
        List<ProcessVO> insLotList = processService.selectLotIdsByItemAndProcessId();
        List<ProcessVO> insItemList = null;         // 선택된 LOT ID에 따른 제품 목록 초기화
        List<ProcessVO> insPiList = null;           // 선택된 제품 번호에 따른 공정 번호 목록 초기화
            // LOT 번호를 선택했을 경우
            if (processDate.getIns_lot_id() > 0) {
                insItemList = processService.selectItemsByLotId(processDate.getIns_lot_id());
                // 선택된 LOT 번호에서 제품 아이디를 선택했을경우
                if (processDate.getIns_item_id() > 0) {
                    insPiList = processService.selectProcessIdsByItemAndLotId(processDate.getIns_lot_id(), processDate.getIns_item_id());
                } else {
                    insPiList = List.of();  // 제품 번호가 선택되지 않았을 경우 빈 목록 할당
                }
            } else {
                insItemList = List.of();    // LOT 번호가 선택되지 않았을 경우 빈 목록 할당
                insPiList = List.of();      // 동일하게 빈 목록 할당
            }

            // 뷰에 데이터를 전달
            model.addAttribute("proRunList", proRunList);
            model.addAttribute("proRunList1", proRunList1);
            model.addAttribute("proRunList2", proRunList2);
            model.addAttribute("insLotList", insLotList);
            model.addAttribute("insItemList", insItemList);
            model.addAttribute("insPiList", insPiList);

            return "process/manufacturingPerform";   // 해당하는 View의 이름을 반환
        }

    /**
     * 제조 수행 지시를 새로 등록하는 컨트롤러 메소드.
     * 입력한 제조 수행 지시 데이터를 데이터베이스에 저장
     *
     * @param processRunVO  입력받은 제조 수행 지시 데이터를 담고 있는 VO 객체
     * @param rttr 리다이렉트 시 전달할 데이터를 관리하는 RedirectAttributes 객체
     * @return "redirect:manufacturingPerform" - 저장 작업 후 제조 수행 지시 조회 페이지로 리다이렉트
     */
    @PostMapping("/manufacturingPerformInsert")
    public String manufacturingPerformInsert (
            ProcessRunVO processRunVO,
            RedirectAttributes rttr     // 리다이렉트 시 데이터를 전달할 수 있는 객체
    ){
        // processService를 통해 데이터베이스에 데이터를 저장하는 메소드 호출
        int rtn = processService.insertProcessDa(
                processRunVO.getP_lot_id()
                , processRunVO.getP_pi_id()
                , processRunVO.getP_b_item_id()
                , processRunVO.getP_plan_quantity()
                , processRunVO.getP_note()
        );

        // 리다이렉트 시 성공한 데이터의 수를 전달
        rttr.addFlashAttribute("insertSuccessCount", rtn);
        return "redirect:manufacturingPerform";
     }







/** ***********************************공정 관리*********************************************** **/


/**
 * @param
 * @return
 */


@GetMapping("/processInfo")
public String processInfo(Model model) {
    List<ManagementVO> managementVOList = processService.selectM();
    model.addAttribute("managementVOList", managementVOList);
    return "process/processInfo";
}

    @RestController
    public class ManagementController {
        @GetMapping("/searchManagementVO")
        public List<ManagementVO> searchManagementVO(@RequestParam(value = "miId", required = false) Integer miId) {
            return processService.selectByMiId(miId);
        }
    }
}

