package com.cnr_furniture.controller;

import org.springframework.stereotype.Controller;
import lombok.extern.log4j.Log4j;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@Log4j
public class ItemMNGController {
    /**
     * Desc: 제품관리-제품IB
     * @return: itemManagement/itemIB
     */
    @GetMapping("/itemIB")      // localhost:8085/itemIB
    public String itemIB() {
        return "itemManagement/itemIB";
    }

    /**
     * Desc: 제품관리-반제품OB
     * @return: itemManagement/itemSemiOB
     */
    @GetMapping("/itemSemiOB")  // localhost:8085:itemSemiOB
    public String itemSemiOB() {
        return "itemManagement/itemSemiOB";
    }

    /**
     * Desc: 제품관리-완제품OB
     * @return: itemManagement/itemSemiOB
     */
    @GetMapping("/itemFinishedOB")  // localhost:8085:itemSemiOB
    public String itemFinishedOB() {
        return "itemManagement/itemFinishedOB";
    }

}
