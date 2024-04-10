package com.cnr_furniture.mapper;

import com.cnr_furniture.domain.process.*;
import org.apache.ibatis.annotations.Mapper;


import java.util.List;

@Mapper
public interface ProcessMapper {
    List<ProcessVO> selectProcess(ProcessDate processDate);   // 날짜 조회

    List<ProcessItemVO> selectAllItems(); // 제품 정보 조회

    List<ProcessInfoVO> selectPi(); // 공정 정보 조회
    List<ProcessCtVO> selecProCt(); // 계약 정보 조회
}


