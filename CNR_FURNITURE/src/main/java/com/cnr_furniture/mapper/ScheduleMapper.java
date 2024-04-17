package com.cnr_furniture.mapper;

import com.cnr_furniture.domain.ItemInfo.ItemInfoSearch;
import com.cnr_furniture.domain.ItemInfo.ItemInfoVO;
import com.cnr_furniture.domain.scheduler.ScheduleSearch;
import com.cnr_furniture.domain.scheduler.ScheduleVO;

import java.util.List;

public interface ScheduleMapper {
    
    
    //사원테이블의 목록 조회
    List<ScheduleVO> getWorkerList(ScheduleSearch scheduleSearch);
    
    
}
