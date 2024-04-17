package com.cnr_furniture.controller;

import com.cnr_furniture.domain.ItemInfo.ItemInfoSearch;
import com.cnr_furniture.domain.ItemInfo.ItemInfoVO;
import com.cnr_furniture.service.ItemInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import lombok.extern.log4j.Log4j;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@Log4j
public class ItemInfoController {

    @Autowired
    private ItemInfoService itemInfoService;


    /**
     * Desc: 제품 조회
     * @return: /itemInfo
     */
    @GetMapping("/itemInfo")
    public String itemInfo(ItemInfoSearch itemInfoSearch, Model model) {

        List<ItemInfoVO> itemInfoVOList = itemInfoService.getItemInfoList(itemInfoSearch);
        model.addAttribute("itemList", itemInfoVOList);
        model.addAttribute("itemSearch", itemInfoSearch);

        return "standardInfo/itemInfo";
    }

    /**
     * Desc: 제품 등록
     * @return: /itemInsert
     */
    @PostMapping("/itemInsert")
    public String itemInsert(
            @RequestParam("i_name") String i_name,
            @RequestParam("i_color") String i_color,
            @RequestParam("i_standard") String i_standard,
            @RequestParam("i_type") String i_type,
            @RequestParam("i_uses") String i_uses,
            RedirectAttributes rttr
    ){
        int rtn = itemInfoService.insertItem(i_name, i_color, i_standard, i_type, i_uses);
        rttr.addFlashAttribute("insertSuccessCount", rtn);
        return "redirect:itemInfo";
    }

    /**
     * Desc: 수정할 제품 값 불러오기
     * @return: /itemUpdate/{i_id}
     */
    @ResponseBody
    @GetMapping(value = "/itemUpdate/{i_id}", produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<ItemInfoVO> get(@PathVariable("i_id") int i_id) {
        return new ResponseEntity<>(itemInfoService.getOneItem(i_id), HttpStatus.OK);
    }

    /**
     * Desc: 제품 수정
     * @return: /itemUpdate
     */
    @PostMapping("/itemUpdate")
    public String itemUpdate(
            @RequestParam("i_name2") String i_name,
            @RequestParam("i_color2") String i_color,
            @RequestParam("i_standard2") String i_standard,
            @RequestParam("i_type2") String i_type,
            @RequestParam("i_uses2") String i_uses,
            @RequestParam("i_id2") int i_id,
            RedirectAttributes rttr
    ){
        int rtn = itemInfoService.updateItem(i_name, i_color, i_standard, i_type, i_uses, i_id);
        rttr.addFlashAttribute("updateSuccessCount", rtn);

        return "redirect:itemInfo";
    }



}
