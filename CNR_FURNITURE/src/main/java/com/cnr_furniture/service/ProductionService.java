package com.cnr_furniture.service;

import com.cnr_furniture.domain.production.search.*;
import com.cnr_furniture.domain.work.search.*;

import java.util.List;

public interface ProductionService {
    /* [검색을 위한 정보] ============================================================== */
    /** 거래처 정보 조회 */
    List<ProductionSelectCompanyVO> findCompanyList();

    /** 제품 정보 조회 */
    List<ProductionSelectItemVO> findItemList();

    /** 제조 LOT 번호 및 제품 정보 조회 */
    List<ProductionSelectInstructionVO> findInstructionList();

    /** 공정 정보 조회 */
    List<ProductionSelectProcessInfoVO> findProcessInfoList();

    /** 설비 정보 조회 */
    List<ProductionSelectMachineInfoVO> findMachineInfoList();

    /** 작업 진행 상태 selectBox */


    /** 가동여부 selectBox */

}
