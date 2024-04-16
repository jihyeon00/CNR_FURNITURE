package com.cnr_furniture.controller.quality;

import com.cnr_furniture.domain.quality.inspectionProcess.CriteriaInspProcessVO;
import com.cnr_furniture.domain.quality.inspectionProcess.InspectionProcessListVO;
import com.cnr_furniture.service.quality.inspectionProcess.InspectionProcessService;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

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

    /* [공정불량등록] - 검색 및 현황 조회 ====================================================================================================== */
    /**
     * Desc: 검색창 - [불량유형1]에 따른 [불량유형2] 조회
     * option1에 따른 option2 조회
     * 선택된 불량유형1이 있을 경우에만 불량유형2의 데이터를 조회
     */
    private List<InspectionProcessListVO> loadQsDiv2List(String qsDiv1) {
        if (qsDiv1 != null && !qsDiv1.isEmpty()) {  // 불량유형1이 선택되면 해당하는 불량유형2의 목록을 반환
            return inspectionProcessService.getQsDiv2ListByQsDiv1(qsDiv1);
        } else {
            return List.of(); // 불량유형1이 선택되지 않았을 경우, 빈 목록을 반환
        }
    }
    /**
     * Desc: 검색창 - 불량유형1에 따른 불량유형2 조회
     */
    @GetMapping("/qsDiv2List")
    @ResponseBody
    public List<InspectionProcessListVO> getQsDiv2ListByQsDiv1(
            @RequestParam("qsDiv1") String qsDiv1
    ) {
        return inspectionProcessService.getQsDiv2ListByQsDiv1(qsDiv1);
    }
    /**
     * Decs: 품질관리-출하검사관리(제품OB), with 검색
     * 검색조건에 따라 다른 결과를 모델에 추가하고, 결과 페이지를 렌더링한다.
     * @param cri: 검색 조건을 담은 VO 객체
     * @param model: 뷰에 데이터를 전달하기 위한 모델
     * @return: qualityInspection/inspectionProcess
     */
    @GetMapping("/inspectionProcess")
    public String getInspectionProcessList(CriteriaInspProcessVO cri, Model model) {
        log.info("공정검사관리 페이지");

        loadSearchData(cri, model); // 검색용 데이터 로드

        // 공정검사현황 목록 조회
        List<InspectionProcessListVO> inspectionProcessList = inspectionProcessService.getInspProcessList(cri);
        if(inspectionProcessList.isEmpty()) {
            log.warn("검색 결과가 없습니다.");
        } else {
            model.addAttribute("insp", inspectionProcessList);
            model.addAttribute("cri", cri);
        }

        return "qualityInspection/inspectionProcess";   // 해당하는 View의 이름을 반환
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

}
