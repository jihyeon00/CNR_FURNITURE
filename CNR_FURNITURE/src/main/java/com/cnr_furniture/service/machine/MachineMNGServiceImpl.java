package com.cnr_furniture.service.machine;

import com.cnr_furniture.domain.Machine.MachineCheckRecordVO;
import com.cnr_furniture.domain.Machine.MachineCheckVO;
import com.cnr_furniture.domain.Machine.SearchMachine;
import com.cnr_furniture.domain.Machine.MachineVO;
import com.cnr_furniture.mapper.MachineMNGMapper;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Log4j
@Service
public class MachineMNGServiceImpl implements MachineMNGService{
    @Autowired
    private MachineMNGMapper machineMNGMapper;

    // 설비 체크리스트 리스트
    @Override
    public List<MachineCheckVO> getMachineCheckList(){
        return machineMNGMapper.getMachineCheckList();
    }

    // 체크리스트 추가
    @Override
    public int insertMachineCheck(MachineCheckVO machineCheckVO){
        int rtn = machineMNGMapper.addMachineCheck(machineCheckVO);

        return rtn;
    }

    // 마지막 체크리스트 가져오기
    @Override
    public MachineCheckVO getMachineCheckOne(){
        return machineMNGMapper.getMachineCheckOne();
    }

    // 설비명과 ID 가져오기
    @Override
    public List<MachineVO> getMachineInfo() {
        return machineMNGMapper.getMachineInfo();
    }

    // 체크리스트 가져오기
    @Override
    public List<MachineCheckVO> getMachineCheckAll(SearchMachine searchMachine) {
        return machineMNGMapper.getMachineCheckAll(searchMachine);
    }

    // 체크리스트 기록 추가
    @Override
    public int insertMachineCheckRecord(MachineCheckRecordVO machineCheckRecordVO){
        int rtn = machineMNGMapper.insertMachineCheckRecord(machineCheckRecordVO);

        return rtn;
    }
}
