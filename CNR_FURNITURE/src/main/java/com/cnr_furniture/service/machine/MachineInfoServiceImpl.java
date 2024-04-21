package com.cnr_furniture.service.machine;

import com.cnr_furniture.domain.Machine.*;
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

    /** 설비 정보 리스트 **/
    @Override
    public List<MachineVO> getMachineList(SearchMachineVO searchMachineVO){
        return machineInfoMapper.getMachineList(searchMachineVO);
    }

    /** 설비 등록 **/
    @Override
    public int insertMachine(MachineAddVO machineAddVO) {
        int rtn = machineInfoMapper.addMachine(machineAddVO);
        return rtn;
    }

    /** 설비 등록 (작동 테이블) **/
    @Override
    public int insertMachine2(MachineAddVO machineAddVO){
        int rtn = machineInfoMapper.addMachine2(machineAddVO);
        return rtn;
    }

    /** 마지막 설비 한 개만 가져오기 **/
    @Override
    public MachineVO getMachineOne(){
        return machineInfoMapper.getMachineOne();
    }

    /** 설비 위치 수정 **/
    @Override
    public int updateMachinePosition(MachineAddVO machineAddVO){
        int rtn = machineInfoMapper.updateMachinePosition(machineAddVO);
        return rtn;
    }

    /** 설비 가동 현황 리스트 **/
    @Override
    public List<MachineWorkVO> mcWorkList(SearchMachineVO searchMachineVO) {
        return machineInfoMapper.mcWorkList(searchMachineVO);
    }

    /** 설비 관리 리스트 **/
    @Override
    public List<MachineWorkVO> mcManagementList(SearchMachineVO searchMachineVO) {
        return machineInfoMapper.mcManagementList(searchMachineVO);
    }

    /** 설비 관리 수리버튼 클릭 시 '수리중' 으로 업데이트 **/
    @Override
    public int mcUpdateRepair(MachineWorkVO machineWorkVO) {
        int rtn = machineInfoMapper.mcUpdateRepair(machineWorkVO);
        return rtn;
    }

    /** 설비 관리 수리완료 버튼 클릭 시 '수리완료' 로 업데이트 **/
    @Override
    public int mcRepairCompleted(MachineWorkVO machineWorkVO) {
        int rtn = machineInfoMapper.mcRepairCompleted(machineWorkVO);
        return rtn;
    }

    /** 수리 완료 되었을 때 설비 수리 이력 테이블에 데이터 insert **/
    @Override
    public int addMcRepair(MachineRepairAddVO machineRepairAddVO) {
        int rtn = machineInfoMapper.addMcRepair(machineRepairAddVO);

        return rtn;
    }
}
