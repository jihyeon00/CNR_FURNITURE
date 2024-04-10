package com.cnr_furniture.service;

import com.cnr_furniture.domain.process.*;

import java.util.List;

public interface ProcessService {
    List<ProcessVO> selectProcess(ProcessDate processDate);
    List<ProcessItemVO> findAllItems(); // 아이템 정보 조회 메소드 추가
    List<ProcessInfoVO> findAllPi(); // 공정정보 목록
    List<ProcessCtVO> findAllProCt(); // 계약정보 목록

}

