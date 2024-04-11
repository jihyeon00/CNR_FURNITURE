package com.cnr_furniture.controller.quality;

import com.cnr_furniture.domain.quality.CriteriaInspIBVO;
import com.cnr_furniture.domain.quality.InspectionIBListVO;
import com.cnr_furniture.service.quality.InspectionIBService;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

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
     * Desc: 검색창 - 불량유형1에 따른 불량유형2 조회
     */
    @GetMapping("/qsDiv2List")
    @ResponseBody
    public List<InspectionIBListVO> getQsDiv2ListByQsDiv1(
            @RequestParam("qsDiv1") String qsDiv1
    ) {
        return inspectionIBService.getQsDiv2ListByQsDiv1(qsDiv1);
    }

    /**
     * Desc: 품질관리-수입검사관리(자재IB), with 검색
     * @return: qualityInspection/inspectionIB
     */
    @GetMapping("/inspectionIB")
    public String getInspectionIBList(CriteriaInspIBVO cri, Model model) {
        log.info("inspectionIB");

        List<InspectionIBListVO> matIDList = inspectionIBService.getMatIDList();                // 자재 ID input list로 데이터 가져오기
        List<InspectionIBListVO> contractIDList = inspectionIBService.getContractIDList();      // 계약 ID input list로 데이터 가져오기
        List<InspectionIBListVO> qsDiv1List = inspectionIBService.getQsDiv1List();              // 제품용도1 검색용
        List<InspectionIBListVO> qsDiv2List = null;                                             // 불량유형1에 따른 불량유형2 검색용

        // 불량유형1(qsDiv1)이 선택된 경우에만 불량유형2의 목록을 조회
        if(cri.getQsDiv1() != null && !cri.getQsDiv1().isEmpty()) {
            qsDiv2List = inspectionIBService.getQsDiv2ListByQsDiv1(cri.getQsDiv1());
        } else {
            // 불량유형1이 선택되지 않았을 경우, 불량유형2 목록은 빈 목록을 반환
            qsDiv2List = List.of();
        }

        model.addAttribute("cri", cri);                         // model에 검색조건(keyword) 담기
        model.addAttribute("matIDList", matIDList);             // model에 자재ID 리스트 담기
        model.addAttribute("contractIDList", contractIDList);
        model.addAttribute("qsDiv1List", qsDiv1List);
        model.addAttribute("qsDiv2List", qsDiv2List);

        return "/qualityInspection/inspectionIB";   // 해당하는 View의 이름을 반환
    }
}
