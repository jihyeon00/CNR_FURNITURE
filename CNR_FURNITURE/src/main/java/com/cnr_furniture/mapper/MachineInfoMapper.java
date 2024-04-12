package com.cnr_furniture.mapper;

import com.cnr_furniture.domain.Machine.MachineAddVO;
import com.cnr_furniture.domain.Machine.MachineVO;
import com.cnr_furniture.domain.Machine.SearchMachineVO;

import java.util.List;

public interface MachineInfoMapper {

    // 설비 정보 리스트
    List<MachineVO> getMachineList(SearchMachineVO searchMachineVO);

    // 설비 등록
    int addMachine(MachineAddVO machineAddVO);

    // 마지막 설비만 가져오기
    MachineVO getMachineOne();

    // 설비 위치 업데이트
    int updateMachinePosition(MachineAddVO machineAddVO);
}
