package com.cnr_furniture.controller.quality;

import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * Desc: 공정불량실적(defectiveProcess)를 위한 Controller
 */
@Controller
@Log4j
public class DefectiveProcessController {
    /**
     * Decs: 품질관리-공정불량실적 조회, with 검색
     */
    @GetMapping("/defectiveProcess")
    public String getDefectiveProcessList() {
        log.info("defectiveProcess");
        return "qualityInspection/defectiveProcess";   // 해당하는 View의 이름을 반환
    }
}
