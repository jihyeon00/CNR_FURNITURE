package com.cnr_furniture.service;

import com.cnr_furniture.domain.quality.inspectionIB.InspIBInsertVO;
import com.cnr_furniture.domain.work.search.*;
import com.cnr_furniture.domain.work.todayWorkInsert.TodayWorkVO;
import com.cnr_furniture.domain.work.todayWorkInsert.WorkProcessMachineVO;
import com.cnr_furniture.domain.work.workMNG.*;
import com.cnr_furniture.mapper.WorkMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;

import java.util.List;

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

    /** 제조수행 조회 */
    @Override
    public List<WorkSelectProcessInfoVO> findProcessInfoList() {
        return workMapper.workSelectProcessInfoList();
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

    /**
     * Desc: 자재투입 등록 시, DB 저장 - [재고 테이블]
     * @param
     */
    @Override
    public void workInsertMaterial(List<WorkInsertMaterialModalVO> arrays) {
        for(WorkInsertMaterialModalVO arr: arrays) {
            workMapper.workInsertMaterial(arr);
        }
    }


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
}
