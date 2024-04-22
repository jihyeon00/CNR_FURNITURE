package com.cnr_furniture.service;

import com.cnr_furniture.domain.work.search.*;
import com.cnr_furniture.domain.work.todayWorkInsert.TodayWorkVO;
import com.cnr_furniture.domain.work.todayWorkInsert.WorkProcessMachineVO;
import com.cnr_furniture.domain.work.workMNG.*;
import com.cnr_furniture.domain.work.workerInsert.*;

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

    /** 설비 정보 조회 */
    List<WorkSelectMachineInfoVO> findMachineInfoList();

    /** 작업 조회 */
    List<WorkSelectWorkVO> findWorkList();

    /** 생산팀 부서명 조회 */
    List<WorkVO> findDpNameList();

    /** 사원정보 조회 */
    List<WorkSelectEmpInfoVO> findEmpInfoList();

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

    /* [work.jsp 의 작업등록 모달창] ============================================================== */
    /**  Desc: work 의 작업등록 모달창 중 [로트번호] 입력에 따른 [공정번호]  */
    List<WorkInsertModalVO> getProIdByLotId(int workInsertModalLotId);

    /** Desc: work 의 작업등록 모달창의 [로트번호] 입력에 따른 [제품번호],[제품명],[생산단위] 조회 */
    WorkInsertModalVO getAutoDataByLotId(int workInsertModalLotId);

    /** Desc: work 의 작업등록 모달창의 [공정번호] 선택에 따른 [공정명], [설비번호], [설비명], [작업위치] 조회 */
    WorkInsertModalVO getAutoDataByProId(int workInsertModalProcessId);


    /* [work.jsp 의 작업상세 및 수정, 삭제 모달창] ============================================================== */





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

    /* [work.jsp 의 자재투입내역 수정 모달창] ============================================================== */

    /**
     * Desc: Work 의 조건에 따른 수정할 자재투입내역 데이터를 가져오는 메소드
     */
    WorkSelectInsertMaterialVO getInsertMaterialForUpdate(int inv_lot_id,
                                                          int inv_pi_id,
                                                          int inv_material_id,
                                                          int inv_quantity);

    /**
     * Desc: Work 의 자재투입내역 - 모달창을 이용한 자재투입 수정
     */
    void updateWorkInsertMaterial(WorkUpdateMaterialModalVO workUpdateMaterialModalVO);

    /* [todayWorkInsert.jsp] ============================================================== */
    /** Desc: todayWorkInsert 의 공정조회 */
    List<WorkProcessMachineVO> getWorkProcessMachine(WorkSearchVO workSearchVO);

    /** Desc: todayWorkInsert의 당일작업목록 조회 */
    List<TodayWorkVO> getTodayWork(WorkSearchVO workSearchVO);

    /* [workerInsert.jsp] ============================================================== */
    /** Desc: workerInsert 의 작업자 배치 조회 */
    List<WorkSelectWorkerVO> getWorkerInsert(WorkSearchVO workSearchVO);

    /* [workerInsert.jsp 의 작업자 관리 모달창] ============================================================== */
    /** Desc: workInsert 의 작업자 관리 모달창의 작업자 관리를 위한 데이터 조회 */
    WorkerInsertModalVO getWorkerInsertDataForInsert(int w_id);

    /** Desc: workInsert 의 작업자 관리 모달창의 부서명에 따른 사원번호 조회 */
    List<WorkerInsertModalSelectEmpInfoByDpNameVO> getWorkerInsertModalEmpInfoList(String edit_dp_name);

    /** Desc: workInsert 의 작업자 관리 모달창의 작업자 정보 조회 */
    List<WorkerInsertModalSelectWorkerInfoByWorkIdVO> getWorkerInsertModalWorkerInfoList(int edit_w_id);

    /** Desc: workInsert 의 작업자 관리 모달창의 작업자 등록 시, DB 저장 - [worker 테이블] */
    void workerInsert(List<WorkerInsertModalWorkerInsertVO> arr);

    /** Desc: workInsert 의 작업자 관리 모달창 중 작업자 삭제 */
    void workerInsertModalDeleteWorker(int emp_id, int work_id);
}
