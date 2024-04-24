package com.cnr_furniture.controller.quality;

import com.cnr_furniture.domain.quality.inspectionIB.CriteriaInspIBVO;
import com.cnr_furniture.domain.quality.inspectionIB.InspIBInsertVO;
import com.cnr_furniture.domain.quality.inspectionIB.InspIBListVO;
import com.cnr_furniture.domain.quality.inspectionIB.InspIBUpdateVO;
import com.cnr_furniture.service.quality.inspectionIB.InspectionIBService;
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
 * Desc: 수입검사(InspectionIB, 자재IB)를 위한 Controller
 */
@Controller
@Log4j
public class InspectionIBController {
    @Autowired
    private final InspectionIBService inspectionIBService;
    @Autowired
    public InspectionIBController(InspectionIBService inspectionIBService) {
        this.inspectionIBService = inspectionIBService;
    }

    /**
     * Desc: [불량유형1]에 따른 [불량유형2] 조회
     * option1에 따른 option2 조회
     * 선택된 불량유형1이 있을 경우에만 불량유형2의 데이터를 조회
     */
    private List<InspIBListVO> loadQsDiv2List(String qsDiv1) {
        if (qsDiv1 != null && !qsDiv1.isEmpty()) {  // 불량유형1이 선택되면 해당하는 불량유형2의 목록을 반환
            return inspectionIBService.getQsDiv2ListByQsDiv1(qsDiv1);
        } else {
            return List.of(); // 불량유형1이 선택되지 않았을 경우, 빈 목록을 반환
        }
    }

    /**
     * Desc: 검색창 - 불량유형1에 따른 불량유형2 조회
     */
    @GetMapping("/qsDiv2List")
    @ResponseBody
    public List<InspIBListVO> getQsDiv2ListByQsDiv1(
            @RequestParam("qsDiv1") String qsDiv1
    ) {
        return inspectionIBService.getQsDiv2ListByQsDiv1(qsDiv1);
    }

    /**
     * Desc: 품질관리-수입검사관리(자재IB) - 조회
     * 검색조건에 따라 다른 결과를 모델에 추가하고, 결과 페이지를 렌더링한다.
     * @param cri: 검색 조건을 담은 VO 객체
     * @param model: 뷰에 데이터를 전달하기 위한 모델
     * @return: qualityInspection/inspectionIB
     */
    @GetMapping("M/quality/inspectionIB")
    public String getInspectionIBList(CriteriaInspIBVO cri, Model model) {
        log.info("수입검사관리 페이지");

        loadSearchData(cri, model); // 검색용 데이터 로드
        loadModalData(cri, model);  // 모달용 데이터 로드

        // 수입검사현황 목록 조회
        List<InspIBListVO> inspectionIBList = inspectionIBService.getInspectionIBList(cri);
        if (inspectionIBList.isEmpty()) {
            log.warn("검색 결과가 없습니다.");
            /*model.addAttribute("message", "검색된 결과가 없습니다.");*/
        } else {
            model.addAttribute("inspIBList", inspectionIBList);
            model.addAttribute("cri", cri);
        }

        return "quality/inspectionIB";    // View 반환
    }

    /**
     * Decs: 검색창 - 검색용 데이터를 로드하는 메소드.
     */
    private void loadSearchData(CriteriaInspIBVO cri, Model model) {
        model.addAttribute("contractIDList", inspectionIBService.getContractIDList());  // 계약ID(검색용)
        model.addAttribute("matIDList", inspectionIBService.getMatIDList());            // 자재ID(검색용)
        model.addAttribute("qsDiv1List", inspectionIBService.getQsDiv1List());          // 불량유형1(검색용)
        model.addAttribute("qsDiv2List", loadQsDiv2List(cri.getQsDiv1()));              // [불량유형1]에 따른 [불량유형2], (검색용)
    }



    /* [자재불량등록] - [등록]모달창 ====================================================================================================== */
    /**
     * Decs: 모달창 - 모달용 데이터를 로드하는 메소드.
     */
    private void loadModalData(CriteriaInspIBVO cri, Model model) {
        model.addAttribute("contractIDModalList", inspectionIBService.getContractIDListForModal()); // 계약ID(모달용)
        model.addAttribute("qsDiv1ModalList", inspectionIBService.getQsDiv1ListForModal());         // 불량유형1(모달용)
        model.addAttribute("qsDiv2ModalList", loadQsDiv2List(cri.getQsDiv1Modal()));                // [불량유형1]에 따른 [불량유형2], (모달용)
    }

    /**
     * Desc: 모달창(등록) - 불량유형1에 따른 불량유형2 조회
     */
    @GetMapping("/qsDiv2ModalList")
    @ResponseBody
    public List<InspIBInsertVO> getQsDiv2ListByQsDiv1ForModal(
            @RequestParam("qsDiv1Modal") String qsDiv1Modal
    ) {
        return inspectionIBService.getQsDiv2ListByQsDiv1ForModal(qsDiv1Modal);
    }

    /**
     * Desc: 모달창(등록) - [계약번호] 입력에 따른 [거래처명], [계약입고수량], [단위], [자재번호], [자재명], [자재용도] 자동 채우기
     */
    @GetMapping("/contractDetailsModal")
    @ResponseBody
    public InspIBInsertVO getContractDetailsByContractIDModal(
            @RequestParam("contractIDModal") Long contractIDModal
    ) {
        return inspectionIBService.getContractDetailsByContractIDModal(contractIDModal);
    }

    /**
     * Desc: 자재불량 등록 시, DB 저장 - [품질검사 테이블], [재고 테이블]
     * @param items 수입검사 항목 목록, 클라이언트로부터 JSON 형태로 받아 InspIBInsertVO 객체 리스트로 변환
     * @return 성공 시 HTTP 200 상태와 성공메시지를 반환, 실패 시 HTTP 500 상태와 함께 실패 메시지를 반환
     * ResponseEntity<?>는 Spring Framework에서 HTTP 요청에 대한 응답을 표현하는 클래스다.
     * 이 클래스를 사용하면 HTTP 상태 코드, 응답 본문, 헤더 등을 포함하는 전체 HTTP 응답을 구성하고 관리할 수 있다. 
     * ResponseEntity는 제네릭을 사용하여 응답 본문의 타입을 지정할 수 있습니다. 여기서 <?>는 와일드카드를 나타내며, 
     * 응답 본문의 타입이 지정되지 않았거나 다양한 타입을 허용할 때 사용된다.
     */
    @PostMapping("/registerInspectionItems")
    @ResponseBody
    public ResponseEntity<?> registerInspectionItems(
            @RequestBody List<InspIBInsertVO> items
    ) {
        log.info(items);
        try {
            inspectionIBService.registerInspectionItems(items);
            return ResponseEntity.ok().body(Map.of("success", true, "message", "등록이 성공되었습니다."));
        } catch (Exception e) {
            log.error("등록 실패, Error: {}" + e.getMessage() + e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(Map.of("success", false, "message", "등록에 실패하였습니다. 에러: " + e.getMessage()));
        }
    }


    /* [자재불량관리] - [수정]모달창 ====================================================================================================== */
    /**
     * Desc: 모달창(수정) - 불량유형1에 따른 불량유형2 조회
     */
    @GetMapping("/qsDiv2ListForEdit")
    @ResponseBody
    public List<InspIBListVO> getQsDiv2ListByQsDiv1ForEdit(
            @RequestParam("qsDiv1") String qsDiv1
    ) {
        return inspectionIBService.getQsDiv2ListByQsDiv1(qsDiv1);
    }

    /**
     * Desc: [수입검사관리]: 수정 모달창 데이터 조회
     * @return: /inspectionIB/edit
     */
    @GetMapping("/inspectionIB/edit")
    @ResponseBody
    public InspIBListVO getInspectionForEdit(@RequestParam("qiID") Long qiID) {
        log.info("수정을 위한 qiID: " + qiID);
        InspIBListVO inspectionDetails = inspectionIBService.getInspectionDetails(qiID);
        if (inspectionDetails == null) {
            log.warn("정보를 찾지 못함. qiID: " + qiID);
        }
        return inspectionDetails;
    }

    /**
     * Desc: [수입검사관리]: 수정된 데이터 저장
     * @param: updateVO - 업데이트할 데이터를 담은 VO 객체
     * @return: ResponseEntity - 업데이트 성공 여부와 메시지를 담은 HTTP 응답
     */
    @PostMapping("/inspectionIB/update")
    public ResponseEntity<?> updateInspectionDetails(
            @RequestBody InspIBUpdateVO updateVO
    ) {
        try {
            log.info("수정될 내용: " + updateVO);
            log.info("수정할 qiID: " + updateVO.getQiID());
            inspectionIBService.updateInspectionRecord(updateVO);
            return ResponseEntity.ok().body(Map.of("success", true, "message", "업데이트가 성공적으로 완료되었습니다."));
        } catch(Exception e) {
            log.error("수정 실패: ", e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body(Map.of("success", false, "message", "업데이트 실패: " + e.getMessage()));
        }
    }

}
