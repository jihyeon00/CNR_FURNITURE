package com.cnr_furniture.controller;

import com.cnr_furniture.domain.contract.ContractVO;
import com.cnr_furniture.domain.process.*;
import com.cnr_furniture.service.ProcessService;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Log4j
@Controller
public class ProcessController {

    @Autowired
    private ProcessService processService;

    /** ***********************************제조 지시*********************************************** **/

    /**
     * - 공정 데이터
     * - 아이템 데이터
     * - 공정 정보 데이터
     * - 계약 데이터 (선택적: 특정 ID가 주어진 경우에만 조회)
     *
     * @param processDate  날짜 조건 및 여러 조회에 사용
     * @param id 선택적으로 제공된 계약 ID, 쉼표로 구분된 문자열 (예: "1, 2, 3")
     * @return "process/manufacturingInstruction"
     */
    @GetMapping("/manufacturingInstruction")
    public String manufacturingInstruction(ProcessDate processDate, Model model, @RequestParam(required = false) String id) {
        List<ProcessVO> processVOList = processService.selectProcess(processDate);
        List<ProcessItemVO> itemProList = processService.findAllItems();
        List<ProcessInfoVO> piProList= processService.findAllPi();
        List<ProcessCtVO> ctProList= processService.findAllProCt(processDate);

        // 계약 정보 목록을 저장할 리스트를 초기화
        List<ContractVO> contractVOList = new ArrayList<>();
        // id 파라미터가 null이 아니고, 공백이 아닌 경우에만 실행
        if (id != null && !id.isEmpty()) {
            // id 문자열을 쉼표와 공백 기준으로 분리하여 리스트로 변환
            // ex) 입력된 " 1, 2 , 3" 문자열은 ["1", "2", "3"] 리스트가 됨
            List<String> ids = Arrays.asList(id.split("\\s*,\\s*"));


            // 분리된 ID 리스트를 사용하여 데이터베이스에서 해당하는 계약 정보를 조회
            // selectArrayCt: 주어진 ID 리스트에 해당하는 모든 계약 정보를 반환
            contractVOList = processService.selectArrayCt(ids);
        }

        model.addAttribute("proList", processVOList);
        model.addAttribute("itemProList", itemProList);
        model.addAttribute("piProList", piProList);
        model.addAttribute("ctProList", ctProList);
        model.addAttribute("processDate", processDate);
        model.addAttribute("contractVOList", contractVOList);

        return "process/manufacturingInstruction";
    }

    /**
     * "제조 지시" 폼 데이터의 계약 정보를 조회하여 반환
     *
     * 이 메소드는 AJAX 요청을 통해 호출되며, 주어진 계약 ID 목록에 해당하는 계약 정보를 조회
     * "제조 지시" 페이지에서 동적으로 계약 정보를 로드할 때 사용한다.
     *
     * @param formattedIds 쉼표로 구분된 계약 ID 목록 (예: "1,2,3")
     * @return 계약 정보 목록, 각 계약은 {@link ContractVO} 객체로 표현
     */
    @GetMapping("/manufacturingInstructionForm")
    @ResponseBody
    public List<ContractVO> manufacturingInstructionForm(@RequestParam("formattedIds") String formattedIds) {
        List<String> idList = Arrays.asList(formattedIds.split(","));
        return processService.selectArrayCt(idList);
    }



    /**
     * 제조 지시 정보를 데이터베이스에 등록
     *
     * @param
     * @param
     * @return
     */
    @PostMapping("/manufacturingInstructionInsert")
    @ResponseBody
    public ResponseEntity<?> manufacturingInstructionInsert(
            @RequestBody List<ProcessVO> lots
    ){
        log.info(lots);
        try {
            processService.insertProInstruction(lots);
            return new ResponseEntity<>(HttpStatus.OK);
        }catch (Exception e) {
            log.error("Error processing instruction insertion", e);
            return new ResponseEntity<>(e.getClass().getSimpleName() + " " + e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
        }
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
            @RequestParam("ins_lot_id") int ins_lot_id,                                     // 입력받은 제조 LOT 번호
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
     * @param processDate 사용자가 입력한 날짜 조건, 공정 정보 검색
     * @return "process/processInfo"
     */
    @GetMapping("/processInfo")
    public String processInfo(ProcessDate processDate, Model model) {
        List<ManagementVO> managementVOList = processService.selectM();
        List<ProcessInfoVO> findPromotion = processService.selectByList(processDate);
        List<ProcessInfoVO> processInfoVOList = processService.selectByListSearch();
        model.addAttribute("managementVOList", managementVOList);
        model.addAttribute("findPromotion", findPromotion);
        model.addAttribute("processList",processInfoVOList);
        model.addAttribute("processDate",processDate);
        return "process/processInfo";
    }

    /**
     * Ajax 요청에 의해 "설비 목록"을 조회하여 반환
     * 선택적으로 설비 ID(miId)에 따라 설비 목록을 필터링
     * @param miId 선택적으로 제공되는 설비 ID, 이 ID에 해당하는 설비만 조회
     * @return 선택된 설비 ID에 해당하는 설비 목록, 또는 모든 설비 목록을 반환
     */
    @GetMapping("/searchManagementVO")
    @ResponseBody
    public List<ManagementVO> searchManagementVO(@RequestParam(value = "miId", required = false) Integer miId) {
        List<ManagementVO> managementVOList = processService.selectByMiId(miId);
        return managementVOList;
    }

    /**
     * Ajax 요청을 통해 "설비 목록"을 조회하여 반환
     * 설비 목록을 초기 상태로 리셋하는 데 사용
     * 주로 공정 정보 등록창에서 Ajax를 통해 설비 목록을 동적으로 갱신할 때 사용
     * @return 전체 설비 목록을 반환
     */
    @GetMapping("/processInfoAjax")
    @ResponseBody
    public List<ManagementVO> processInfoAjax() {
        return processService.selectM();
    }


    /**
     * "공정 정보" 추가
     * 입력받은 공정 정보 객체를 사용하여 데이터베이스에 새로운 공정 정보를 추가
     * @param processInfoVO 입력받은 공정 데이터
     * @param rttr 리다이렉트 시 메시지를 전달하기 위한 RedirectAttributes 객체
     * @return "redirect:processInfo" 리다이렉트
     */
    @PostMapping("/processInfoInsert")
    public String processInfoInsert (
            ProcessInfoVO processInfoVO,
            RedirectAttributes rttr
    ){

        int rtn = processService.insertAddProcess(
                processInfoVO.getPi_id()
                , processInfoVO.getPi_machine_id()
                , processInfoVO.getPi_name()
                , processInfoVO.getPi_seq()

        );
        rttr.addFlashAttribute("insertSuccessCount", rtn);
        return "redirect:processInfo";
    }
}

