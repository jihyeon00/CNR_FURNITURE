package com.cnr_furniture.controller.quality;

import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * Desc: 공정검사(InspectionProcess, 공정 중의 자재불량)를 위한 Controller
 */
@Controller
@Log4j
public class InspectionProcessController {
    /**
     * Decs: 품질관리-출하검사관리(제품OB), with 검색
     */
    @GetMapping("/inspectionProcess")
    public String getInspectionProcessList() {
        log.info("inspectionProcess");
        return "qualityInspection/inspectionProcess";   // 해당하는 View의 이름을 반환
    }
}
