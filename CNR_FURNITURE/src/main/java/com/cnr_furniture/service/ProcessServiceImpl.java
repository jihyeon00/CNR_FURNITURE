package com.cnr_furniture.service;
import com.cnr_furniture.domain.process.*;
import com.cnr_furniture.mapper.ProcessMapper;
import lombok.Builder;
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

    /**
     * Desc: 제조지시
     */

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



    /**
     * Desc: 제조수행지시
     */

    /** 제조수행 지시 등록: 제조 lot 번호 조회 **/
    @Override
    public List<ProcessVO> selectLotIdsByItemAndProcessId() {
        return processMapper.selectLotIdsByItemAndProcessId();
    }

    /** 제조수행 지시 등록: 제조 lot 번호 조회에 따른 제품 조회 **/
    @Override
    public List<ProcessVO> selectItemsByLotId(int ins_lot_id) {
        List<ProcessVO> processVOList = processMapper.selectItemsByLotId(ins_lot_id);
        return processVOList;

    }

    /** 제조수행 지시 등록: 제조 lot 번호와 제품 조회 결과에 부합한 공정 위치 리스트 조회 **/
    @Override
    public List<ProcessVO> selectProcessIdsByItemAndLotId(int ins_lot_id, int ins_item_id) {
      List<ProcessVO> processVOList = processMapper.selectProcessIdsByItemAndLotId(ins_lot_id, ins_item_id);
      return processVOList;

    }

    /** 제조수행지시 등록 **/
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

    /** 제조수행지시 검색: 제조 로트번호 입력창 **/
    @Override
    public List<ProcessRunVO> selectProcessRun( ProcessDate processDate) {
        return processMapper.selectProcessRun(processDate);
    }

    /** 제조수행지시 검색: 제조수행지시 목록 조회 및, 제조 로트번호, 공정번호, 날짜에 따른 결과 검색**/
    @Override
    public List<ProcessRunVO> selectProcessRun1(ProcessDate processDate ) {
        return processMapper.selectProcessRun1(processDate);
    }

    /** 제조수행지시 검색: 제조 공정번호 입력창 **/
    @Override
    public List<ProcessRunVO> selectProcessRun2(ProcessDate processDate) {
        return processMapper.selectProcessRun2(processDate);
    }




    /**
     * Desc: 공정정보관리
     */

    /** 공정정보관리: 설비 조회 **/
    @Builder
    public List<ManagementVO> selectM(){
        return processMapper.selectM();
    }

    /** 공정정보등록창: 설비 목록 조회(설비 id 검색 조회) **/
    @Override
    public List<ManagementVO> selectByMiId(int miId) {
        return processMapper.selectByMiId(miId);
    }

    /** 공정정보등록창: 공정정보 등록 **/
    @Override
    public int insertAddProcess(
            int pi_id,
            int pi_machine_id,
            String pi_name,
            String pi_seq
    ) {
        ProcessInfoVO processInfoVO = new ProcessInfoVO();
        processInfoVO.setPi_id(pi_id);
        processInfoVO.setPi_name(pi_name);
        processInfoVO.setPi_machine_id(pi_machine_id);
        processInfoVO.setPi_seq(pi_seq);

        int rtn = processMapper.insertAddProcess(processInfoVO);
        return rtn;
    }

    /** 공정정보등록창: 공정정보 목록 조회**/
    @Override
    public List<ProcessInfoVO> selectByList(ProcessDate processDate){
        return processMapper.selectByList(processDate);
    }

    @Override
    public List<ProcessInfoVO> selectByListSearch(){
        return processMapper.selectByListSearch();
    }

}


