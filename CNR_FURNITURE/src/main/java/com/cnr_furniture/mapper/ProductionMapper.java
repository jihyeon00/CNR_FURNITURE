package com.cnr_furniture.mapper;

import com.cnr_furniture.domain.production.search.*;

import java.util.List;

public interface ProductionMapper {
    /* [검색을 위한 정보] ============================================================== */
    /**
     * 거래처 정보 조회
     * Desc: Production 의 거래처 정보 검색을 위함
     */
    List<ProductionSelectCompanyVO> productionSelectCompanyList();

    /**
     * 제품 정보 조회
     * Desc: Production 의 제품 정보 검색을 위함
     */
    List<ProductionSelectItemVO> productionSelectItemList();

    /**
     * 제조 LOT 번호 및 제품 정보 조회
     * Desc: Production 의 제조 LOT 번호 검색을 위함
     */
    List<ProductionSelectInstructionVO> productionSelectInstructionList();

    /**
     * 공정 정보 조회
     * Desc: Production 의 공정 정보 검색을 위함
     */
    List<ProductionSelectProcessInfoVO> productionSelectProcessInfoList();

    /**
     * 설비 정보 조회
     * Desc: Production 의 설비 정보 검색을 위함
     */
    List<ProductionSelectMachineInfoVO> productionSelectMachineInfoList();

    /**
     * 작업 진행 상태 조회
     * Desc: 작업 진행 상태 selectBox
     */


    /**
     * 가동여부 조회
     * Desc: 가동여부 selectBox
     */
}
