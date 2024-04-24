package com.cnr_furniture.controller.quality;

import com.cnr_furniture.domain.quality.inspectionProcess.CriteriaInspProcessVO;
import com.cnr_furniture.domain.quality.inspectionProcess.InspProcessInsertVO;
import com.cnr_furniture.domain.quality.inspectionProcess.InspProcessListVO;
import com.cnr_furniture.domain.quality.inspectionProcess.InspProcessUpdateVO;
import com.cnr_furniture.service.quality.inspectionProcess.InspectionProcessService;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

/**
 * Desc: 공정검사(InspectionProcess, 공정 중의 자재불량)를 위한 Controller
 */
@Controller
@Log4j
public class InspectionProcessController {
    @Autowired
    private final InspectionProcessService inspectionProcessService;
    @Autowired
    public InspectionProcessController(InspectionProcessService inspectionProcessService) {
        this.inspectionProcessService = inspectionProcessService;
    }

    /* [공정불량현황] - 검색 및 현황 조회 ====================================================================================================== */
    /**
     * Desc: 검색창 - [불량유형1]에 따른 [불량유형2] 조회
     * option1에 따른 option2 조회
     * 선택된 불량유형1이 있을 경우에만 불량유형2의 데이터를 조회
     */
    private List<InspProcessListVO> loadQsDiv2List(String qsDiv1) {
        if (qsDiv1 != null && !qsDiv1.isEmpty()) {  // 불량유형1이 선택되면 해당하는 불량유형2의 목록을 반환
            return inspectionProcessService.getQsDiv2ListByQsDiv1(qsDiv1);
        } else {
            return List.of(); // 불량유형1이 선택되지 않았을 경우, 빈 목록을 반환
        }
    }
    /**
     * Desc: 검색창 - 불량유형1에 따른 불량유형2 조회
     */
    @GetMapping("/qsDiv2ListProcess")
    @ResponseBody
    public List<InspProcessListVO> getQsDiv2ListByQsDiv1(
            @RequestParam("qsDiv1") String qsDiv1
    ) {
        return inspectionProcessService.getQsDiv2ListByQsDiv1(qsDiv1);
    }

    /**
     * Decs: 품질관리-공정검사관리(제품OB), with 검색
     * 검색조건에 따라 다른 결과를 모델에 추가하고, 결과 페이지를 렌더링한다.
     * @param cri: 검색 조건을 담은 VO 객체
     * @param model: 뷰에 데이터를 전달하기 위한 모델
     * @return: M/qualityInspection/inspectionProcess
     */
    /*@GetMapping("/inspectionProcess")*/
    @GetMapping("M/quality/inspectionProcess")
    public String getInspectionProcessList(CriteriaInspProcessVO cri, Model model) {
        log.info("공정검사관리 페이지");

        loadSearchData(cri, model);     // 검색용 데이터 로드
        loadModalData(cri, model);      // 등록 모달용 데이터 로드
        loadEditModalData(cri, model);  // 수정 모달용 데이터 로드

        // 공정검사현황 목록 조회
        List<InspProcessListVO> inspectionProcessList = inspectionProcessService.getInspProcessList(cri);
        if(inspectionProcessList.isEmpty()) {
            log.warn("검색 결과가 없습니다.");
        } else {
            model.addAttribute("inspProcessList", inspectionProcessList);
            model.addAttribute("cri", cri);
        }

        return "quality/inspectionProcess";   // 해당하는 View의 이름을 반환
    }

    /**
     * Desc: 검색창 - 검색용 데이터를 로드하는 메소드.
     */
    private void loadSearchData(CriteriaInspProcessVO cri, Model model) {
        model.addAttribute("lotIDList", inspectionProcessService.getLotIDList());           // 제조LOT번호(검색용)
        model.addAttribute("procIDList", inspectionProcessService.getProcessIDList());      // 공정번호(검색용)
        model.addAttribute("procNameList", inspectionProcessService.getProcessNameList());  // 공정명(검색용)
        model.addAttribute("qsDiv1List", inspectionProcessService.getQsDiv1List());         // 불량유형1(검색용)
        model.addAttribute("qsDiv2List", loadQsDiv2List(cri.getQsDiv1()));                  // [불량유형1]에 따른 [불량유형2], (검색용)
        model.addAttribute("workIDList", inspectionProcessService.getWorkIDList());         // 작업번호(검색용)
        model.addAttribute("machineIDList", inspectionProcessService.getMachineIDList());   // 설비번호(검색용)
    }

    /* [공정불량현황] - [등록] 모달창 ====================================================================================================== */
    /**
     * Desc: 등록 모달창 - 모달용 데이터를 로드하는 메소드
     * [작업번호] - (모달용)
     * [불량유형1] - (모달용)
     * [불량유형1]에 따른 [불량유형2] - (모달용)
     */
    private void loadModalData(CriteriaInspProcessVO cri, Model model) {
        model.addAttribute("workIDModalList", inspectionProcessService.getWorkIDListForModal());    // [작업번호] - (모달용)
        model.addAttribute("qsDiv1ModalList", inspectionProcessService.getQsDiv1ForInsertModal());  // [불량유형1] - (모달용)
        model.addAttribute("qsDiv2ModalList", loadQsDiv2List(cri.getQsDiv2()));                     // [불량유형2]에 따른 [불량유형2] - (모달용)
    }

    /**
     * Desc: 등록 모달창 - [불량유형1]에 따른 [불량유형2] 조회
     * 주소: /qsDiv2ProcessModalList → inspectionProcess.js 파일에서 확인
     */
    @GetMapping("/qsDiv2ProcessModalList")
    @ResponseBody
    public List<InspProcessInsertVO> getQsDiv2ListByQsDiv1ForInsertModal(
        @RequestParam("qsDiv1") String qsDiv1
    ) {
        return inspectionProcessService.getQsDiv2ListByQsDiv1ForInsertModal(qsDiv1);
    }

    /**
     * Desc: 등록 모달창 - [작업번호]에 따른 공정정보 조회 및 input 담음
     * 주소: /workDetailsModal → inspectionProcess.js 파일에서 확인
     */
    @GetMapping("/workDetailsModal")
    @ResponseBody
    public InspProcessInsertVO getWorkDetailsByWorkID(
            @RequestParam("workID") Long workID
    ) {
        return inspectionProcessService.getWorkDetailsByWorkID(workID);
    }

    /**
     * Desc: [공정불량등록] 시, DB 저장 - [품질검사 테이블], [작업 테이블]
     * @param items 공정검사 항목 목록, 클라이언트로부터 JSON 형태로 받아 InspProcessInsertVO 객체 리스트로 변환
     * @return 성공 시 HTTP 200 상태와 성공메시지를 반환, 실패 시 HTTP 500 상태와 함께 실패 메시지를 반환
     * ResponseEntity<?>는 Spring Framework에서 HTTP 요청에 대한 응답을 표현하는 클래스다.
     * 이 클래스를 사용하면 HTTP 상태 코드, 응답 본문, 헤더 등을 포함하는 전체 HTTP 응답을 구성하고 관리할 수 있다.
     * ResponseEntity는 제네릭을 사용하여 응답 본문의 타입을 지정할 수 있습니다. 여기서 <?>는 와일드카드를 나타내며,
     * 응답 본문의 타입이 지정되지 않았거나 다양한 타입을 허용할 때 사용된다.
     *
     * 주소: /inspectionProcess/register → inspectionProcess.js 파일에서 확인
     */
    @PostMapping("/inspectionProcess/register")
    @ResponseBody
    public ResponseEntity<?> registerInspectionProcess(
            @RequestBody List<InspProcessInsertVO> items
    ) {
        log.info(items);
        try {
            inspectionProcessService.registerInspectionProcess(items);
            return ResponseEntity.ok().body(Map.of("success", true, "message", "등록이 성공되었습니다."));
        } catch (Exception e) {
            log.error("등록 실패, Error: {}" + e.getMessage() + e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(Map.of("success", false, "message", "등록에 실패하였습니다. 에러: ") + e.getMessage());
        }
    }

    /* [공정불량현황] - [수정] 모달창 ====================================================================================================== */
    /**
     * Desc: 수정 모달창 - 모달용 데이터를 로드하는 메소드
     * [불량유형1] - (모달용)
     * [불량유형1]에 따른 [불량유형2] - (모달용)
     */
    private void loadEditModalData(CriteriaInspProcessVO cri, Model model) {
        model.addAttribute("qsDiv1ForEditList", inspectionProcessService.getQsDiv1ListForUpdateModal());  // [불량유형1] - (모달용)
        model.addAttribute("qsDiv2ForEditList", loadQsDiv2List(cri.getQsDiv2()));                         // [불량유형2]에 따른 [불량유형2] - (모달용)
    }

    /**
     * Desc: [수정] 모달창 - [불량유형1]에 따른 [불량유형2] 조회
     */
    @GetMapping("/qsDiv2ListForProcessEdit")
    @ResponseBody
    public List<InspProcessUpdateVO> getQsDiv2ListByQsDiv1ForUpdateModal(
            @RequestParam("qsDiv1") String qsDiv1
    ) {
        return inspectionProcessService.getQsDiv2ListByQsDiv1ForUpdateModal(qsDiv1);
    }

    /**
     * Desc: 수정 모달창 - 특정 수입검사 항목을 가져오는 메소드
     * @return: /inspectionProcess/edit
     */
    @GetMapping("/inspectionProcess/edit")
    @ResponseBody
    public InspProcessUpdateVO getInspProcessForEdit(@RequestParam("qiID") Long qiID) {
        log.info("수정을 위한 qiID: " + qiID);
        InspProcessUpdateVO inspectionDetails = inspectionProcessService.getInspProcessDetailsBySeq(qiID);
        if(inspectionDetails == null) {
            log.warn("정보를 찾지 못함. qiID: " + qiID);
        }
        return inspectionDetails;
    }

    /**
     * Desc: 수정 모달창 - 수정된 데이터 저장
     * @param: updateVO - 업데이트할 데이터를 담은 VO 객체
     * @return: ResponseEntity - 업데이트 성공 여부와 메시지를 담은 HTTP 응답
     */
    @PostMapping("/inspectionProcess/update")
    public ResponseEntity<?> updateInspectionDetails(@RequestBody InspProcessUpdateVO updateVO) {
        try {
            log.info("수정될 내용: " + updateVO);
            log.info("수정할 qiID: " + updateVO.getQiID());
            inspectionProcessService.updateInspProcess(updateVO);
            return ResponseEntity.ok().body(Map.of("success", true, "message", "업데이트가 성공적으로 완료되었습니다."));
        } catch(Exception e) {
            log.error("수정 실패: ", e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body(Map.of("success", false, "message", "업데이트 실패: " + e.getMessage()));
        }
    }

}
