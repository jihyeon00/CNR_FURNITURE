package com.cnr_furniture.controller;

import com.cnr_furniture.domain.Machine.MachineCheckRecordVO;
import com.cnr_furniture.domain.Machine.MachineCheckVO;
import com.cnr_furniture.domain.Machine.SearchMachine;
import com.cnr_furniture.domain.Machine.MachineVO;
import com.cnr_furniture.service.machine.MachineMNGService;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import lombok.extern.log4j.Log4j;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.ArrayList;
import java.util.List;

@Controller
@Log4j
@AllArgsConstructor
public class MachineMNGController {

    // 설비 체크리스트 리스트
    @Autowired
    private MachineMNGService machineMNGService;

    @GetMapping("/machineCheckInfo")
    public String machineCheckInfo(Model model) {
        List<MachineCheckVO> machineCheckVOList = machineMNGService.getMachineCheckList();

        model.addAttribute("machineCheckVOList", machineCheckVOList);
        return "machine/machineCheckInfo";
    }

    // 체크리스트 등록
    @PostMapping("/machineCheckInfo")
    @ResponseBody
    public MachineCheckVO insertMachineCheck(
            @RequestBody MachineCheckVO machineCheckVO,
            RedirectAttributes rttn
    ){
        // 실제 DB에 텍스트 데이터 저장
        int rtn = machineMNGService.insertMachineCheck(machineCheckVO);
        rttn.addFlashAttribute("insertSuccessCount", rtn);

        // DB에서 입력했던 정보를 바탕으로 DB에서 추가한 설비정보 데이터를 가져온다.
        MachineCheckVO machineCheckVOOne = machineMNGService.getMachineCheckOne();

        // 위에서 가져온 데이터를 아래 vo에 맞게 set한다.
        MachineCheckVO machineCheckVOone = new MachineCheckVO();
        machineCheckVOOne.setMci_id(machineCheckVOOne.getMci_id());
        machineCheckVOOne.setMci_div(machineCheckVOOne.getMci_div());
        machineCheckVOOne.setMci_method(machineCheckVOOne.getMci_method());
        machineCheckVOOne.setMci_condition(machineCheckVOOne.getMci_condition());

        return machineCheckVO;

    }

    // 설비 체크리스트 작성
    @GetMapping("/machineCheck")
    public String machineCheck(SearchMachine searchMachine, Model model) {

        // 설비 ID와 이름 가져오기
        List<MachineVO> getMachineInfo = machineMNGService.getMachineInfo();
        model.addAttribute("getMachineInfo", getMachineInfo);

        // 리스트 가져오기
        List<MachineCheckVO> getMachineCheckAll;
        if (searchMachine != null && searchMachine.getFind_machine_id() != null) {
            getMachineCheckAll = machineMNGService.getMachineCheckAll(searchMachine);
        } else {
            // 선택된 설비가 없는 경우 빈 리스트 반환
            getMachineCheckAll = new ArrayList<>();
        }
        model.addAttribute("getMachineCheckAll", getMachineCheckAll);

        // 이 코드를 쓰면 설비를 선택하지 않았을 때 설비 전체가 나옴
//        List<MachineCheckVO> getMachineCheckAll = machineMNGService.getMachineCheckAll(searchMachine);
//        model.addAttribute("getMachineCheckAll", getMachineCheckAll);

        return "machine/machineCheck";
    }

    // 체크리스트 기록 추가
    @PostMapping("/machineCheckAdd")
    @ResponseBody
    public ResponseEntity<MachineCheckRecordVO> machineCheckRecord(@RequestBody MachineCheckRecordVO machineCheckRecordVO, RedirectAttributes rttr) {
        int rtn = machineMNGService.insertMachineCheckRecord(machineCheckRecordVO);
        rttr.addFlashAttribute("insertSuccessCount", rtn);

        return ResponseEntity.ok(machineCheckRecordVO);
    }

    // 설비 관리
    @GetMapping("/machineManagement")
    public String machineManagement(){
        return "machine/machineManagement";
    }



}
