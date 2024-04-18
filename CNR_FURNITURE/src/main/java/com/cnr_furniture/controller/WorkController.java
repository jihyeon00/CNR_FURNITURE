package com.cnr_furniture.controller;

import com.cnr_furniture.domain.quality.inspectionIB.CriteriaInspIBVO;
import com.cnr_furniture.domain.quality.inspectionIB.InspIBInsertVO;
import com.cnr_furniture.domain.work.search.*;
import com.cnr_furniture.domain.work.todayWorkInsert.TodayWorkVO;
import com.cnr_furniture.domain.work.todayWorkInsert.WorkProcessMachineVO;
import com.cnr_furniture.domain.work.workMNG.*;
import com.cnr_furniture.service.WorkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import lombok.extern.log4j.Log4j;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@Controller
@Log4j

public class WorkController {
    @Autowired
    private WorkService workService;

    /**
     * Decs: 검색용 데이터를 로드하는 메소드.
     */
    private void loadSearchData(WorkSearchVO workSearchVO, Model model) {
        model.addAttribute("companyList", workService.findCompanyList());
        model.addAttribute("itemList", workService.findItemList());
        model.addAttribute("instructionList", workService.findInstructionList());
        model.addAttribute("processInfoList", workService.findProcessInfoList());
    }

    /**
     * Desc: 공정관리-작업관리-제조수행, 작업목록, 생산실적, 자재투입내역, 작업자 조회
     * @param workSearchVO: 검색 조건을 담은 VO 객체
     * @param model: 뷰에 데이터를 전달하기 위한 모델
     * @return: work/work
     */
    
    @GetMapping("/work")
    public String work(WorkSearchVO workSearchVO,
                       Model model){

        loadSearchData(workSearchVO, model); // 검색용 데이터 로드
        // loadModalData(workSearchVO, model);  // 모달용 데이터 로드

//        // [로트번호] 입력에 따른 [공정번호 리스트] 조회
//        List<WorkInsertMaterialModalVO> insProidList = workService.getInsProIdModal(insLotIdModal);

        // 제조수행정보 목록 조회
        List<WorkProcessInfoVO> workProcessInfoList = workService.getWorkProcessInfo(workSearchVO);
        // 작업 목록 조회
        List<WorkVO> workList = workService.getWork(workSearchVO);
        // 생산실적 조회
        List<WorkVO> productionPerformanceList = workService.getWorkProductionPerformance(workSearchVO);
        // 자재투입내역 조회
        List<WorkSelectInsertMaterialVO> insertMaterialList = workService.getWorkInsertMaterial(workSearchVO);
        // 작업자 조회
        List<WorkerVO> workerList = workService.getWorker(workSearchVO);


        // view에서 사용할 모델명 지정
        model.addAttribute("workProcessInfoList", workProcessInfoList);                 // 제조수행정보 목록 조회
        model.addAttribute("workList",workList);                                        // 작업 목록 조회
        model.addAttribute("productionPerformanceList",productionPerformanceList);      // 생산실적 조회
        model.addAttribute("insertMaterialList",insertMaterialList);                    // 자재투입내역 조회
        model.addAttribute("workerList",workerList);                                    // 작업자 조회

        return "work/work";
    }

    /* [work.jsp 의 자재투입 모달창] ============================================================== */
    /**
     * Desc: 자재투입 모달창 - [로트번호] 입력에 따른 [공정번호 리스트] 조회
     */
    @GetMapping("/insertMaterialModalInsProId")
    @ResponseBody
    public List<WorkInsertMaterialModalVO> getInsProIdModal(
            @RequestParam("insLotIdModal") int insLotIdModal
    ) {
        return workService.getInsProIdModal(insLotIdModal);
    }

    /**
     * Desc: 자재투입 모달창 - [로트번호] 입력에 따른 [제품번호],[제품명],[계획생산수량] 조회
     */
    @GetMapping("/insertMaterialModalInsProIdAutoData")
    @ResponseBody
    public WorkInsertMaterialModalVO getInsLotIdAutoDataModal(
            @RequestParam("insLotIdModal") int insLotIdModal
    ) {
        return workService.getInsLotIdAutoDataModal(insLotIdModal);
    }

    /**
     * Desc: 자재투입 모달창 - [로트번호] 입력에 따른 [자재번호] 조회
     */
    @GetMapping("/insertMaterialModalLoadMatId")
    @ResponseBody
    public List<WorkInsertMaterialModalVO> getMaterialIdModal(
            @RequestParam("insLotIdModal") int insLotIdModal
    ) {
        return workService.getMaterialIdModal(insLotIdModal);
    }

    /**
     * Desc: 자재투입 모달창 -
     * [로트번호] 입력, [자재번호] 선택에 따른 [자재명],[제품1EA별투입수량],[최소투입수량],[단위] 조회
     */
    @GetMapping("/insertMaterialModalMatIdAutoData")
    @ResponseBody
    public WorkInsertMaterialModalVO getMaterialIdAutoDataModal(
            @RequestParam("insLotIdModal") int insLotIdModal,
            @RequestParam("materialIdModal") int materialIdModal
    ) {
        return workService.getMaterialIdAutoDataModal(insLotIdModal,materialIdModal);
    }

    /**
     * Desc: 자재투입 등록 시, DB 저장 - [재고 테이블]
     * @param arrays 자재투입목록 클라이언트로부터 JSON 형태로 받아 WorkInsertMaterialModalVO 객체 리스트로 변환
     */
    @PostMapping(value = "/insertMaterialArr")
    @ResponseBody
    public ResponseEntity<?> workInsertMaterial(
            @RequestBody List<WorkInsertMaterialModalVO> arrays
    ) {
        log.info(arrays);
        try {
            workService.workInsertMaterial(arrays);
            return ResponseEntity.ok().body(Map.of("success", true, "message", "등록이 성공되었습니다."));
        } catch (Exception e) {
            log.error("등록 실패, Error: {}" + e.getMessage() + e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(Map.of("success", false, "message", "등록에 실패하였습니다. 에러: " + e.getMessage()));
        }
    }

    /* [todayWorkInsert.jsp] ============================================================== */
    /**
     * Desc: 공정관리-작업관리-당일작업등록-공정조회, 당일작업목록, 당일작업등록, 당일작업상세(수정), 당일작업삭제
     * @return: work/todayWorkInsert
     */
    
    @GetMapping("/todayWorkInsert")
    public String todayWorkInsert(WorkSearchVO workSearchVO, Model model){
        // 검색을 위한 제조지시 리스트
        List<WorkSelectInstructionVO> instructionList = workService.findInstructionList();
        // 검색을 위한 공정정보 리스트
        List<WorkSelectProcessInfoVO> processInfoList = workService.findProcessInfoList();

        // 공정별 설비상태 조회
        List<WorkProcessMachineVO> processMachineList = workService.getWorkProcessMachine(workSearchVO);
        // 당일작업목록 조회
        List<TodayWorkVO> todayWorkList = workService.getTodayWork(workSearchVO);

        // view에서 사용할 모델명 지정

        model.addAttribute("instructionList", instructionList);         // 제조지시 리스트
        model.addAttribute("processInfoList", processInfoList);         // 공정정보 리스트

        model.addAttribute("processMachineList", processMachineList);   // 공정별 설비상태 조회
        model.addAttribute("todayWorkList", todayWorkList);             // 당일작업목록 조회

        return "work/todayWorkInsert";
    }
    
    /**
     * Desc: 공정관리-작업관리-당일작업등록-작업자등록-당일 작업자 배치 조회, 작업자등록
     * @return: work/todayWorkInsert
     */
    
    @GetMapping("/workerInsert")
    public String workerInsert(WorkSearchVO workSearchVO, Model model){
        // 검색을 위한 제조지시 리스트
        List<WorkSelectInstructionVO> instructionList = workService.findInstructionList();
        // 검색을 위한 공정정보 리스트
        List<WorkSelectProcessInfoVO> processInfoList = workService.findProcessInfoList();

        // view에서 사용할 모델명 지정
        model.addAttribute("instructionList", instructionList);
        model.addAttribute("processInfoList", processInfoList);

    	return "work/workerInsert";
    }

}
