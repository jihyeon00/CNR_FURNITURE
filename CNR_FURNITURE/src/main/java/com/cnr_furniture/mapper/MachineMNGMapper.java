package com.cnr_furniture.mapper;

import com.cnr_furniture.domain.Machine.*;

import java.util.List;

public interface MachineMNGMapper {
    /**
     * Desc: 설비 체크리스트 정보 리스트
     */
    List<MachineCheckVO> getMachineCheckList(SearchMachineCheckVO searchMachineCheckVO);

    /**
     * Desc: 설비 유형 가져오기
     */
    List<MachineCheckVO> getMachineCheckType();

    /**
     * Desc: 점검 방법 가져오기
     */
    List<MachineCheckVO> getMachineCheckMethod();

    /**
     * Desc: 체크리스트 추가
     */
    int addMachineCheck(MachineCheckVO machineCheckVO);

    /**
     * Desc: 마지막 체크리스트 보여주기
     */
    MachineCheckVO getMachineCheckOne();

    /**
     * Desc: 설비명, 설비 ID 가져오기
     */
    List<MachineVO> getMachineInfo();

    /**
     * Desc: 선택한 설비명의 설비 ID에 맞는 체크리스트 보여주기
     */
    List<MachineCheckVO> getMachineCheckAll(SearchMachineVO searchMachineVO);

    /**
     * Desc: 체크리스트 기록 추가
     */
    int insertMachineCheckRecord(MachineCheckRecordVO machineCheckRecordVO);

    /**
     * Desc: 체크리스트 기록에서 'Y' 면 설비 상태와 가동상태 업데이트
     */
    int updateMachineCondition(MachineWorkVO machineWorkVO);

    /**
     * Desc: 체크리스트 기록에서 'N' 면 설비 상태와 가동상태 업데이트
     */
    int updateMcWork(MachineWorkVO machineWorkVO);

    /**
     * Desc: 설비 수리 이력관리 리스트 가져오기
     */
    List<MachineRepairVO> McRepairList(SearchMachineVO searchMachineVO);
}
