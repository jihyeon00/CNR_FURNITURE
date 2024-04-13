package com.cnr_furniture.service;

import com.cnr_furniture.domain.process.*;

import java.util.List;

public interface ProcessService {
    /** 검색 메소드 **/
    List<ProcessVO> selectProcess(ProcessDate processDate);

    /** 아이템 정보 조회 메소드 추가 **/
    List<ProcessItemVO> findAllItems();

    /** 공정정보 목록**/
    List<ProcessInfoVO> findAllPi();

    /** 계약정보 목록 **/
    List<ProcessCtVO> findAllProCt(ProcessDate processDate);

    /** 제조지시 등록 **/
    int insertProInstruction(
             int ins_lot_id,
             int ins_item_id,
             int ins_emp_id,
             int ins_ct_id,
             int ins_pi_id,
             int ins_lot_size,
             String ins_start_date,
             String ins_end_date
    );


    List<ProcessVO>selectLotIdsByItemAndProcessId();
    List<ProcessVO> selectItemsByLotId(int ins_lot_id);
    List<ProcessVO> selectProcessIdsByItemAndLotId(int ins_lot_id, int ins_item_id);
    int insertProcessDa(
            int p_lot_id,
            int p_pi_id,
            int p_b_item_id,
            int p_plan_quantity,
            String p_note
    );

    List<ProcessRunVO>selectProcessRun(ProcessDate processDate);

    List<ProcessRunVO> selectProcessRun1();
}

