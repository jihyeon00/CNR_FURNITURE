package com.cnr_furniture.service.machine;

import com.cnr_furniture.domain.Machine.*;

import java.util.List;

public interface MachineInfoService {

    // 설비정보 리스트
    List<MachineVO> getMachineList(SearchMachineVO searchMachineVO);

    // 설비 등록
    int insertMachine(MachineAddVO machineAddVO);

    // 설비 등록 (작동 테이블)
    int insertMachine2(MachineAddVO machineAddVO);

    // 마지막 설비 한 개만 가져오기
    MachineVO getMachineOne();

    // 설비 위치 수정
    int updateMachinePosition(MachineAddVO machineAddVO);

    // 설비 가동 현황 리스트
    List<MachineWorkVO> mcWorkList(SearchMachineVO searchMachineVO);

    // 설비 관리 리스트
    List<MachineWorkVO> mcManagementList(SearchMachineVO searchMachineVO);

    // 설비 관리 수리버튼 클릭 시 '수리중'으로 업데이트
    int mcUpdateRepair(MachineWorkVO machineWorkVO);

    // 설비 관리 수리완료 버튼 클릭 시 '수리완료'로 업데이트
    int mcRepairCompleted(MachineWorkVO machineWorkVO);

    // 수리완료 되었을 때 설비수리이력 테이블에 데이터 insert
    int addMcRepair(MachineRepairAddVO machineRepairAddVO);
}
