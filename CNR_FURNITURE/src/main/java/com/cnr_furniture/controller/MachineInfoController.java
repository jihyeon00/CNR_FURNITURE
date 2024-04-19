package com.cnr_furniture.controller;

import com.cnr_furniture.domain.Machine.*;
import com.cnr_furniture.service.machine.MachineInfoService;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import lombok.extern.log4j.Log4j;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@Log4j
@AllArgsConstructor
public class MachineInfoController {

    // 설비 정보 리스트
    @Autowired
    private MachineInfoService machineInfoService;

    @GetMapping("/machineInfo")
    public String machineInfo(SearchMachineVO searchMachineVO, Model model) {
        model.addAttribute("searchMachine", searchMachineVO);

        List<MachineVO> machineVOList = machineInfoService.getMachineList(searchMachineVO);

        model.addAttribute("machineVOList", machineVOList);

        return "machine/machineInfo";
    }

    // 설비 등록
    @PostMapping("/machineInfoAdd")
    @ResponseBody
    public MachineVO insertMachine(
            @RequestBody MachineAddVO machineAddVO,
            RedirectAttributes rttr
    ) {
        // 실제 DB에 텍스트 데이터 저장
        // machine_info insert
        int rtn = machineInfoService.insertMachine(machineAddVO);
        rttr.addFlashAttribute("insertSuccessCount", rtn);

        // machine_work insert
        int rtr = machineInfoService.insertMachine2(machineAddVO);
        rttr.addFlashAttribute("insertSuccessCount", rtr);

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

    // 설비 수정
    @PostMapping("/machineInfoUpdate")
    public String updateMachinePosition(MachineAddVO machineAddVO, RedirectAttributes rttr){
        int rtn = machineInfoService.updateMachinePosition(machineAddVO);
        rttr.addFlashAttribute("updateSuccessCount", rtn);

        return "redirect:/machineInfo";
    }

    // 설비 가동 현황
    @GetMapping("/machineOperationStatus")
    public String machineOperationStatus(SearchMachineVO searchMachineVO, Model model){

        model.addAttribute("searchMachine", searchMachineVO);

        List<MachineWorkVO> mcWorkList = machineInfoService.mcWorkList(searchMachineVO);

        model.addAttribute("mcWorkList", mcWorkList);

        return "machine/machineOperationStatus";
    }

    // 설비 관리 리스트
    @GetMapping("/machineManagement")
    public String machineManagement(SearchMachineVO searchMachineVO, Model model){

        model.addAttribute("searchMachine", searchMachineVO);

        List<MachineWorkVO> mcManagementList = machineInfoService.mcManagementList(searchMachineVO);

        model.addAttribute("mcManagementList", mcManagementList);

        return "machine/machineManagement";
    }

    // 설비 관리 수리버튼 클릭 시 '수리 중'으로 업데이트
    @PostMapping("/updateRepairStatus")
    @ResponseBody
    public String mcUpdateRepair(@RequestBody MachineWorkVO machineWorkVO, RedirectAttributes rttr){
        int mwMiId = machineWorkVO.getMw_mi_id();

        // 설비 관리 수리버튼 클릭 시 '수리 중'으로 업데이트
        int rtn = machineInfoService.mcUpdateRepair(machineWorkVO);
        rttr.addFlashAttribute("updateSuccessCount", rtn);

        return "redirect:/machineManagement";
    }

    // 설비 관리 수리완료 버튼 클릭 시 '수리완료'로 업데이트 & insert
    @PostMapping("/mcRepairCompleted")
    @ResponseBody
    public String mcRepairCompleted(@RequestBody MachineWorkVO machineWorkVO, MachineRepairAddVO machineRepairAddVO, RedirectAttributes rttr){
        int mwMiId = machineWorkVO.getMw_mi_id();

        // 설비 관리 수리완료 버튼 클릭 시 '수리완료'로 업데이트
        int rtr = machineInfoService.mcRepairCompleted(machineWorkVO);
        rttr.addFlashAttribute("updateSuccessCount", rtr);

        // 수리완료 되었을 때 설비수리이력 테이블에 데이터 insert
        machineRepairAddVO = new MachineRepairAddVO();
        machineRepairAddVO.setMw_mi_id(mwMiId); // 설비 번호 설정
        int rtt = machineInfoService.addMcRepair(machineRepairAddVO);
        rttr.addFlashAttribute("insertSuccessCount", rtt);

        return "redirect:/machineManagement";
    }
}
