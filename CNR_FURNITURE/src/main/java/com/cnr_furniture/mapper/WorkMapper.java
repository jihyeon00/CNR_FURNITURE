package com.cnr_furniture.mapper;

import com.cnr_furniture.domain.work.search.*;
import com.cnr_furniture.domain.work.todayWorkInsert.TodayWorkVO;
import com.cnr_furniture.domain.work.todayWorkInsert.WorkProcessMachineVO;
import com.cnr_furniture.domain.work.workMNG.*;
import com.cnr_furniture.domain.work.workerInsert.*;

import java.util.List;
import java.util.Map;

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

    /**
     * 설비 정보 조회
     * Desc: work 의 설비 정보 검색을 위함
     */
    List<WorkSelectMachineInfoVO> workSelectMachineInfoList();

    /**
     * 작업 조회
     * Desc: work 의 작업번호 검색을 위함
     */
    List<WorkSelectWorkVO> workSelectWorkList();

    /**
     * 부서명 조회
     * Desc: 부서명 검색을 위함
     */
    List<WorkVO> workDpNameList();

    /**
     * 사원 정보 조회
     * Desc: 사원 정보 검색을 위함
     */
    List<WorkSelectEmpInfoVO> workEmpInfoList();

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

    /* [work.jsp 의 자재투입내역 수정 모달창] ============================================================== */

    /**
     * 조건에 따른 수정할 자재투입내역 조회
     * Desc: Work 의 자재투입내역 데이터를 가져오는 메소드
     */
    WorkSelectInsertMaterialVO workSelectInsertMaterialForUpdate(Map<String, Object> map);

    /**
     * 자재투입수정
     * Desc: Work 의 자재투입내역 - 모달창을 이용한 자재투입 수정
     */
    void workInsertMaterialUpdate(WorkUpdateMaterialModalVO workUpdateMaterialModalVO);

    /* [work.jsp 의 작업등록 모달창] ============================================================== */
    /**
     * 로트번호 입력에 따른 공정번호 조회
     * Desc: work 의 작업등록 모달창 중 [로트번호] 입력에 따른 [공정번호]
     */
    List<WorkInsertMaterialModalVO> workInsertModalSelectProIdByLotId(int insLotIdModal);

    /**
     * 로트번호 입력에 따른 제품번호, 제품명, 계획생산수량 조회
     * Desc: work 의 자재투입등록 모달창의 [로트번호] 입력에 따른 [제품번호],[제품명],[계획생산수량] 조회
     */
    // WorkInsertMaterialModalVO workSelectInsLotIdAutoDataModal(int insLotIdModal);

    /**
     * 로트번호 입력에 따른 [자재번호] 조회
     * Desc: work 의 자재투입등록 모달창의 [자재번호] 선택에 따른 [자재명],[제품1EA별 투입수량],[최소투입수량],[단위] 조회
     */
    // List<WorkInsertMaterialModalVO> workSelectMaterialIdModal(int insLotIdModal);


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

    /* [workerInsert.jsp] ============================================================== */
    /**
     * 작업자 배치 조회
     * Desc: workerInsert 의 작업자 배치
     */
    List<WorkSelectWorkerVO> selectWorkerInsertList(WorkSearchVO workSearchVO);


    /* [workerInsert.jsp 의 작업자관리 모달창] ============================================================== */

    /**
     * 작업자 관리를 위한 데이터 조회
     * Desc: workInsert 의 작업자 관리 모달창의 작업자 관리를 위한 데이터 조회
     */

    WorkerInsertModalVO workSelectWorkerInsertDataForInsert(int w_id);

    /**
     * 부서명에 따른 사원번호 조회
     * Desc: workInsert 의 작업자 관리 모달창의 부서명에 따른 사원번호 조회
     */
    List<WorkerInsertModalSelectEmpInfoByDpNameVO> workSelectWorkerInsertModalEmpInfoList(String edit_dp_name);

    /**
     * 작업번호에 따른 작업자 정보 조회
     * Desc: workInsert 의 작업자 관리 모달창의 작업자 정보 조회
     */
    List<WorkerInsertModalSelectWorkerInfoByWorkIdVO> workSelectWorkerInsertModalWorkerInfoList(int edit_w_id);

    /**
     * 작업자 등록
     * Desc: workInsert 의 작업자 관리 모달창 중 작업자 등록
     */
    void workerInsert(WorkerInsertModalWorkerInsertVO workerInsertModalWorkerInsertVO);

    /**
     * 작업자 삭제
     * Desc: workInsert 의 작업자 관리 모달창 중 작업자 삭제
     */

    void workerInsertModalDeleteWorker(int emp_id, int work_id);


}
