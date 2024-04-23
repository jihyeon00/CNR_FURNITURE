package com.cnr_furniture.mapper;

import com.cnr_furniture.domain.contract.ContractVO;
import com.cnr_furniture.domain.process.*;
import com.cnr_furniture.domain.process.ManagementVO;
import org.apache.ibatis.annotations.Mapper;


import java.util.List;

@Mapper
public interface ProcessMapper {

    /**
     * Desc: 제조지시
     */

    /** 날짜 조회 **/
    List<ProcessVO> selectProcess(ProcessDate processDate);

    /** 제품 정보 조회 **/
    List<ProcessItemVO> selectAllItems();

    /** 공정 정보 조회 **/
    List<ProcessInfoVO> selectPi();

    /** 계약 정보 조회 **/
    List<ProcessCtVO> selectProCt(ProcessDate processDate);

    /** 제조지시 등록 **/
    void insertProInstruction(ProcessVO processVO);

    /** 제조지시: 계약 내역 조회 **/
    List<ContractVO> selectArrayCt(List<String> ids);



    /**
     * Desc: 제조수행지시
     */

    /** 제조수행 지시 등록: 제조 lot 번호 조회 **/
    List<ProcessVO> selectLotIdsByItemAndProcessId();

    /** 제조수행 지시 등록: 제조 lot 번호 조회에 따른 제품 조회 **/
    List<ProcessVO> selectItemsByLotId(int ins_lot_id);

    /** 제조수행 지시 등록: 제조 lot 번호와 제품 조회 결과에 부합한 공정 위치 리스트 조회 **/
    List<ProcessVO> selectProcessIdsByItemAndLotId(int ins_lot_id, int ins_item_id);

    /** 제조수행지시 등록 **/
    void insertProcessDa(ProcessRunVO processRunVO);

    /** 제조수행지시 검색: 제조 로트번호 입력창 **/
    List<ProcessRunVO>selectProcessRun(ProcessDate processDate);

    /** 제조수행지시 검색: 제조수행지시 목록 조회 및, 제조 로트번호, 공정번호, 날짜에 따른 결과 검색**/
    List<ProcessRunVO> selectProcessRun1(ProcessDate processDate);

    /** 제조수행지시 검색: 제조 공정번호 입력창 **/
    List<ProcessRunVO> selectProcessRun2(ProcessDate processDate);




    /**
     * Desc: 공정정보관리
     */

    /** 공정정보관리: 설비 조회 **/
    List<ManagementVO> selectM();


    /** 공정정보등록창: 설비 목록 조회(설비 id 검색 조회) **/
    List<ManagementVO> selectByMiId(int miId);


    /** 공정정보등록창: 공정정보 등록 **/
    int insertAddProcess(ProcessInfoVO processInfoVO);

    /** 공정정보등록창: 공정정보 목록 조회 **/
    List<ProcessInfoVO> selectByList(ProcessDate processDate);

    /** 공정정보등록창: 공정 목록 조회 **/
    List<ProcessInfoVO> selectByListSearch();



}



