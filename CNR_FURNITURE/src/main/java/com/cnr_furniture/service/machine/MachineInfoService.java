package com.cnr_furniture.service.machine;

import com.cnr_furniture.domain.Machine.MachineAddVO;
import com.cnr_furniture.domain.Machine.MachineVO;

import java.util.List;

public interface MachineInfoService {

    // 설비정보 리스트
    List<MachineVO> getMachineList();

    // 설비 등록
    int insertMachine(MachineAddVO machineAddVO);

    // 마지막 설비 한 개만 가져오기
    MachineVO getMachineOne();
}
