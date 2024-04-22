package com.cnr_furniture.service.quality.inspectionIB;

import com.cnr_furniture.domain.quality.inspectionIB.CriteriaInspIBVO;
import com.cnr_furniture.domain.quality.inspectionIB.InspIBInsertVO;
import com.cnr_furniture.domain.quality.inspectionIB.InspIBListVO;
import com.cnr_furniture.domain.quality.inspectionIB.InspIBUpdateVO;
import com.cnr_furniture.mapper.quality.*;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

@Log4j
@Service
public class InspectionIBServiceImpl implements InspectionIBService{
    @Autowired
    private InspectionIBMapper inspectionIBMapper;

    /* [자재불량등록] - 검색 및 현황 조회 ====================================================================================================== */
    /**
     * Desc: 검색창 - 자재번호 - 조회
     */
    @Override
    public List<InspIBListVO> getMatIDList() {
        log.info("getMatIDList....");
        return inspectionIBMapper.getMatIDList();
    }

    /**
     * Desc: 검색창 - 계약번호 - 조회
     */
    @Override
    public List<InspIBListVO> getContractIDList() {
        log.info("getContractIDList....");
        return inspectionIBMapper.getContractIDList();
    }

    /**
     * Desc: 검색창 - 불량유형1 - 조회
     */
    @Override
    public List<InspIBListVO> getQsDiv1List() {
        log.info("getQsDiv1List....");
        return inspectionIBMapper.getQsDiv1List();
    }

    /**
     * Desc: 검색창 - 불량유형1에 따른 불량유형2 조회
     */
    @Override
    public List<InspIBListVO> getQsDiv2ListByQsDiv1(String qsDiv1) {
        log.info("getQsDiv2ListByQsDiv1....");
        List<InspIBListVO> inspIBListVOList = inspectionIBMapper.getQsDiv2ListByQsDiv1(qsDiv1);
        return inspIBListVOList;
    }

    /**
     * Desc: 수입검사현황 목록 조회(with 검색), 자재 IB 불량 현황 조회
     */
    @Override
    public List<InspIBListVO> getInspectionIBList(CriteriaInspIBVO cri) {
        log.info("getInspectionIBList....");
        return inspectionIBMapper.getInspectionIBList(cri);
    }

    /* [자재불량등록] - 모달창 ====================================================================================================== */
    /**
     * Desc: 모달창 - 계약번호 - 조회
     */
    @Override
    public List<InspIBInsertVO> getContractIDListForModal() {
        log.info("getContractIDList....");
        return inspectionIBMapper.getContractIDListForModal();
    }

    /**
     * Desc: 모달창 - 불량유형1 - 조회
     */
    @Override
    public List<InspIBInsertVO> getQsDiv1ListForModal() {
        log.info("getQsDiv1List....");
        return inspectionIBMapper.getQsDiv1ListForModal();
    }

    /**
     * Desc: 모달창 - 불량유형1에 따른 불량유형2 조회
     */
    @Override
    public List<InspIBInsertVO> getQsDiv2ListByQsDiv1ForModal(String qsDiv1Modal) {
        log.info("getQsDiv2ListByQsDiv1....");
        List<InspIBInsertVO> insertVOList = inspectionIBMapper.getQsDiv2ListByQsDiv1ForModal(qsDiv1Modal);
        return insertVOList;
    }

    /**
     * Desc: 모달창 - [계약번호] 입력에 따른 [거래처명], [계약입고수량], [단위], [자재번호], [자재명], [자재용도] 자동 채우기
     */
    @Override
    public InspIBInsertVO getContractDetailsByContractIDModal(Long contractIDModal) {
        log.info("contractIDModal: " + contractIDModal);
        return inspectionIBMapper.getContractDetailsByContractIDModal(contractIDModal);
    }

    /**
     * Desc: 자재불량 등록 시, DB 저장 - [품질검사 테이블], [재고 테이블]
     * @return: inspectionIB.js 코드에 '/inspectionIB'로 리다이렉트하는 코드가 있음.
     * [계약(CONTRACT) 테이블]의 업데이트는 같은 계약번호에 대해서는 단 한 번만 업데이트 수행
     * [Set]:
     */
    @Override
    @Transactional
    public void registerInspectionItems(List<InspIBInsertVO> items) {
        Map<String, Boolean> updatedContracts = new HashMap<>();    // 업데이트된 계약번호와 자재번호 조합을 저장하기 위한 Map(계약 테이블용)
        Map<String, Boolean> updatedInventory = new HashMap<>();    // 업데이트된 계약번호와 자재번호 조합을 저장하기 위한 Map(재고 테이블용)

        for(InspIBInsertVO item: items) {
            // [품질검사 테이블]에 데이터 저장
            inspectionIBMapper.insertQualityInspection(item);

            // 고유한 키 생성 (계약번호와 자재번호의 조합)
            String contractKey = item.getContractIDModal() + "-" + item.getMatIDModal();
            String inventoryKey = item.getContractIDModal() + "-" + item.getMatIDModal();

            // 계약 테이블 업데이트: 이미 업데이트된 조합인지 확인하고, 아니라면 업데이트 수행
            if(!updatedContracts.containsKey(contractKey)) {
                // [계약 테이블] 업데이트
                inspectionIBMapper.updateContract(item);
                updatedContracts.put(contractKey, true);    // 업데이트된 조합을 Map에 추가
            }

            // 재고 테이블 업데이트: 이미 업데이트된 조합인지 확인하고, 아니라면 업데이트 수행
            if(!updatedInventory.containsKey(inventoryKey)) {
                // [재고 테이블] 업데이트 또는 삽입
                inspectionIBMapper.insertOrUpdateInventory(item);
                updatedInventory.put(inventoryKey, true);   // 업데이트된 조합을 Map에 추가
            }

        }
    }

    /* [자재불량수정] - 모달창 ====================================================================================================== */
    /**
     * Desc: [수입검사관리]: 수정 - 특정 수입검사 항목을 가져오는 메소드
     */
    @Override
    public InspIBListVO getInspectionDetails(Long qiID) {
        log.info("qiID" + qiID);
        log.info("수입관리검사 수정 모달창 조회....");
        return inspectionIBMapper.getInspectionDetailsBySeq(qiID);
    }

    /**
     * Desc: [수입검사관리]: 수정
     */
    @Override
    public void updateInspectionRecord(InspIBUpdateVO updateVO) {
        log.info("수입관리검사 수정....");
        inspectionIBMapper.updateInspectionRecord(updateVO);
    }


}
