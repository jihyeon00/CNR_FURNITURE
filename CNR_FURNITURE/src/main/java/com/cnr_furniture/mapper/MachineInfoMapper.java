package com.cnr_furniture.mapper;

import com.cnr_furniture.domain.Machine.*;

import java.util.List;

public interface MachineInfoMapper {


    /**
     * Desc: 설비 정보 리스트 & 검색
     */
    List<MachineVO> getMachineList(SearchMachineVO searchMachineVO);

    /**
     * Desc: 설비 등록
     */
    int addMachine(MachineAddVO machineAddVO);

    /**
     * Desc: 설비 등록 (작동 테이블)
     */
    int addMachine2(MachineAddVO machineAddVO);

    /**
     * Desc: 마지막 설비만 가져오기
     */
    MachineVO getMachineOne();

    /**
     * Desc: 설비 위치 업데이트
     */
    int updateMachinePosition(MachineAddVO machineAddVO);

    /**
     * Desc: 설비 가동 현황 리스트 & 검색
     */
    List<MachineWorkVO> mcWorkList(SearchMachineVO searchMachineVO);

    /**
     * Desc: 설비 관리 리스트 & 검색
     */
    List<MachineWorkVO> mcManagementList(SearchMachineVO searchMachineVO);

    /**
     * Desc: 설비 관리 수리버튼 클릭 시 '수리중' 으로 업데이트
     */
    int mcUpdateRepair(MachineWorkVO machineWorkVO);

    /**
     * Desc: 설비 관리 수리완료 버튼 클릭 시 '수리완료' 로 업데이트
     */
    int mcRepairCompleted(MachineWorkVO machineWorkVO);

    /**
     * Desc: 수리 완료 되었을 때 설비수리이력 테이블에 데이터 insert
     */
    int addMcRepair(MachineRepairAddVO machineRepairAddVO);

}
