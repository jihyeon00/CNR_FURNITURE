package com.cnr_furniture.service.quality.inspectionOB;

import com.cnr_furniture.domain.quality.inspectionOB.CriteriaInspOBVO;
import com.cnr_furniture.domain.quality.inspectionOB.InspOBInsertVO;
import com.cnr_furniture.domain.quality.inspectionOB.InspOBListVO;
import com.cnr_furniture.domain.quality.inspectionOB.InspOBUpdateVO;
import com.cnr_furniture.domain.quality.inspectionProcess.CriteriaInspProcessVO;

import java.util.List;

public interface InspectionOBService {
  /* [제품불량현황] - 검색 및 현황 조회 ====================================================================================================== */
  /**
   * Desc: 검색창 - 제조LOT번호 - 조회
   */
  List<InspOBListVO> getLotIDList();

  /**
   * Desc: 검색창 - 제품번호 - 조회
   */
  List<InspOBListVO> getProductIDList();

  /**
   * Desc: 검색창 - 제품명 - 조회
   */
  List<InspOBListVO> getProductNameList();

  /**
   * Desc: 검색창 - 불량유형1 - 조회
   */
  List<InspOBListVO> getQsDiv1List();

  /**
   * Desc: 검색창 - 불량유형1에 따른 불량유형2 조회
   */
  List<InspOBListVO> getQsDiv2ListByQsDiv1(String qsDiv1);

  /**
   * Desc: 검색창 - 작업번호 - 조회
   */
  List<InspOBListVO> getWorkIDList();

  /**
   * Desc: 검색창 - 공정번호 - 조회
   */
  List<InspOBListVO> getProcessIDList();

  /**
   * Desc: 출하검사현황 목록 조회(with 검색)
   */
  List<InspOBListVO> getInspOBList(CriteriaInspOBVO cri);

  /* [출하불량현황] - [등록] 모달창 ====================================================================================================== */
  /**
   * Desc: 등록 모달창 - [불량유형1] option 조회
   */
  List<InspOBInsertVO> getQsDiv1ForInsertModal();

  /**
   * Desc: 등록 모달창 - [불량유형1]에 따른 [불량유형2] 조회
   */
  List<InspOBInsertVO> getQsDiv2ListByQsDiv1ForInsertModal(String qsDiv1);

  /**
   * Desc: 등록 모달창 - [작업번호] option 조회
   */
  List<InspOBInsertVO> getWorkIDListForInsertModal();

  /**
   * Desc: 등록 모달창 - [작업번호]에 따른 [제조LOT번호], [공정번호], [제품번호], [제품명], [제품규격], [단위], [일일총작업수량]을 input에 담음(조회)
   */
  InspOBInsertVO getWorkDetailsByWorkID(Long workID);

  /**
   * Desc: 등록 모달창 - [제품불량등록] 데이터 UPDATE 또는 INSERT
   */
  void registerInspectionItems(List<InspOBInsertVO> items);

  /* [출하불량현황] - [수정] 모달창 ====================================================================================================== */
  /**
   * Desc: 수정 모달창 - [불량유형1] option 조회
   */
  List<InspOBUpdateVO> getQsDiv1ListForUpdateModal();

  /**
   * Desc: 수정 모달창 - [불량유형1]에 따른 [불량유형2] 조회
   */
  List<InspOBUpdateVO> getQsDiv2ListByQsDiv1ForUpdateModal(String qsDiv1);

  /**
   * Desc: 수정 모달창 - 특정 수입검사 항목을 가져오는 메소드
   */
  InspOBUpdateVO getInspOBDetailsBySeq(Long qiID);

  /**
   * Desc: 수정 모달창 - 수입검사 항목을 UPDATE 하는 메소드
   */
  void updateInspOB(InspOBUpdateVO updateVO);
}
