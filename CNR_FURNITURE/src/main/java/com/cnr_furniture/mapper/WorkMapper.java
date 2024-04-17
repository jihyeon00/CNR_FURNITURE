package com.cnr_furniture.mapper;

import com.cnr_furniture.domain.work.search.*;
import com.cnr_furniture.domain.work.todayWorkInsert.TodayWorkVO;
import com.cnr_furniture.domain.work.todayWorkInsert.WorkProcessMachineVO;
import com.cnr_furniture.domain.work.workMNG.WorkProcessInfoVO;
import com.cnr_furniture.domain.work.workMNG.WorkSelectInsertMaterialVO;
import com.cnr_furniture.domain.work.workMNG.WorkVO;
import com.cnr_furniture.domain.work.workMNG.WorkerVO;

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
     * 공정 정보 조회
     * work 의 공정 정보 검색을 위함
     */
    List<WorkSelectInsProIdVO> workSelectInsProIdList();

    /**
     * 제조수행정보 조회
     * work 의 제조수행정보 목록
     */
    List<WorkProcessInfoVO> selectWorkProcessInfo(WorkSearchVO workSearchVO);

    /**
     * 작업목록 조회
     * work 의 작업목록
     */
    List<WorkVO> selectWork(WorkSearchVO workSearchVO);

    /**
     * 생산실적 조회
     * work 의 작업목록
     */
    List<WorkVO> selectWorkProductionPerformance(WorkSearchVO workSearchVO);

    /**
     * 자재투입내역 조회
     * work 의 자재투입내역
     */
    List<WorkSelectInsertMaterialVO> selectWorkInsertMaterial(WorkSearchVO workSearchVO);

    /**
     * 작업자 조회
     * work 의 작업자
     */
    List<WorkerVO> selectWorker(WorkSearchVO workSearchVO);

    /**
     * 공정별 설비상태 조회
     * todayWorkInsert 의 공정별 설비상태
     */
    List<WorkProcessMachineVO> selectWorkProcessMachine(WorkSearchVO workSearchVO);

    /**
     * 당일작업목록 조회
     * todayWorkInsert 의 공정별 설비상태
     */
    List<TodayWorkVO> selectTodayWork(WorkSearchVO workSearchVO);
}
