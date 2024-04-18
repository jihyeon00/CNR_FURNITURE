package com.cnr_furniture.service;

import com.cnr_furniture.domain.quality.inspectionIB.InspIBInsertVO;
import com.cnr_furniture.domain.work.search.*;
import com.cnr_furniture.domain.work.todayWorkInsert.TodayWorkVO;
import com.cnr_furniture.domain.work.todayWorkInsert.WorkProcessMachineVO;
import com.cnr_furniture.domain.work.workMNG.*;

import java.util.List;

public interface WorkService {
    /* [검색을 위한 정보] ============================================================== */
    /** 거래처 정보 조회 */
    List<WorkSelectCompanyVO> findCompanyList();

    /** 제품 정보 조회 */
    List<WorkSelectItemVO> findItemList();

    /** 제조 LOT 번호 및 제품 정보 조회 */
    List<WorkSelectInstructionVO> findInstructionList();

    /** 공정 정보 조회 */
    List<WorkSelectProcessInfoVO> findProcessInfoList();

    /* [work.jsp] ============================================================== */
    /** Desc: work의 제조수행정보 목록 조회 */
    List<WorkProcessInfoVO> getWorkProcessInfo(WorkSearchVO workSearchVO);

    /** Desc: work의 작업목록 조회 */
    List<WorkVO> getWork(WorkSearchVO workSearchVO);

    /** Desc: work의 생산실적 조회 */
    List<WorkVO> getWorkProductionPerformance(WorkSearchVO workSearchVO);

    /** Desc: work의 자재투입내역 조회 */
    List<WorkSelectInsertMaterialVO> getWorkInsertMaterial(WorkSearchVO workSearchVO);

    /** Desc: work의 작업자 조회 */
    List<WorkerVO> getWorker(WorkSearchVO workSearchVO);

    /* [work.jsp 의 자재투입 모달창] ============================================================== */
    /**
     * Desc: work 자재투입 모달창의 로트번호에 따른 공정번호 조회
     */
    List<WorkInsertMaterialModalVO> getInsProIdModal(int insLotIdModal);

    /**
     * Desc: work 자재투입등록 모달창의 [로트번호] 입력에 따른 [제품번호],[제품명],[계획생산수량] 조회
     */
    WorkInsertMaterialModalVO getInsLotIdAutoDataModal(int insLotIdModal);

    /**
     * Desc: work 자재투입등록 모달창의 [로트번호] 입력에 따른 [자재번호] 조회
     */
    List<WorkInsertMaterialModalVO> getMaterialIdModal(int insLotIdModal);

    /**
     * 로트번호,자재번호 입력에 따른 자재명, 제품1EA별투입수량, 최소투입수량, 단위 조회
     * Desc: work 의 자재투입등록 모달창의 [자재번호] 선택에 따른 [자재명],[제품1EA별투입수량],[최소투입수량],[단위] 조회
     */
    WorkInsertMaterialModalVO getMaterialIdAutoDataModal(int insLotIdModal, int materialIdModal);

    /**
     * Desc: 자재투입 등록 시, DB 저장 - [재고 테이블]
     */
    void workInsertMaterial(List<WorkInsertMaterialModalVO> arr);

    /* [todayWorkInsert.jsp] ============================================================== */
    /** Desc: todayWorkInsert 의 공정조회 */
    List<WorkProcessMachineVO> getWorkProcessMachine(WorkSearchVO workSearchVO);

    /** Desc: todayWorkInsert의 당일작업목록 조회 */
    List<TodayWorkVO> getTodayWork(WorkSearchVO workSearchVO);

}
