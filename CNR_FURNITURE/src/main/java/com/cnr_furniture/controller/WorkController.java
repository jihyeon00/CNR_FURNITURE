package com.cnr_furniture.controller;

import com.cnr_furniture.domain.work.search.*;
import com.cnr_furniture.domain.work.todayWorkInsert.*;
import com.cnr_furniture.domain.work.workMNG.*;
import com.cnr_furniture.domain.work.workerInsert.*;
import com.cnr_furniture.service.WorkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
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
     * Decs: 검색을 위한 메소드
     */
    private void workSearch(WorkSearchVO workSearchVO, Model model) {
        model.addAttribute("companyList", workService.findCompanyList());
        model.addAttribute("itemList", workService.findItemList());
        model.addAttribute("instructionList", workService.findInstructionList());
        model.addAttribute("processInfoList", workService.findProcessInfoList());
        model.addAttribute("machineInfoList", workService.findMachineInfoList());
        model.addAttribute("workList", workService.findWorkList());
        model.addAttribute("dpNameList", workService.findDpNameList());
        model.addAttribute("empInfoList", workService.findEmpInfoList());
    }
    /* [work.jsp] ======================================================================== */
    /**
     * Desc: 공정관리-작업관리-제조수행, 작업목록, 생산실적, 자재투입내역, 작업자 조회
     * @param workSearchVO: 검색 조건을 담은 VO 객체
     * @param model: 뷰에 데이터를 전달하기 위한 모델
     * @return: work/work
     */

    @GetMapping("/M/process/work")
    public String work(WorkSearchVO workSearchVO,
                       Model model){

        workSearch(workSearchVO, model); // 검색을 위한 메소드 사용

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
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(Map.of("success", false,
                    "message", "등록에 실패하였습니다. 에러: " + e.getMessage()));
        }
    }

    /* [work.jsp 의 자재투입내역 수정 모달창] ============================================================== */

    /**
     * Desc: Work 의 자재투입내역 중 조건에 따른 수정할 자재투입내역 조회
     * @return: /insertMaterialForUpdateModal?inv_lot_id=inv_lot_id&inv_pi_id=inv_pi_id&inv_material_id=inv_material_id&inv_quantity=inv_quantity
     */
    @GetMapping("/insertMaterialForUpdateModal")
    @ResponseBody
    public WorkSelectInsertMaterialVO getInsertMaterialForUpdate(
            @RequestParam("inv_lot_id") int inv_lot_id,
            @RequestParam("inv_pi_id") int inv_pi_id,
            @RequestParam("inv_material_id") int inv_material_id,
            @RequestParam("inv_quantity") int inv_quantity
    ) {
        log.info("수정을 위한 inv_lot_id : " + inv_lot_id);
        log.info("수정을 위한 inv_pi_id : " + inv_pi_id);
        log.info("수정을 위한 inv_material_id : " + inv_material_id);
        log.info("수정을 위한 inv_quantity : " + inv_quantity);

        WorkSelectInsertMaterialVO insertMaterialForUpdate = workService.getInsertMaterialForUpdate(inv_lot_id, inv_pi_id, inv_material_id, inv_quantity);
        if (insertMaterialForUpdate == null) {
            log.warn("정보를 찾지 못함. insertMaterialForUpdate: " + insertMaterialForUpdate);
        }
        return insertMaterialForUpdate;
    }
    /**
     * 자재투입수정
     * Desc: Work 의 자재투입내역 - 모달창을 이용한 자재투입 수정
     * @param: workUpdateMaterialModalVO - 업데이트 할 조건과 데이터를 담은 VO 객체
     */
    @PostMapping("/insertMaterialUpdate")
    public ResponseEntity<?> workInsertMaterialUpdate(
            @RequestBody WorkUpdateMaterialModalVO workUpdateMaterialModalVO
    ) {
        try {
            log.info("수정될 내용: " + workUpdateMaterialModalVO);
            log.info("수정할 inv_lot_id: " + workUpdateMaterialModalVO.getInv_lot_id());
            log.info("수정할 inv_pi_id: " + workUpdateMaterialModalVO.getInv_pi_id());
            log.info("수정할 inv_material_id: " + workUpdateMaterialModalVO.getInv_material_id());
            log.info("수정할 inv_quantity: " + workUpdateMaterialModalVO.getInv_quantity());
            log.info("수정된 updateInvQuantity: " + workUpdateMaterialModalVO.getUpdateInvQuantity());

            workService.updateWorkInsertMaterial(workUpdateMaterialModalVO);
            return ResponseEntity.ok().body(Map.of("success", true, "message", "업데이트가 성공적으로 완료되었습니다."));
        } catch(Exception e) {
            log.error("수정 실패: ", e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body(Map.of("success", false, "message", "업데이트 실패: " + e.getMessage()));
        }
    }

    /* [work.jsp 의 작업등록 모달창] ============================================================== */
    /**
     * Desc: 작업등록 모달창 - [로트번호] 입력에 따른 [공정번호 리스트] 조회
     * @Param workInsertModalLotId : 공정번호 리스트를 가져오기 위한 제조LOT번호
     */
    @GetMapping("/M/process/workInsertModalProIdByLotId")
    @ResponseBody
    public List<WorkInsertModalVO> getProIdByLotId(
            @RequestParam("workInsertModalLotId") int workInsertModalLotId
    ) {
        return workService.getProIdByLotId(workInsertModalLotId);
    }

    /**
     * Desc: work 의 작업등록 모달창의 [로트번호] 입력에 따른 [제품번호],[제품명],[생산단위] 조회
     * @Param workInsertModalLotId : [제품번호],[제품명],[생산단위]를 가져오기 위한 제조LOT번호
     */
    @GetMapping("/M/process/workInsertModalAutoDataByLotId")
    @ResponseBody
    public WorkInsertModalVO getAutoDataByLotId(
            @RequestParam("workInsertModalLotId") int workInsertModalLotId
    ) {
        return workService.getAutoDataByLotId(workInsertModalLotId);
    }


    /**
     * Desc: work 의 작업등록 모달창의 [공정번호] 선택에 따른 [공정명], [설비번호], [설비명], [작업위치] 조회
     * @Param workInsertModalLotId : [공정번호]를 가져오기 위한 제조LOT번호
     * @Param workInsertModalProcessId :  [공정명], [설비번호], [설비명], [작업위치], [남은생산수량] 를 가져오기 위한 공정번호
     */
    @GetMapping("/M/process/workInsertModalAutoDataByProId")
    @ResponseBody
    public WorkInsertModalVO getAutoDataByProId(
            @RequestParam("workInsertModalLotId") int workInsertModalLotId,
            @RequestParam("workInsertModalProcessId") int workInsertModalProcessId
    ) {
        return workService.getAutoDataByProId(workInsertModalLotId, workInsertModalProcessId);
    }

    /**
     * Desc: Work 의 작업 등록 시, DB 저장 - [작업 테이블]
     * @param arrays 자재투입목록 클라이언트로부터 JSON 형태로 받아 WorkInsertModalVO 객체 리스트로 변환
     */
    @PostMapping(value = "/M/process/workInsertArr")
    @ResponseBody
    public ResponseEntity<?> workInsert(
            @RequestBody List<WorkInsertModalVO> arrays
    ) {
        log.info(arrays);
        try {
            workService.workInsert(arrays);
            return ResponseEntity.ok().body(Map.of("success", true,
                    "message", "등록이 성공되었습니다."));
        } catch (Exception e) {
            log.error("등록 실패, Error: {}" + e.getMessage() + e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(Map.of(
                    "success", false,
                    "message", "등록에 실패하였습니다. 에러: " + e.getMessage()));
        }
    }

    /* [work.jsp 의 작업상세 및 수정, 삭제 모달창] ============================================================== */
    /**
     * Desc: work 의 작업상세 모달창의 작업상세 조회
     * @Param workDetailModalWorkId : 작업상세 조회를 위한 파라미터
     * @Param workDetailModalLotId : 작업상세 조회를 위한 파라미터
     * @Param workDetailModalProcessId : 작업상세 조회를 위한 파라미터
     */
    @GetMapping("/workDetailModalAutoDataByWorkId")
    @ResponseBody
    public WorkDetailModalVO getWorkDetailAutoDataByWorkId(
            @RequestParam("workDetailModalWorkId") int workDetailModalWorkId,
            @RequestParam("workDetailModalLotId") int workDetailModalLotId,
            @RequestParam("workDetailModalProcessId") int workDetailModalProcessId
    ) {
        return workService.getWorkDetailAutoDataByWorkId(workDetailModalWorkId, workDetailModalLotId, workDetailModalProcessId);
    }

    /**
     * Desc: Work 의 작업 수정 시 [작업 테이블, 제조수행 테이블, 설비작동 테이블] 데이터 수정
     * @param workDetailModalVO 작업목록 클라이언트로부터 파라미터를 요청받아 수정할 수 있는 객체를 담은 VO
     */
    @RequestMapping(value = "/M/process/workDetailModalUpdate", method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity<?> workDetailModalUpdate(
            @RequestBody WorkDetailModalVO workDetailModalVO
    ) {
        log.info(workDetailModalVO);
        try {
            workService.workDetailModalUpdate(workDetailModalVO);
            return ResponseEntity.ok().body(Map.of("success", true, "message", "수정되었습니다."));
        } catch (Exception e) {
            log.error("등록 실패, Error: {}" + e.getMessage() + e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body(Map.of("success", false,
                            "message", "수정 실패: " + e.getMessage()));
        }
    }

    /**
     * Desc:  Work 의 작업상세 - 모달창을 이용한 작업 삭제 - [작업테이블]
     * @param workDetailModalWorkId 작업상세 클라이언트로부터 값을 받아옴
     */
    @PostMapping("/M/process/workDetailDelete")
    @ResponseBody
    public ResponseEntity<?> workDetailDelete(
            @RequestParam int workDetailModalWorkId
            ) {
        try {
            // 작업 삭제 로직 실행
            workService.workDetailModalDelete(workDetailModalWorkId);
            return ResponseEntity.ok(Map.of("success", true,
                    "message", "작업자가 성공적으로 삭제되었습니다."));
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body(Map.of("success", false,
                            "message", "삭제 실패: " + e.getMessage()));
        }
    }

    /* [todayWorkInsert.jsp] ============================================================== */
    /**
     * Desc: 공정관리-작업관리-당일작업목록-공정별 설비가동현황, 당일작업목록
     * @return: work/todayWorkInsert
     */

    @GetMapping("/process/todayWorkInsert")
    public String todayWorkInsert(WorkSearchVO workSearchVO, Model model){

        workSearch(workSearchVO, model); // 검색을 위한 메소드 사용

        // 공정별 설비상태 조회
        List<WorkProcessMachineVO> processMachineList = workService.getWorkProcessMachine(workSearchVO);
        // 당일작업목록 조회
        List<TodayWorkVO> todayWorkList = workService.getTodayWork(workSearchVO);

        // view에서 사용할 모델명 지정
        model.addAttribute("processMachineList", processMachineList);   // 공정별 설비상태 조회
        model.addAttribute("todayWorkList", todayWorkList);             // 당일작업목록 조회

        return "work/todayWorkInsert";
    }

    /* [workInsert.jsp] ============================================================== */

    /**
     * Desc: 공정관리-작업관리-작업자등록-작업자 배치 목록, 작업자등록
     * @return: work/workerInsert
     */

    @GetMapping("/workerInsert")
    public String workerInsert(WorkSearchVO workSearchVO, Model model){

        workSearch(workSearchVO, model); // 검색을 위한 메소드 사용

        // 작업자 배치 조회
        List<WorkSelectWorkerVO> workerInsertList = workService.getWorkerInsert(workSearchVO);

        // view에서 사용할 모델명 지정
        model.addAttribute("workerInsertList", workerInsertList);       // 작업자 배치 조회

    	return "work/workerInsert";
    }

    /* [workInsert.jsp 의 작업자 관리 모달창] ============================================================== */

    /**
     * Desc: workerInsert 의 작업자 관리 모달창의 작업자 관리를 위한 데이터 조회
     * @return: /workerInsertModalSelectData?w_id=w_id
     */
    @GetMapping("/workerInsertModalSelectData")
    @ResponseBody
    public WorkerInsertModalVO getWorkerInsertDataForInsert(
            @RequestParam("w_id") int w_id
    ) {
        log.info("수정을 위한 w_id : " + w_id);

        WorkerInsertModalVO workerInsertDataForInsert = workService.getWorkerInsertDataForInsert(w_id);

        if (workerInsertDataForInsert == null) {
            log.info("정보를 찾지 못함. insertMaterialForUpdate: " + workerInsertDataForInsert);
        }
        return workerInsertDataForInsert;
    }

    /**
     * Desc: 작업자 관리 모달창 - 부서명 선택에 따른 사원정보 조회
     */
    @GetMapping("/workerInsertModalEmpInfoByDpName")
    @ResponseBody
    public List<WorkerInsertModalSelectEmpInfoByDpNameVO> getWorkerInsertModalEmpInfoList(
            @RequestParam("edit_dp_name") String edit_dp_name
    ) {
        return workService.getWorkerInsertModalEmpInfoList(edit_dp_name);
    }

    /**
     * Desc: 작업자 관리 모달창 - 작업번호에 따른 작업자 정보 조회
     */
    @GetMapping("/workerInsertModalWorkerInfoByWorkId")
    @ResponseBody
    public List<WorkerInsertModalSelectWorkerInfoByWorkIdVO> getWorkerInsertModalWorkerInfoList(
            @RequestParam("edit_w_id") int edit_w_id
    ) {
        return workService.getWorkerInsertModalWorkerInfoList(edit_w_id);
    }

    /**
     * Desc: workInsert 의 작업자 관리 모달창의 작업자 등록 시, DB 저장 - [worker 테이블]
     * @param arrays 작업자 관리 클라이언트로부터 JSON 형태로 받아 WorkerInsertModalWorkerInsertVO 객체 리스트로 변환
     */
    @PostMapping(value = "/workerInsertArr")
    @ResponseBody
    public ResponseEntity<?> workerInsertArr(
            @RequestBody List<WorkerInsertModalWorkerInsertVO> arrays
    ) {
        try {
            workService.workerInsert(arrays);
            return ResponseEntity.ok().body(Map.of("success", true, "message", "등록이 성공되었습니다."));
        } catch (Exception e) {
            log.error("등록 실패, Error: {}" + e.getMessage() + e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(Map.of("success", false, "message", "등록에 실패하였습니다. 에러: " + e.getMessage()));
        }
    }

    /**
     * Desc: workInsert 의 작업자 관리 모달창의 등록된 작업자 목록에서 작업자 삭제 - [worker 테이블]
     * @param emp_id 작업자 관리 클라이언트로부터 값을 받아옴
     * @param work_id 작업자 관리 클라이언트로부터 값을 받아옴
     */
    @PostMapping("/deleteWorker")
    @ResponseBody
    public ResponseEntity<?> deleteWorker(@RequestParam int emp_id, @RequestParam int work_id) {
        try {
            // 작업자 삭제 로직 실행
            workService.workerInsertModalDeleteWorker(emp_id, work_id);
            return ResponseEntity.ok(Map.of("success", true,
                    "message", "작업자가 성공적으로 삭제되었습니다."));
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body(Map.of("success", false,
                            "message", "삭제 실패: " + e.getMessage()));
        }
    }

}
