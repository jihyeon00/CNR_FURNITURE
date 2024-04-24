package com.cnr_furniture.service.quality.inspectionOB;

import com.cnr_furniture.domain.quality.inspectionOB.CriteriaInspOBVO;
import com.cnr_furniture.domain.quality.inspectionOB.InspOBInsertVO;
import com.cnr_furniture.domain.quality.inspectionOB.InspOBListVO;
import com.cnr_furniture.domain.quality.inspectionOB.InspOBUpdateVO;
import com.cnr_furniture.mapper.quality.InspectionOBMapper;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Log4j
@Service
public class InspectionOBServiceImpl implements InspectionOBService {
  @Autowired
  private InspectionOBMapper inspectionOBMapper;

  /* [제품불량현황] - 검색 및 현황 조회 ====================================================================================================== */
  /**
   * Desc: 검색창 - 제조LOT번호 - 조회
   */
  @Override
  public List<InspOBListVO> getLotIDList() {
    log.info("검색창 - 제조LOT번호 목록 조회.......");
    return inspectionOBMapper.getLotIDList();
  }

  /**
   * Desc: 검색창 - 제품번호 - 조회
   */
  @Override
  public List<InspOBListVO> getProductIDList() {
    log.info("검색창 - 제품번호 목록 조회.......");
    return inspectionOBMapper.getProductIDList();
  }

  /**
   * Desc: 검색창 - 제품명 - 조회
   */
  @Override
  public List<InspOBListVO> getProductNameList() {
    log.info("검색창 - 제품명 목록 조회.......");
    return inspectionOBMapper.getProductNameList();
  }

  /**
   * Desc: 검색창 - 불량유형1 - 조회
   */
  @Override
  public List<InspOBListVO> getQsDiv1List() {
    log.info("검색창 - 불량유형1 목록 조회.......");
    return inspectionOBMapper.getQsDiv1List();
  }

  /**
   * Desc: 검색창 - 불량유형1에 따른 불량유형2 조회
   */
  @Override
  public List<InspOBListVO> getQsDiv2ListByQsDiv1(String qsDiv1) {
    log.info("검색창 - 불량유형1에 따른 불량유형2 조회.......");
    return inspectionOBMapper.getQsDiv2ListByQsDiv1(qsDiv1);
  }

  /**
   * Desc: 검색창 - 작업번호 - 조회
   */
  @Override
  public List<InspOBListVO> getWorkIDList() {
    log.info("검색창 - 작업번호 목록 조회.......");
    return inspectionOBMapper.getWorkIDList();
  }

  /**
   * Desc: 검색창 - 공정번호 - 조회
   */
  @Override
  public List<InspOBListVO> getProcessIDList() {
    log.info("검색창 - 공정번호 목록 조회.......");
    return inspectionOBMapper.getProcessIDList();
  }

  /**
   * Desc: 출하검사현황 목록 조회(with 검색)
   */
  @Override
  public List<InspOBListVO> getInspOBList(CriteriaInspOBVO cri) {
    log.info("getInspectionOBList..............");
    return inspectionOBMapper.getInspOBList(cri);
  }

  /* [출하불량현황] - [등록] 모달창 ====================================================================================================== */
  /**
   * Desc: 등록 모달창 - [불량유형1] option 조회
   */
  @Override
  public List<InspOBInsertVO> getQsDiv1ForInsertModal() {
    log.info("등록 모달창 - [불량유형1] option 조회......");
    return inspectionOBMapper.getQsDiv1ForInsertModal();
  }

  /**
   * Desc: 등록 모달창 - [불량유형1]에 따른 [불량유형2] 조회
   */
  @Override
  public List<InspOBInsertVO> getQsDiv2ListByQsDiv1ForInsertModal(String qsDiv1) {
    log.info("등록 모달창 - [불량유형1]에 따른 [불량유형2] 조회......");
    return inspectionOBMapper.getQsDiv2ListByQsDiv1ForInsertModal(qsDiv1);
  }

  /**
   * Desc: 등록 모달창 - [작업번호] option 조회
   */
  @Override
  public List<InspOBInsertVO> getWorkIDListForInsertModal() {
    log.info("등록 모달창 - [작업번호] option 조회......");
    return inspectionOBMapper.getWorkIDListForInsertModal();
  }

  /**
   * Desc: 등록 모달창 - [작업번호]에 따른 [제조LOT번호], [공정번호], [제품번호], [제품명], [제품규격], [단위], [일일총작업수량]을 input에 담음(조회)
   */
  @Override
  public InspOBInsertVO getWorkDetailsByWorkID(Long workID) {
    log.info("등록 모달창 - 등록 모달창 - [작업번호]에 따른 [제조LOT번호], [공정번호], [제품번호], [제품명], [제품규격], [단위], [일일총작업수량]을 input에 담음");
    return inspectionOBMapper.getWorkDetailsByWorkID(workID);
  }

  /**
   * Desc: 제품불량 등록 시, DB 저장 - [품질검사 테이블], [작업 테이블], [재고 테이블]
   * @return: inspectionOB.js 코드에 '/inspectionOB'로 리다이렉트하는 코드가 있음.
   * [작업(Work) 테이블], [재고(Inventory) 테이블]의 업데이트는 같은 작업번호 OR 제품번호에 대해서는 단 한 번만 업데이트 수행
   */
  @Override
  @Transactional
  public void registerInspectionItems(List<InspOBInsertVO> items) {
    Map<String, Boolean> updateWork = new HashMap<>();      // 업데이트된 [작업번호]를 저장하기 위한 Map(작업 테이블용)
    Map<String, Boolean> updateInventory = new HashMap<>(); // 업데이트된 [작업번호]와 [제품번호] 조합을 저장하기 위한 Map(재고 테이블용)

    for(InspOBInsertVO item: items) {
      // [품질검사 테이블]에 데이터 저장
      inspectionOBMapper.insertQualityInspection(item);

      // 고유한 키 생성(작업번호/작업번호+제품번호)
      String workKey = item.getWorkID() + "번";
      String inventoryKey = item.getWorkID() + "-" + item.getProductID();

      // [작업 테이블] 업데이트: 이미 업데이트된 조합인지 확인하고, 아니라면 업데이트 수행
      if(!updateWork.containsKey(workKey)) {
        // [작업 테이블] 업데이트
        inspectionOBMapper.updateWork(item);
        updateWork.put(workKey, true);            // 업데이트된 조합을 Map에 추가
      }

      // [재고 테이블] 업데이트: 이미 업데이트된 조합인지 확인하고, 아니라면 업데이트 수행
      if(!updateInventory.containsKey(inventoryKey)) {
        // [재고 테이블] 업데이트 또는 삽입
        inspectionOBMapper.insertOrUpdateInventory(item);
        updateInventory.put(inventoryKey, true);  // 업데이트된 조합을 Map에 추가
      }
    }
  }

  /* [출하불량현황] - [수정] 모달창 ====================================================================================================== */
  /**
   * Desc: 수정 모달창 - [불량유형1] option 조회
   */
  @Override
  public List<InspOBUpdateVO> getQsDiv1ListForUpdateModal() {
    return inspectionOBMapper.getQsDiv1ListForUpdateModal();
  }

  /**
   * Desc: 수정 모달창 - [불량유형1]에 따른 [불량유형2] 조회
   */
  @Override
  public List<InspOBUpdateVO> getQsDiv2ListByQsDiv1ForUpdateModal(String qsDiv1) {
    return inspectionOBMapper.getQsDiv2ListByQsDiv1ForUpdateModal(qsDiv1);
  }

  /**
   * Desc: 수정 모달창 - 특정 수입검사 항목을 가져오는 메소드
   */
  @Override
  public InspOBUpdateVO getInspOBDetailsBySeq(Long qiID) {
    log.info("qiID: " + qiID);
    log.info("출하검사관리 수정 모달창 조회....");
    return inspectionOBMapper.getInspOBDetailsBySeq(qiID);
  }

  /**
   * Desc: 수정 모달창 - 수입검사 항목을 UPDATE 하는 메소드
   */
  @Override
  public void updateInspOB(InspOBUpdateVO updateVO) {
    log.info("출하검사관리 수정....");
    inspectionOBMapper.updateInspOB(updateVO);
  }
}
