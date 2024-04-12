package com.cnr_furniture.mapper;

import com.cnr_furniture.domain.process.ProcessDate;
import com.cnr_furniture.domain.process.ProcessVO;
import com.cnr_furniture.domain.work.*;

import java.util.List;

public interface WorkMapper {
    /**
     * 거래처 정보 조회
     * work 의 거래처 정보 검색을 위함
     */
    List<WorkSelectCompanyVO> workSelectCompanyList();

    /**
     * 제품 정보 조회
     * work 의 제품 정보 검색을 위함
     */
    List<WorkSelectItemVO> workSelectItemList();

    /**
     * 제조 LOT 번호 및 제품 정보 조회
     * work 의 제조 LOT 번호 검색을 위함
     */
    List<WorkSelectInstructionVO> workSelectInstructionList();

    /**
     * 공정 정보 조회
     * work 의 공정 정보 검색을 위함
     */
    List<WorkSelectProcessInfoVO> workSelectProcessInfoList();

    /**
     * 제조수행정보 조회
     * work 의 제조수행정보 목록
     */
    List<WorkProcessInfoVO> selectWorkProcessInfo(WorkSearchVO workSearchVO);



}
