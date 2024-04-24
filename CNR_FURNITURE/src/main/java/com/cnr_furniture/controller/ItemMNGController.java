package com.cnr_furniture.controller;

import com.cnr_furniture.domain.inventory.CriteriaItemInventoryVO;
import com.cnr_furniture.domain.inventory.ItemInventoryListVO;
import com.cnr_furniture.service.ItemInventoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import lombok.extern.log4j.Log4j;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
@Log4j
public class ItemMNGController {
    @Autowired
    private final ItemInventoryService itemInventoryService;

    @Autowired
    public ItemMNGController(ItemInventoryService itemInventoryService) {
        this.itemInventoryService = itemInventoryService;
    }

    /**
     * Desc: 제품관리-제품IB
     * @return: itemManagement/itemIB
     */
    /*@GetMapping("/itemIB")      // localhost:8085/itemIB
    public String itemIB() {
        return "itemManagement/itemIB";
    }*/

    /**
     * Desc: 제품관리-반제품OB
     * @return: itemManagement/itemSemiOB
     */
    /*@GetMapping("/itemSemiOB")  // localhost:8085:itemSemiOB
    public String itemSemiOB() {
        return "itemManagement/itemSemiOB";
    }*/

    /**
     * Desc: 제품관리-완제품OB
     * @return: itemManagement/itemSemiOB
     */
   /* @GetMapping("/itemFinishedOB")  // localhost:8085:itemSemiOB
    public String itemFinishedOB() {
        return "itemManagement/itemFinishedOB";
    }*/

    /**
     * Desc: 제품관리-제품재고-조회
     * @return: itemManagement/itemInventory
     */
    @GetMapping("inventory/itemInventory")
    public String itemInventory(CriteriaItemInventoryVO cri, Model model) {
        model.addAttribute("itemIDList", itemInventoryService.getItemIDList());     // 검색 - 제품번호
        model.addAttribute("itemNameList", itemInventoryService.getItemNameList()); // 검색 - 제품명
        model.addAttribute("itemUsesList", itemInventoryService.getItemUsesList()); // 검색 - 제품용도

        // 제품 재고 목록 조회(with 검색)
        List<ItemInventoryListVO> itemInventoryList = itemInventoryService.getItemInventoryList(cri);
        if (itemInventoryList.isEmpty()) {
            log.warn("검색 결과가 없습니다.");
        } else {
            model.addAttribute("itemInventoryList", itemInventoryList);
            model.addAttribute("cri", cri);
        }

        return "inventory/itemInventory";
    }

    /**
     * Desc: 제품관리-수주정보-조회
     * @return: itemManagement/itemContractInfo
     */
    /*@GetMapping("/itemContractInfo")
    public String itemContractInfo() {
        return "itemManagement/itemContractInfo";
    }*/
}
