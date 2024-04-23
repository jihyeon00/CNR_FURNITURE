package com.cnr_furniture.controller;

import com.cnr_furniture.domain.ItemInfo.ItemInfoVO;
import com.cnr_furniture.domain.MaterialInfo.MaterialInfoSearch;
import com.cnr_furniture.domain.MaterialInfo.MaterialInfoVO;
import com.cnr_furniture.service.MaterialInfoService;
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
public class MaterialInfoController {

    @Autowired
    MaterialInfoService mtInfoService;


    /**
     * Desc: 자재 조회 및 검색
     * @return: /standardInfo/materialInfo
     */
    @GetMapping("/standardInfo/materialInfo")
    public String materialInfo(MaterialInfoSearch MTInfoSearch, Model model) {

        List<MaterialInfoVO> mtInfoVOList = mtInfoService.getMaterialInfo(MTInfoSearch);
        model.addAttribute("mtList", mtInfoVOList);
        model.addAttribute("mtSearch", MTInfoSearch);

        return "standardInfo/materialInfo";
    }

    /**
     * Desc: 자재 등록
     * @return: /materialInsert
     */
    @PostMapping("/standardInfo/materialInsert")
    public String materialInsert(
            @RequestParam("m_name") String m_name,
            @RequestParam("m_uses") String m_uses,
            RedirectAttributes rttr
    ){
        int rtn = mtInfoService.insertMaterial(m_name, m_uses);
        rttr.addFlashAttribute("insertSuccessCount", rtn);
        return "redirect:materialInfo";
    }

    /**
     * Desc: 수정할 제품 값 불러오기
     * @return: materialUpdate/{m_id}
     */
    @ResponseBody
    @GetMapping(value = "/materialUpdate/{m_id}", produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<MaterialInfoVO> get(@PathVariable("m_id") int m_id) {
        return new ResponseEntity<>(mtInfoService.getOneMaterial(m_id), HttpStatus.OK);
    }


    /**
     * Desc: 제품 수정
     * @return: /materialUpdate
     */
    @PostMapping("/standardInfo/materialUpdate")
    public String materialUpdate(
            @RequestParam("m_name2") String m_name,
            @RequestParam("m_uses2") String m_uses,
            @RequestParam("m_id2") int m_id,
            RedirectAttributes rttr
    ){
        int rtn = mtInfoService.updateMaterial(m_name, m_uses, m_id);
        rttr.addFlashAttribute("updateSuccessCount", rtn);
        return "redirect:materialInfo";
    }


}
