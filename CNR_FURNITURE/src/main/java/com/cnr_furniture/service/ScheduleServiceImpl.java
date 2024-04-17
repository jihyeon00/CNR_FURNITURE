package com.cnr_furniture.service;

import com.cnr_furniture.domain.scheduler.ScheduleSearch;
import com.cnr_furniture.domain.scheduler.ScheduleVO;
import com.cnr_furniture.mapper.MaterialInfoMapper;
import com.cnr_furniture.mapper.ScheduleMapper;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Log4j
@Service
public class ScheduleServiceImpl implements ScheduleService{

    @Autowired
    ScheduleMapper scheduleMapper;

    @Override
    public List<ScheduleVO> getWorkerList(ScheduleSearch scheduleSearch) {
        return scheduleMapper.getWorkerList(scheduleSearch);
    }
}
