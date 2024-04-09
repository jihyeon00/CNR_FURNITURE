package com.cnr_furniture.service.machine;


import com.cnr_furniture.domain.Machine.MachineCheckVO;
import com.cnr_furniture.domain.Machine.SearhMachine;
import com.cnr_furniture.domain.MachineVO;
import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Log4j
public class MachineMNGServiceImpl implements MachineMNGService {
    @Override
    public List<MachineCheckVO> getMachineCheckList() {
        return null;
    }

    @Override
    public int insertMachineCheck(MachineCheckVO machineCheckVO) {
        return 0;
    }

    @Override
    public MachineCheckVO getMachineCheckOne() {
        return null;
    }

    @Override
    public List<MachineVO> getMachineInfo() {
        return null;
    }

    @Override
    public List<MachineCheckVO> getMachineCheckAll(SearhMachine searhMachine) {
        return null;
    }
}
