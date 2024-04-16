package com.cnr_furniture.service.machine;

import com.cnr_furniture.domain.Machine.MachineAddVO;
import com.cnr_furniture.domain.Machine.MachineVO;
import com.cnr_furniture.domain.Machine.SearchMachineVO;
import com.cnr_furniture.mapper.MachineInfoMapper;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Log4j
@Service
public class MachineInfoServiceImpl implements MachineInfoService{

    @Autowired
    private MachineInfoMapper machineInfoMapper;

    // 설비정보 리스트
    @Override
    public List<MachineVO> getMachineList(SearchMachineVO searchMachineVO){
        return machineInfoMapper.getMachineList(searchMachineVO);
    }

    // 설비 등록
    @Override
    public int insertMachine(MachineAddVO machineAddVO) {
        int rtn = machineInfoMapper.addMachine(machineAddVO);
        return rtn;
    }

    // 설비 등록(작동 테이블)
    @Override
    public int insertMachine2(MachineAddVO machineAddVO){
        int rtn = machineInfoMapper.addMachine2(machineAddVO);
        return rtn;
    }

    // 마지막 설비 한개만 가져오기
    @Override
    public MachineVO getMachineOne(){
        return machineInfoMapper.getMachineOne();
    }

    // 설비 위치 수정
    @Override
    public int updateMachinePosition(MachineAddVO machineAddVO){
        int rtn = machineInfoMapper.updateMachinePosition(machineAddVO);
        return rtn;
    }

}
