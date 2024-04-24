package com.cnr_furniture.controller.quality;

import com.cnr_furniture.domain.quality.defectiveProcess.CriteriaDftProcessVO;
import com.cnr_furniture.domain.quality.defectiveProcess.DftProcessListVO;
import com.cnr_furniture.service.quality.defectiveProcess.DefectiveProcessService;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Desc: 공정불량실적(defectiveProcess)를 위한 Controller
 */
@Controller
@Log4j
public class DefectiveProcessController {
    @Autowired
    private final DefectiveProcessService defectiveProcessService;

    @Autowired
    public DefectiveProcessController(DefectiveProcessService defectiveProcessService) {
        this.defectiveProcessService = defectiveProcessService;
    }

    /**
     * Desc: 검색창 - [불량유형1]에 따른 [불량유형2] 조회
     * option1에 따른 option2 조회
     * 선택된 불량유형1이 있을 경우에만 불량유형2의 데이터를 조회
     */
    private List<DftProcessListVO> loadQsDiv2List(String qsDiv1) {
        if(qsDiv1 != null && !qsDiv1.isEmpty()) {
            return defectiveProcessService.getQsDiv2ListByQsDiv1(qsDiv1);
        } else {
            return List.of();
        }
    }

    /**
     * Desc: 검색창 - 불량유형1에 따른 불량유형2 조회
     */
    @GetMapping("/qsDiv2ListForDftProc")
    @ResponseBody
    public List<DftProcessListVO> getQsDiv2ListByQsDiv1(@RequestParam("qsDiv1") String qsDiv1) {
        return defectiveProcessService.getQsDiv2ListByQsDiv1(qsDiv1);
    }

    /**
     * Decs: 품질관리-공정불량실적 조회, with 검색
     */
    @GetMapping("quality/defectiveProcess")
    public String getDefectiveProcessList(CriteriaDftProcessVO cri, Model model) {
        log.info("defectiveProcess");

        model.addAttribute("lotIDList", defectiveProcessService.getLotIDList());
        model.addAttribute("processIDList", defectiveProcessService.getProcessIDList());
        model.addAttribute("qsDiv1List", defectiveProcessService.getQsDiv1List());
        model.addAttribute("qsDiv2List", loadQsDiv2List(cri.getQsDiv2()));

        model.addAttribute("defectiveProcessList", defectiveProcessService.getDftProcessList(cri));
        model.addAttribute("cri", cri);

        return "quality/defectiveProcess";   // 해당하는 View의 이름을 반환
    }
}
