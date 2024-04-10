package com.cnr_furniture.controller;

import org.springframework.stereotype.Controller;
import lombok.extern.log4j.Log4j;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@Log4j
public class QualityController {
    /**
     * Desc: 품질관리-수입검사관리(자재IB)
     * @return: qualityInspection/inspectionIB
     */
    @GetMapping("/inspectionIB")
    public String ibInspection() {
        return "qualityInspection/inspectionIB";
    }

    /**
     * Desc: 품질관리-공정검사관리(process)
     * @return: qualityInspection/inspectionProcess
     */
    @GetMapping("/inspectionProcess")
    public String inspectionProcess() {
        return "qualityInspection/inspectionProcess";
    }

    /**
     * Desc: 품질관리-출하검사관리(제품OB)
     * @return: qualityInspection/inspectionOB
     */
    @GetMapping("/inspectionOB")
    public String inspectionOB() {
        return "qualityInspection/inspectionOB";
    }

    /**
     * Desc: 품질관리-공정불량실적
     * @return: qualityInspection/defectiveProcess
     */
    @GetMapping("/defectiveProcess")
    public String defectiveProcess() {
        return "qualityInspection/defectiveProcess";
    }

    /**
     * Desc: 품질관리-제품불량실적
     * @return: qualityInspection/defectiveItem
     */
    @GetMapping("/defectiveItem")
    public String defectiveItem() {
        return "qualityInspection/defectiveItem";
    }

}
