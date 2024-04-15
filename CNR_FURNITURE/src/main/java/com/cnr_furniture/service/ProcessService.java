package com.cnr_furniture.service;

import com.cnr_furniture.domain.process.*;

import java.util.List;

public interface ProcessService {
    /**
     * Desc: 제조지시
     */

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



    /**
     * Desc: 제조수행지시
     */

    /** 제조수행 지시 등록: 제조 lot 번호 조회 **/
    List<ProcessVO>selectLotIdsByItemAndProcessId();

    /** 제조수행 지시 등록: 제조 lot 번호 조회에 따른 제품 조회 **/
    List<ProcessVO> selectItemsByLotId(int ins_lot_id);

    /** 제조수행 지시 등록: 제조 lot 번호와 제품 조회 결과에 부합한 공정 위치 리스트 조회 **/
    List<ProcessVO> selectProcessIdsByItemAndLotId(int ins_lot_id, int ins_item_id);

    /** 제조수행지시 등록 **/
    int insertProcessDa(
            int p_lot_id,
            int p_pi_id,
            int p_b_item_id,
            int p_plan_quantity,
            String p_note
    );

    /** 제조수행지시 검색: 제조 로트번호 입력창 **/
    List<ProcessRunVO>selectProcessRun(ProcessDate processDate);

    /** 제조수행지시 검색: 제조수행지시 목록 조회 및, 제조 로트번호, 공정번호, 날짜에 따른 결과 검색**/
    List<ProcessRunVO> selectProcessRun1( ProcessDate processDate);

    /** 제조수행지시 검색: 제조 공정번호 입력창 **/
    List<ProcessRunVO> selectProcessRun2(ProcessDate processDate);




    /**
     * Desc: 공정정보관리
     */

    /** 공정정보관리: 설비 조회 **/
    List<ManagementVO> selectM();
    List<ManagementVO> selectByMiId(int miId);

}

