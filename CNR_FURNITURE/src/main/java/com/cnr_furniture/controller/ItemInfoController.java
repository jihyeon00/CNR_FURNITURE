package com.cnr_furniture.controller;

import com.cnr_furniture.domain.ItemInfoVO;
import com.cnr_furniture.service.ItemInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.method.P;
import org.springframework.stereotype.Controller;
import lombok.extern.log4j.Log4j;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@Log4j
public class ItemInfoController {

    @Autowired
    private ItemInfoService itemInfoService;

    @GetMapping("/itemInfo")
    public String itemInfo(Model model) {

        List<ItemInfoVO> itemInfoVOList = itemInfoService.getItemInfoList();
        model.addAttribute("itemList", itemInfoVOList);

        return "standardInfo/itemInfo";
    }

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

    @PostMapping("/itemUpdate")
    public String itemUpdate(
            @RequestParam("i_name") String i_name,
            @RequestParam("i_color") String i_color,
            @RequestParam("i_standard") String i_standard,
            @RequestParam("i_type") String i_type,
            @RequestParam("i_uses") String i_uses,
            @RequestParam("i_id") int i_id,
            RedirectAttributes rttr
    ){
        int rtn = itemInfoService.updateItem(i_name, i_color, i_standard, i_type, i_uses, i_id);
        rttr.addFlashAttribute("updateSuccessCount", rtn);

        return "redirect:itemInfo";
    }
}
