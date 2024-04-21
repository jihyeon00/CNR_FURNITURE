package com.cnr_furniture.service.machine;

import com.cnr_furniture.domain.Machine.*;
import com.cnr_furniture.mapper.MachineMNGMapper;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Log4j
@Service
public class MachineMNGServiceImpl implements MachineMNGService {
    @Autowired
    private MachineMNGMapper machineMNGMapper;

    /** 설비 체크리스트 리스트 **/
    @Override
    public List<MachineCheckVO> getMachineCheckList(SearchMachineCheckVO searchMachineCheckVO) {
        return machineMNGMapper.getMachineCheckList(searchMachineCheckVO);
    }

    /** 설비 유형 가져오기 **/
    @Override
    public List<MachineCheckVO> getMachineCheckType() {
        return machineMNGMapper.getMachineCheckType();
    }

    /** 점검 방법 가져오기 **/
    @Override
    public List<MachineCheckVO> getMachineCheckMethod() {
        return machineMNGMapper.getMachineCheckMethod();
    }

    /** 체크리스트 추가 **/
    @Override
    public int insertMachineCheck(MachineCheckVO machineCheckVO) {
        int rtn = machineMNGMapper.addMachineCheck(machineCheckVO);

        return rtn;
    }

    /** 마지막 체크리스트 가져오기 **/
    @Override
    public MachineCheckVO getMachineCheckOne() {
        return machineMNGMapper.getMachineCheckOne();
    }

    /** 설비명, 설비 ID 가져오기 **/
    @Override
    public List<MachineVO> getMachineInfo() {
        return machineMNGMapper.getMachineInfo();
    }

    /** 체크리스트 가져오기 **/
    @Override
    public List<MachineCheckVO> getMachineCheckAll(SearchMachineVO searchMachineVO) {
        return machineMNGMapper.getMachineCheckAll(searchMachineVO);
    }

    /** 체크리스트 기록 추가 **/
    @Override
    public int insertMachineCheckRecord(MachineCheckRecordVO machineCheckRecordVO) {
        int rtn = machineMNGMapper.insertMachineCheckRecord(machineCheckRecordVO);

        return rtn;
    }

    /** 체크리스트 기록에서 'Y' 면 설비 상태 업데이트 **/
    @Override
    public int updateMachineCondition(String mw_condition, String mw_status, int mcr_mi_id) {
        MachineWorkVO machineWorkVO = new MachineWorkVO();
        machineWorkVO.setMw_condition(mw_condition);
        machineWorkVO.setMw_status(mw_status);
        machineWorkVO.setMcr_mi_id(mcr_mi_id);

        return machineMNGMapper.updateMachineCondition(machineWorkVO);
    }

    /** 체크리스트 기록에서 'N' 면 설비상태가 '이상없음' 으로 업데이트 **/
    @Override
    public int updateMcWork(String mw_condition, int mcr_mi_id) {
        MachineWorkVO machineWorkVO = new MachineWorkVO();
        machineWorkVO.setMw_condition(mw_condition);
        machineWorkVO.setMcr_mi_id(mcr_mi_id);

        return machineMNGMapper.updateMcWork(machineWorkVO);
    }

    /** 설비 수리 이력 관리 리스트 가져오기 **/
    @Override
    public List<MachineRepairVO> McRepairList(SearchMachineVO searchMachineVO) {
        return machineMNGMapper.McRepairList(searchMachineVO);
    }
}


