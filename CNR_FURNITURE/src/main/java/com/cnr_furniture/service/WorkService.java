package com.cnr_furniture.service;

import com.cnr_furniture.domain.work.search.*;
import com.cnr_furniture.domain.work.workMNG.WorkProcessInfoVO;
import com.cnr_furniture.domain.work.workMNG.WorkSelectInsertMaterialVO;
import com.cnr_furniture.domain.work.workMNG.WorkVO;
import com.cnr_furniture.domain.work.workMNG.WorkerVO;

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

    /** work의 제조수행정보 목록 조회 */
    List<WorkProcessInfoVO> selectWorkProcessInfo(WorkSearchVO workSearchVO);

    /** work의 작업목록 조회 */
    List<WorkVO> selectWork(WorkSearchVO workSearchVO);

    /** work의 생산실적 조회 */
    List<WorkVO> selectWorkProductionPerformance(WorkSearchVO workSearchVO);

    /** work의 자재투입내역 조회 */
    List<WorkSelectInsertMaterialVO> selectWorkInsertMaterial(WorkSearchVO workSearchVO);

    /** work의 자재투입내역 조회 */
    List<WorkerVO> selectWorker(WorkSearchVO workSearchVO);

}
