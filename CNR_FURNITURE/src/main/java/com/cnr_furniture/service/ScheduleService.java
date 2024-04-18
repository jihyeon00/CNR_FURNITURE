package com.cnr_furniture.service;

import com.cnr_furniture.domain.scheduler.ScheduleSearch;
import com.cnr_furniture.domain.scheduler.ScheduleVO;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.List;

public interface ScheduleService {

   /** 사원테이블의 목록 조회 **/
    List<ScheduleVO> getWorkerList(ScheduleSearch scheduleSearch);

    /** 작업자 목록 조회 **/
    List<ScheduleVO> getScheduleAll();
}
