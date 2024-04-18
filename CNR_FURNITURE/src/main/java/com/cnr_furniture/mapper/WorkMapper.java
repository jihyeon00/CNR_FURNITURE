package com.cnr_furniture.mapper;

import com.cnr_furniture.domain.work.search.*;
import com.cnr_furniture.domain.work.todayWorkInsert.TodayWorkVO;
import com.cnr_furniture.domain.work.todayWorkInsert.WorkProcessMachineVO;
import com.cnr_furniture.domain.work.workMNG.*;

import java.util.List;

public interface WorkMapper {
    /* [검색을 위한 정보] ============================================================== */
    /**
     * 거래처 정보 조회
     * Desc: work 의 거래처 정보 검색을 위함
     */
    List<WorkSelectCompanyVO> workSelectCompanyList();

    /**
     * 제품 정보 조회
     * Desc: work 의 제품 정보 검색을 위함
     */
    List<WorkSelectItemVO> workSelectItemList();

    /**
     * 제조 LOT 번호 및 제품 정보 조회
     * Desc: work 의 제조 LOT 번호 검색을 위함
     */
    List<WorkSelectInstructionVO> workSelectInstructionList();

    /**
     * 공정 정보 조회
     * Desc: work 의 공정 정보 검색을 위함
     */
    List<WorkSelectProcessInfoVO> workSelectProcessInfoList();


    /* [work.jsp] ============================================================== */
    /**
     * 제조수행정보 조회
     * Desc: work 의 제조수행정보 목록
     */
    List<WorkProcessInfoVO> selectWorkProcessInfo(WorkSearchVO workSearchVO);

    /**
     * 작업목록 조회
     * Desc: work 의 작업목록
     */
    List<WorkVO> selectWork(WorkSearchVO workSearchVO);

    /**
     * 생산실적 조회
     * Desc: work 의 생산실적
     */
    List<WorkVO> selectWorkProductionPerformance(WorkSearchVO workSearchVO);

    /**
     * 자재투입내역 조회
     * Desc: work 의 자재투입내역
     */
    List<WorkSelectInsertMaterialVO> selectWorkInsertMaterial(WorkSearchVO workSearchVO);

    /**
     * 작업자 조회
     * Desc: work 의 작업자
     */
    List<WorkerVO> selectWorker(WorkSearchVO workSearchVO);

    /* [work.jsp 의 자재투입 모달창] ============================================================== */
    /**
     * 로트번호 입력에 따른 공정번호 조회
     * Desc: work 의 자재투입 모달창 중 [로트번호] 입력에 따른 [공정번호]
     */
    List<WorkInsertMaterialModalVO> workSelectInsProIdModal(int insLotIdModal);

    /**
     * 로트번호 입력에 따른 제품번호, 제품명, 계획생산수량 조회
     * Desc: work 의 자재투입등록 모달창의 [로트번호] 입력에 따른 [제품번호],[제품명],[계획생산수량] 조회
     */
    WorkInsertMaterialModalVO workSelectInsLotIdAutoDataModal(int insLotIdModal);

    /**
     * 로트번호 입력에 따른 [자재번호] 조회
     * Desc: work 의 자재투입등록 모달창의 [자재번호] 선택에 따른 [자재명],[제품1EA별 투입수량],[최소투입수량],[단위] 조회
     */
    List<WorkInsertMaterialModalVO> workSelectMaterialIdModal(int insLotIdModal);

    /**
     * 로트번호,자재번호 입력에 따른 자재명, 제품1EA별투입수량, 최소투입수량, 단위 조회
     * Desc: work 의 자재투입등록 모달창의 [자재번호] 선택에 따른 [자재명],[제품1EA별투입수량],[최소투입수량],[단위] 조회
     */
    WorkInsertMaterialModalVO workSelectMaterialIdAutoDataModal(int insLotIdModal, int materialIdModal);

    /**
     * 자재투입등록
     * Desc: Work 의 모달창을 이용한 자재투입등록
     */
     void workInsertMaterial(WorkInsertMaterialModalVO workInsertMaterialModalVO);


    /* [todayWorkInsert.jsp] ============================================================== */
    /**
     * 공정별 설비상태 조회
     * Desc: todayWorkInsert 의 공정별 설비상태
     */
    List<WorkProcessMachineVO> selectWorkProcessMachine(WorkSearchVO workSearchVO);

    /**
     * 당일작업목록 조회
     * Desc: todayWorkInsert 의 당일작업목록
     */
    List<TodayWorkVO> selectTodayWork(WorkSearchVO workSearchVO);


}
