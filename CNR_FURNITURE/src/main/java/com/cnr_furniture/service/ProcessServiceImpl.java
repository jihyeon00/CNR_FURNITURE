package com.cnr_furniture.service;

import com.cnr_furniture.domain.process.*;
import com.cnr_furniture.mapper.ProcessMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;

import java.util.List;

@Log4j
@Service
public class ProcessServiceImpl implements ProcessService{
    @Autowired
    private ProcessMapper processMapper;


    @Override
    public List<ProcessVO> selectProcess(ProcessDate processDate) {
        return processMapper.selectProcess(processDate);
    }

    @Override
    public List<ProcessItemVO> findAllItems() {
        return processMapper.selectAllItems();
    }

    @Override
    public List<ProcessInfoVO> findAllPi(){
        return processMapper.selectPi();
    }
    @Override
    public List<ProcessCtVO> findAllProCt() {
        return processMapper.selecProCt();
    }

}


