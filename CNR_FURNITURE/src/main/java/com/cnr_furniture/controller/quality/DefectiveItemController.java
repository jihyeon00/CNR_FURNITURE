package com.cnr_furniture.controller.quality;

import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * Desc: 제품불량실적(defectiveItem)를 위한 Controller
 */
@Controller
@Log4j
public class DefectiveItemController {
    /**
     * Decs: 품질관리-제품불량실적 조회, with 검색
     */
    @GetMapping("/defectiveItem")
    public String getDefectiveItemList() {
        log.info("defectiveItem");
        return "qualityInspection/defectiveItem";   // 해당하는 View의 이름을 반환
    }
}
