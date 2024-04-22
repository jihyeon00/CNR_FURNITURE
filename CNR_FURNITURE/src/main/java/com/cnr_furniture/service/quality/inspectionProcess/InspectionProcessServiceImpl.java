package com.cnr_furniture.service.quality.inspectionProcess;

import com.cnr_furniture.domain.quality.inspectionProcess.CriteriaInspProcessVO;
import com.cnr_furniture.domain.quality.inspectionProcess.InspProcessInsertVO;
import com.cnr_furniture.domain.quality.inspectionProcess.InspProcessListVO;
import com.cnr_furniture.domain.quality.inspectionProcess.InspProcessUpdateVO;
import com.cnr_furniture.mapper.quality.InspectionProcessMapper;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Log4j
@Service
public class InspectionProcessServiceImpl implements InspectionProcessService {
    @Autowired
    private InspectionProcessMapper inspectionProcessMapper;

    /* [공정불량현황] - 검색 및 현황 조회 ====================================================================================================== */
    /**
     * Desc: 검색창 - 제조LOT번호 - 조회
     */
    @Override
    public List<InspProcessListVO> getLotIDList() {
        log.info("getLotIDList....");
        return inspectionProcessMapper.getLotIDList();
    }
    /**
     * Desc: 검색창 - 공정번호 - 조회
     */
    @Override
    public List<InspProcessListVO> getProcessIDList() {
        log.info("getProcessIDList....");
        return inspectionProcessMapper.getProcessIDList();
    }

    /**
     * Desc: 검색창 - 공정명 - 조회
     */
    @Override
    public List<InspProcessListVO> getProcessNameList() {
        log.info("getProcessNameList....");
        return inspectionProcessMapper.getProcessNameList();
    }

    /**
     * Desc: 검색창 - 불량유형1 - 조회
     */
    @Override
    public List<InspProcessListVO> getQsDiv1List() {
        log.info("getQsDiv1List....");
        return inspectionProcessMapper.getQsDiv1List();
    }

    /**
     * Desc: 검색창 - 불량유형1에 따른 불량유형2 조회
     */
    @Override
    public List<InspProcessListVO> getQsDiv2ListByQsDiv1(String qsDiv1) {
        log.info("getQsDiv2ListByQsDiv1....");
        return inspectionProcessMapper.getQsDiv2ListByQsDiv1(qsDiv1);
    }

    /**
     * Desc: 검색창 - 작업번호 - 조회
     */
    @Override
    public List<InspProcessListVO> getWorkIDList() {
        log.info("getWorkIDList....");
        return inspectionProcessMapper.getWorkIDList();
    }

    /**
     * Desc: 검색창 - 설비번호 - 조회
     */
    @Override
    public List<InspProcessListVO> getMachineIDList() {
        log.info("getMachineIDList....");
        return inspectionProcessMapper.getMachineIDList();
    }

    /**
     * Desc: 공정검사현황 목록 조회(with 검색)
     */
    @Override
    public List<InspProcessListVO> getInspProcessList(CriteriaInspProcessVO cri) {
        log.info("getInspProcessList....");
        return inspectionProcessMapper.getInspProcessList(cri);
    }

    /* [공정불량현황] - [등록] 모달창 ====================================================================================================== */
    /**
     * Desc: 등록 모달창 - [불량유형1] option 조회
     */
    @Override
    public List<InspProcessInsertVO> getQsDiv1ForInsertModal() {
        log.info("getQsDiv1ForInsertModal....");
        return inspectionProcessMapper.getQsDiv1ForInsertModal();
    }

    /**
     * Desc: 등록 모달창 - [불량유형1]에 따른 [불량유형2] 조회
     */
    @Override
    public List<InspProcessInsertVO> getQsDiv2ListByQsDiv1ForInsertModal(String qsDiv1) {
        log.info("getQsDiv2ListByQsDiv1ForInsertModal....");
        return inspectionProcessMapper.getQsDiv2ListByQsDiv1ForInsertModal(qsDiv1);
    }

    /**
     * Desc: 등록 모달창 - [작업번호] option 조회
     */
    @Override
    public List<InspProcessInsertVO> getWorkIDListForModal() {
        log.info("getWorkIDListForModal....");
        return inspectionProcessMapper.getWorkIDListForModal();
    }

    /**
     * Desc: 등록 모달창 - [작업번호]에 따른 공정정보 조회 및 input 담음
     */
    @Override
    public InspProcessInsertVO getWorkDetailsByWorkID(Long workID) {
        log.info("getWorkIDListForModal....");
        return inspectionProcessMapper.getWorkDetailsByWorkID(workID);
    }

    /**
     * Desc: [공정불량등록] 시, DB 저장 - [품질검사 테이블], [작업 테이블]
     * @return: inspectionProcess.js 코드에 '/inspectionProcess'로 리다이렉트하는 코드가 있음.
     * [작업(WORK) 테이블]의 업데이트는 같은 [계약번호, (w_id)]에 대해서는 단 한 번만 업데이트 수행(불량수량을.)
     */
    @Override
    @Transactional
    public void registerInspectionProcess(List<InspProcessInsertVO> items) {
        Map<String, Boolean> updatedWork = new HashMap<>();  // 업데이트된 [작업번호]를 저장하기 위한 Map(작업 테이블용)

        for (InspProcessInsertVO item: items) {
            // [품질검사 테이블]에 데이터 저장
            inspectionProcessMapper.insertQualityInspection(item);

            // 고유한 키 생성(작업번호)
            String workKey = "작업 " + item.getWorkID() + "번";    // InspProcessInsertVO에서 workID 가져오기

            // [작업 테이블] 업데이트: 이미 업데이트된 조합인지 확인하고, 아니라면 업데이트 수행
            if(!updatedWork.containsKey(workKey)) {
                // [작업 테이블] 업데이트
                inspectionProcessMapper.updateWork(item);
                updatedWork.put(workKey, true);             // 업데이트된 조합을 Map에 추가
            }
        }
    }

    /* [공정불량현황] - [수정] 모달창 ====================================================================================================== */
    /**
     * Desc: 수정 모달창 - [불량유형1] option 조회
     */
    @Override
    public List<InspProcessUpdateVO> getQsDiv1ListForUpdateModal() {
        return inspectionProcessMapper.getQsDiv1ListForUpdateModal();
    }

    /**
     * Desc: 수정 모달창 - [불량유형1]에 따른 [불량유형2] 조회
     */
    @Override
    public List<InspProcessUpdateVO> getQsDiv2ListByQsDiv1ForUpdateModal(String qsDiv1) {
        return inspectionProcessMapper.getQsDiv2ListByQsDiv1ForUpdateModal(qsDiv1);
    }

    /**
     * Desc: 수정 모달창 - 특정 수입검사 항목을 가져오는 메소드
     */
    @Override
    public InspProcessUpdateVO getInspProcessDetailsBySeq(Long qiID) {
        log.info("qiID" + qiID);
        log.info("공정관리검사 수정 모달창 조회....");
        return inspectionProcessMapper.getInspProcessDetailsBySeq(qiID);
    }

    /**
     * Desc: 수정 모달창 - 수입검사 항목을 UPDATE 하는 메소드
     */
    @Override
    public void updateInspProcess(InspProcessUpdateVO updateVO) {
        log.info("공정관리검사 수정....");
        inspectionProcessMapper.updateInspProcess(updateVO);
    }
}
