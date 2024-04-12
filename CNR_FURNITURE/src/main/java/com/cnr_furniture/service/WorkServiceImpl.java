package com.cnr_furniture.service;

import com.cnr_furniture.domain.work.WorkProcessInfoVO;
import com.cnr_furniture.domain.work.WorkSearchVO;
import com.cnr_furniture.mapper.WorkMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;

import java.util.List;

@Log4j
@Service
public class WorkServiceImpl implements WorkService{
    @Autowired
    private WorkMapper workMapper;

    /** 제조수행정보 조회 */
    @Override
    public List<WorkProcessInfoVO> selectWorkProcessInfo(WorkSearchVO workSearchVO) {
        return workMapper.selectWorkProcessInfo(workSearchVO);
    }
}
