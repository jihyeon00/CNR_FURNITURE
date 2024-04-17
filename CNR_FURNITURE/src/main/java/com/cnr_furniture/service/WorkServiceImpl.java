package com.cnr_furniture.service;

import com.cnr_furniture.domain.work.search.*;
import com.cnr_furniture.domain.work.todayWorkInsert.TodayWorkVO;
import com.cnr_furniture.domain.work.todayWorkInsert.WorkProcessMachineVO;
import com.cnr_furniture.domain.work.workMNG.WorkProcessInfoVO;
import com.cnr_furniture.domain.work.workMNG.WorkSelectInsertMaterialVO;
import com.cnr_furniture.domain.work.workMNG.WorkVO;
import com.cnr_furniture.domain.work.workMNG.WorkerVO;
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

    /** work의 제조수행정보 조회 */
    @Override
    public List<WorkProcessInfoVO> selectWorkProcessInfo(WorkSearchVO workSearchVO) {
        return workMapper.selectWorkProcessInfo(workSearchVO);
    }

    /** work의 작업목록 조회 */
    @Override
    public List<WorkVO> selectWork(WorkSearchVO workSearchVO) {
        return workMapper.selectWork(workSearchVO);
    }

    /** work의 생산실적 조회 */
    @Override
    public List<WorkVO> selectWorkProductionPerformance(WorkSearchVO workSearchVO) {
        return workMapper.selectWorkProductionPerformance(workSearchVO);
    }

    /** work의 자재투입내역 조회 */
    @Override
    public List<WorkSelectInsertMaterialVO> selectWorkInsertMaterial(WorkSearchVO workSearchVO) {
        return workMapper.selectWorkInsertMaterial(workSearchVO);
    }

    /** work의 작업자 조회 */
    @Override
    public List<WorkerVO> selectWorker(WorkSearchVO workSearchVO) {
        return workMapper.selectWorker(workSearchVO);
    }

    /** todayWorkInsert의 공정별 설비상태 조회 */
    @Override
    public List<WorkProcessMachineVO> selectWorkProcessMachine(WorkSearchVO workSearchVO) {
        return workMapper.selectWorkProcessMachine(workSearchVO);
    }

    /** todayWorkInsert의 당일작업목록 조회 */
    @Override
    public List<TodayWorkVO> selectTodayWork(WorkSearchVO workSearchVO) {
        return workMapper.selectTodayWork(workSearchVO);
    }
}
