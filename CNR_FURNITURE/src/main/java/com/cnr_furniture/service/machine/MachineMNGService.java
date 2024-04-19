package com.cnr_furniture.service.machine;

import com.cnr_furniture.domain.Machine.*;

import java.util.List;

public interface MachineMNGService {
    // 설비 체크리스트 리스트
    List<MachineCheckVO> getMachineCheckList(SearchMachineCheckVO searchMachineCheckVO);

    // 설비 유형 가져오기
    List<MachineCheckVO> getMachineCheckType();

    // 점검 방법 가져오기
    List<MachineCheckVO> getMachineCheckMethod();

    // 체크리스트 추가
    int insertMachineCheck(MachineCheckVO machineCheckVO);

    // 마지막 체크리스트 가져오기
    MachineCheckVO getMachineCheckOne();

    // 설비명 ID 가져오기
    List<MachineVO> getMachineInfo();

    // 체크리스트 가져오기
    List<MachineCheckVO> getMachineCheckAll(SearchMachineVO searchMachineVO);

    //체크리스트 기록 추가
    int insertMachineCheckRecord(MachineCheckRecordVO machineCheckRecordVO);

    // 체크리스트 기록에서 'y'가 있으면 설비 상태 업데이트
    int updateMachineCondition(String mw_condition, String mw_status, int mcr_mi_id);

    // 체크리스트 기록에서 'y'가 없으면 설비상태가 '이상없음'으로 업데이트
    int updateMcWork(String mw_condition, int mcr_mi_id);

    // 설비 수리 이력관리 리스트 가져오기
    List<MachineRepairVO> McRepairList(SearchMachineVO searchMachineVO);
}
