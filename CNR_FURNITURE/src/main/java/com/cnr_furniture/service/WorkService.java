package com.cnr_furniture.service;

import com.cnr_furniture.domain.work.*;

import java.util.List;

public interface WorkService {
    /** 거래처 정보 조회 */
    List<WorkSelectCompanyVO> findCompanyList();

    /** 제품 정보 조회 */
    List<WorkSelectItemVO> findItemList();

    /** 제조 LOT 번호 및 제품 정보 조회 */
    List<WorkSelectInstructionVO> findInstructionList();

    /** 공정 정보 조회 */
    List<WorkSelectProcessInfoVO> findProcessInfoList();

    /** 제조수행정보 목록 조회 */
    List<WorkProcessInfoVO> selectWorkProcessInfo(WorkSearchVO workSearchVO);


}
