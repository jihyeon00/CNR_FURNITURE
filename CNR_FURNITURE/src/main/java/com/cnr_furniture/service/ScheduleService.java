package com.cnr_furniture.service;

import com.cnr_furniture.domain.scheduler.ScheduleSearch;
import com.cnr_furniture.domain.scheduler.ScheduleVO;

import java.util.List;

public interface ScheduleService {

    List<ScheduleVO> getWorkerList(ScheduleSearch scheduleSearch);
}
