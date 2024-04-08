package com.cnr_furniture.controller;

import com.cnr_furniture.domain.Machine.MachineAddVO;
import com.cnr_furniture.domain.Machine.MachineVO;
import com.cnr_furniture.service.machine.MachineInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import lombok.extern.log4j.Log4j;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@Log4j
public class MachineInfoController {

    // 설비 정보 리스트
    @Autowired
    private MachineInfoService machineInfoService;

    @GetMapping("/machineInfo")
    public String machineInfo(Model model) {
        List<MachineVO> machineVOList = machineInfoService.getMachineList();

        model.addAttribute("machineVOList", machineVOList);

        return "machine/machineInfo";
    }

    // 설비 등록
    @PostMapping("/machineInfo")
    @ResponseBody
    public MachineVO insertMachine(
            @RequestBody MachineAddVO machineAddVO,
            RedirectAttributes rttr
    ) {
        // 실제 DB에 텍스트 데이터 저장
        int rtn = machineInfoService.insertMachine(machineAddVO);
        rttr.addFlashAttribute("insertSuccessCount", rtn);

        // DB에서 입력했던 정보를 바탕으로 DB에서 추가한 설비정보 데이터를 가져온다
        MachineVO machineVOOne = machineInfoService.getMachineOne();

        // 위에서 가져온 데이터를 아래 vo에 맞게 set을 한다.
        MachineVO machineVO = new MachineVO();
        machineVO.setRownum(machineVOOne.getRownum());
        machineVO.setMi_id(machineVOOne.getMi_id());;
        machineVO.setMi_name(machineVOOne.getMi_name());
        machineVO.setMi_type(machineVOOne.getMi_type());
        machineVO.setMi_position(machineVOOne.getMi_position());

        return machineVO;
    }


    @GetMapping("/machineCheckInfo")
    public String machineCheckInfo() {
        return "machine/machineCheckInfo";
    }

}
