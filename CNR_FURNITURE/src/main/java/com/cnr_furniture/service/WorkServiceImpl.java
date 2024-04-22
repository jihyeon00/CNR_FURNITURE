package com.cnr_furniture.service;

import com.cnr_furniture.domain.work.search.*;
import com.cnr_furniture.domain.work.todayWorkInsert.TodayWorkVO;
import com.cnr_furniture.domain.work.todayWorkInsert.WorkProcessMachineVO;
import com.cnr_furniture.domain.work.workMNG.*;
import com.cnr_furniture.domain.work.workerInsert.*;
import com.cnr_furniture.mapper.WorkMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Log4j
@Service
public class WorkServiceImpl implements WorkService{
    @Autowired
    private WorkMapper workMapper;

    /** 거래처 조회 */
    @Override
    public List<WorkSelectCompanyVO> findCompanyList() {
        return workMapper.workSelectCompanyList();
    }

    /** 제품 조회 */
    @Override
    public List<WorkSelectItemVO> findItemList() {
        return workMapper.workSelectItemList();
    }

    /** 제조계획 조회 */
    @Override
    public List<WorkSelectInstructionVO> findInstructionList() {
        return workMapper.workSelectInstructionList();
    }

    /** 공정 정보 조회 */
    @Override
    public List<WorkSelectProcessInfoVO> findProcessInfoList() {
        return workMapper.workSelectProcessInfoList();
    }

    /** 설비 정보 조회 */
    @Override
    public List<WorkSelectMachineInfoVO> findMachineInfoList() {
        return workMapper.workSelectMachineInfoList();
    }

    /** 작업 조회 */
    @Override
    public List<WorkSelectWorkVO> findWorkList() {
        return workMapper.workSelectWorkList();
    }

    /** 부서명 조회 */
    @Override
    public List<WorkVO> findDpNameList() {
        return workMapper.workDpNameList();
    }

    /** 사원 정보 조회 */
    @Override
    public List<WorkSelectEmpInfoVO> findEmpInfoList() {
        return workMapper.workEmpInfoList();
    }

    /** Desc: work의 제조수행정보 조회 */
    @Override
    public List<WorkProcessInfoVO> getWorkProcessInfo(WorkSearchVO workSearchVO) {
        return workMapper.selectWorkProcessInfo(workSearchVO);
    }

    /** Desc: work의 작업목록 조회 */
    @Override
    public List<WorkVO> getWork(WorkSearchVO workSearchVO) {
        return workMapper.selectWork(workSearchVO);
    }

    /** Desc: work의 생산실적 조회 */
    @Override
    public List<WorkVO> getWorkProductionPerformance(WorkSearchVO workSearchVO) {
        return workMapper.selectWorkProductionPerformance(workSearchVO);
    }

    /** Desc: work의 자재투입내역 조회 */
    @Override
    public List<WorkSelectInsertMaterialVO> getWorkInsertMaterial(WorkSearchVO workSearchVO) {
        return workMapper.selectWorkInsertMaterial(workSearchVO);
    }

    /** Desc: work의 작업자 조회 */
    @Override
    public List<WorkerVO> getWorker(WorkSearchVO workSearchVO) {
        return workMapper.selectWorker(workSearchVO);
    }


    /* [work.jsp 의 자재투입 모달창] ============================================================== */
    /** Desc: work 자재투입 모달창의 [로트번호의 공정번호] 조회 */
    @Override
    public List<WorkInsertMaterialModalVO> getInsProIdModal(int insLotIdModal) {
        return workMapper.workSelectInsProIdModal(insLotIdModal);
    }

    /** Desc: work의 자재투입 모달창의 [로트번호] 입력에 따른 [제품번호],[제품명],[계획생산수량] 조회 */
    @Override
    public WorkInsertMaterialModalVO getInsLotIdAutoDataModal(int insLotIdModal) {
        return workMapper.workSelectInsLotIdAutoDataModal(insLotIdModal);
    }

    /** Desc: work 자재투입등록 모달창의 [로트번호] 입력에 따른 [자재번호] 조회 */
    @Override
    public List<WorkInsertMaterialModalVO> getMaterialIdModal(int insLotIdModal) {
        return workMapper.workSelectMaterialIdModal(insLotIdModal);
    }
    /**
     * Desc: work 의 자재투입등록 모달창의
     * [자재번호] 선택에 따른 [자재명],[제품1EA별투입수량],[최소투입수량],[단위] 조회
     */
    @Override
    public WorkInsertMaterialModalVO getMaterialIdAutoDataModal(int insLotIdModal, int materialIdModal) {
        return workMapper.workSelectMaterialIdAutoDataModal(insLotIdModal, materialIdModal);
    }

    /** Desc: 자재투입 등록 시, DB 저장 - [재고 테이블] */
    @Override
    public void workInsertMaterial(List<WorkInsertMaterialModalVO> arrays) {
        for(WorkInsertMaterialModalVO arr: arrays) {
            workMapper.workInsertMaterial(arr);
        }
    }


    /* [work.jsp 의 자재투입내역 수정 모달창] ============================================================== */

    /** Desc: Work 의 조건에 따른 수정할 자재투입내역 데이터를 가져오는 메소드 */
    @Override
    public WorkSelectInsertMaterialVO getInsertMaterialForUpdate(int inv_lot_id,
                                                                 int inv_pi_id,
                                                                 int inv_material_id,
                                                                 int inv_quantity) {
        Map<String, Object> paramInsertMaterialForUpdate = new HashMap<>();
        paramInsertMaterialForUpdate.put("inv_lot_id", inv_lot_id);
        paramInsertMaterialForUpdate.put("inv_pi_id", inv_pi_id);
        paramInsertMaterialForUpdate.put("inv_material_id", inv_material_id);
        paramInsertMaterialForUpdate.put("inv_quantity", inv_quantity);
        return  workMapper.workSelectInsertMaterialForUpdate(paramInsertMaterialForUpdate);
    }

    /** Desc: Work 의 자재투입내역 - 모달창을 이용한 자재투입 수정 */
    @Override
    public void updateWorkInsertMaterial(WorkUpdateMaterialModalVO workUpdateMaterialModalVO) {
        workMapper.workInsertMaterialUpdate(workUpdateMaterialModalVO);
    }

    /* [work.jsp 의 작업등록 모달창] ============================================================== */

    /**  Desc: work 의 작업등록 모달창 중 [로트번호] 입력에 따른 [공정번호] */
    @Override
    public List<WorkInsertModalVO> getProIdByLotId(int workInsertModalLotId) {
        return workMapper.workInsertModalSelectProIdByLotId(workInsertModalLotId);
    }

    /** Desc: work 의 작업등록 모달창의 [로트번호] 입력에 따른 [제품번호],[제품명],[생산단위] 조회 */
    @Override
    public WorkInsertModalVO getAutoDataByLotId(int workInsertModalLotId) {
        return workMapper.workInsertModalSelectAutoDataByLotId(workInsertModalLotId);
    }

    /** Desc: work 의 작업등록 모달창의 [공정번호] 선택에 따른 [공정명], [설비번호], [설비명], [작업위치], [남은생산수량] 조회 */
    @Override
    public WorkInsertModalVO getAutoDataByProId(int workInsertModalLotId, int workInsertModalProcessId) {
        return workMapper.workInsertModalSelectAutoDataByProId(workInsertModalLotId, workInsertModalProcessId);
    }

    /** Desc: Work 의 작업 등록 시, DB 저장 - [작업 테이블] */
    @Override
    public void workInsert(List<WorkInsertModalVO> arrays) {
        for(WorkInsertModalVO arr: arrays) {
            workMapper.workInsert(arr);
        }
    }

    /* [work.jsp 의 작업상세 및 수정, 삭제 모달창] ============================================================== */

    /* [todayWorkInsert.jsp] ============================================================== */

    /** Desc: todayWorkInsert의 공정별 설비상태 조회 */
    @Override
    public List<WorkProcessMachineVO> getWorkProcessMachine(WorkSearchVO workSearchVO) {
        return workMapper.selectWorkProcessMachine(workSearchVO);
    }

    /** Desc: todayWorkInsert의 당일작업목록 조회 */
    @Override
    public List<TodayWorkVO> getTodayWork(WorkSearchVO workSearchVO) {
        return workMapper.selectTodayWork(workSearchVO);
    }

    /* [workerInsert.jsp] ============================================================== */

    /** Desc: workerInsert 의 작업자 배치 조회 */
    @Override
    public List<WorkSelectWorkerVO> getWorkerInsert(WorkSearchVO workSearchVO) {
        return workMapper.selectWorkerInsertList(workSearchVO);
    }

    /* [workerInsert.jsp 의 작업자관리 모달창] ============================================================== */

    /** Desc: workerInsert 의 작업자 관리 모달창의 작업자 관리를 위한 데이터 조회 */
    @Override
    public WorkerInsertModalVO getWorkerInsertDataForInsert(int w_id) {
        return workMapper.workSelectWorkerInsertDataForInsert(w_id);
    }

    /** Desc: workInsert 의 작업자 관리 모달창의 부서명에 따른 사원번호 조회 */
    @Override
    public List<WorkerInsertModalSelectEmpInfoByDpNameVO> getWorkerInsertModalEmpInfoList(String edit_dp_name) {
        return workMapper.workSelectWorkerInsertModalEmpInfoList(edit_dp_name);
    }

    /** Desc: workInsert 의 작업자 관리 모달창의 작업자 정보 조회 */
    @Override
    public List<WorkerInsertModalSelectWorkerInfoByWorkIdVO> getWorkerInsertModalWorkerInfoList(int edit_w_id) {
        return workMapper.workSelectWorkerInsertModalWorkerInfoList(edit_w_id);
    }

    /** Desc: workInsert 의 작업자 관리 모달창의 작업자 등록 시, DB 저장 - [worker 테이블] */
    @Override
    public void workerInsert(List<WorkerInsertModalWorkerInsertVO> arrays) {
        for(WorkerInsertModalWorkerInsertVO arr: arrays) {
            workMapper.workerInsert(arr);
        }
    }

    /** Desc: workInsert 의 작업자 관리 모달창 중 작업자 삭제 */
    @Override
    public void workerInsertModalDeleteWorker(int emp_id, int work_id) {
        workMapper.workerInsertModalDeleteWorker(emp_id, work_id);
    }
}
