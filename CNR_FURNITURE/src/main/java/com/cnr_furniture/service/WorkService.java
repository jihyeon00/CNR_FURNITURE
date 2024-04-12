package com.cnr_furniture.service;

import com.cnr_furniture.domain.work.WorkProcessInfoVO;
import com.cnr_furniture.domain.work.WorkSearchVO;

import java.util.List;

public interface WorkService {
    /** 제조수행정보 목록 */
    List<WorkProcessInfoVO> selectWorkProcessInfo(WorkSearchVO workSearchVO);


}
