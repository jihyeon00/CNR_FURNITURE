package com.cnr_furniture.service;

import com.cnr_furniture.domain.process.*;
import com.cnr_furniture.domain.quality.InspectionIBListVO;
import com.cnr_furniture.mapper.ProcessMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;

@Log4j
@Service
public class ProcessServiceImpl implements ProcessService{
    @Autowired
    private ProcessMapper processMapper;

    /** 제조시지조회 **/
    @Override
    public List<ProcessVO> selectProcess(ProcessDate processDate) {
        return processMapper.selectProcess(processDate);
    }

    /** 제품 조회 **/
    @Override
    public List<ProcessItemVO> findAllItems() {
        return processMapper.selectAllItems();
    }

    /** 공정 조회 **/
    @Override
    public List<ProcessInfoVO> findAllPi(){
        return processMapper.selectPi();
    }

    /** 계약 조회 **/
    @Override
    public List<ProcessCtVO> findAllProCt(ProcessDate processDate) {
        return processMapper.selectProCt(processDate);
    }

    /** 제조지시 등록 **/
    @Override
    public int insertProInstruction(
            int ins_lot_id,
            int ins_item_id,
            int ins_emp_id,
            int ins_ct_id,
            int ins_pi_id,
            int ins_lot_size,
            String ins_start_date,
            String ins_end_date
    ) {
        ProcessVO processVO = new ProcessVO();
        processVO.setIns_lot_id(ins_lot_id);
        processVO.setIns_item_id(ins_item_id);
        processVO.setIns_emp_id(ins_emp_id);
        processVO.setIns_ct_id(ins_ct_id);
        processVO.setIns_pi_id(ins_pi_id);
        processVO.setIns_lot_size(ins_lot_size);
        processVO.setIns_start_date(ins_start_date);
        processVO.setIns_end_date(ins_end_date);

        int rtn = processMapper.insertProInstruction(processVO);
        return rtn;
    }


    @Override
    public List<ProcessVO> selectLotIdsByItemAndProcessId() {
        return processMapper.selectLotIdsByItemAndProcessId();
    }

    @Override
    public List<ProcessVO> selectItemsByLotId(int ins_lot_id) {
        List<ProcessVO> processVOList = processMapper.selectItemsByLotId(ins_lot_id);
        return processVOList;

    }

    @Override
    public List<ProcessVO> selectProcessIdsByItemAndLotId(int ins_lot_id, int ins_item_id) {
      List<ProcessVO> processVOList = processMapper.selectProcessIdsByItemAndLotId(ins_lot_id, ins_item_id);
      return processVOList;

    }

    @Override
    public int insertProcessDa(
            int p_lot_id,
            int p_pi_id,
            int p_b_item_id,
            int p_plan_quantity,
            String p_note
    ) {
        ProcessRunVO processRunVO = new ProcessRunVO();
        processRunVO.setP_lot_id(p_lot_id);
        processRunVO.setP_pi_id(p_pi_id);
        processRunVO.setP_b_item_id(p_b_item_id);
        processRunVO.setP_plan_quantity(p_plan_quantity);
        processRunVO.setP_note(p_note);


        int rtn = processMapper.insertProcessDa(processRunVO);
        return rtn;
    }

    @Override
    public List<ProcessRunVO> selectProcessRun(ProcessDate processDate) {
        return processMapper.selectProcessRun(processDate);
    }

    @Override
    public List<ProcessRunVO> selectProcessRun1() {
        return processMapper.selectProcessRun1();
    }
}


