package com.cnr_furniture.mapper.quality;

import com.cnr_furniture.domain.quality.inspectionProcess.*;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface InspectionProcessMapper {
    /* [공정불량현황] - 검색 및 현황 조회 ====================================================================================================== */
    /**
     * Desc: 검색창 - 제조LOT번호 - 조회
     */
    List<InspProcessListVO> getLotIDList();

    /**
     * Desc: 검색창 - 공정번호 - 조회
     */
    List<InspProcessListVO> getProcessIDList();

    /**
     * Desc: 검색창 - 공정명 - 조회
     */
    List<InspProcessListVO> getProcessNameList();

    /**
     * Desc: 검색창 - 불량유형1 - 조회
     */
    List<InspProcessListVO> getQsDiv1List();

    /**
     * Desc: 검색창 - 불량유형1에 따른 불량유형2 조회
     */
    List<InspProcessListVO> getQsDiv2ListByQsDiv1(String qsDiv1);

    /**
     * Desc: 검색창 - 작업번호 - 조회
     */
    List<InspProcessListVO> getWorkIDList();

    /**
     * Desc: 검색창 - 설비번호 - 조회
     */
    List<InspProcessListVO> getMachineIDList();

    /**
     * Desc: 공정검사현황 목록 조회(with 검색)
     */
    List<InspProcessListVO> getInspProcessList(CriteriaInspProcessVO cri);

    /* [공정불량현황] - [등록] 모달창 ====================================================================================================== */
    /**
     * Desc: 등록 모달창 - [불량유형1] option 조회
     */
    List<InspProcessInsertVO> getQsDiv1ForInsertModal();

    /**
     * Desc: 등록 모달창 - [불량유형1]에 따른 [불량유형2] 조회
     */
    List<InspProcessInsertVO> getQsDiv2ListByQsDiv1ForInsertModal(String qsDiv1);

    /**
     * Desc: 등록 모달창 - [작업번호] option 조회
     */
    List<InspProcessInsertVO> getWorkIDListForModal();

    /**
     * Desc: 등록 모달창 - [작업번호]에 따른 공정정보 조회 및 input 담음
     */
    InspProcessInsertVO getWorkDetailsByWorkID(Long workID);

    /**
     * Desc: 등록 모달창 - [품질검사 테이블] - [공정불량등록] 데이터 INSERT
     */
    void insertQualityInspection(InspProcessInsertVO insertVO);

    /**
     * Desc: 등록 모달창 - [작업 테이블] - [공정불량등록] 데이터 UPDATE
     */
    void updateWork(InspProcessInsertVO insertVO);

    /* [공정불량현황] - [수정] 모달창 ====================================================================================================== */
    /**
     * Desc: 수정 모달창 - [불량유형1] option 조회
     */
    List<InspProcessUpdateVO> getQsDiv1ListForUpdateModal();

    /**
     * Desc: 수정 모달창 - [불량유형1]에 따른 [불량유형2] 조회
     */
    List<InspProcessUpdateVO> getQsDiv2ListByQsDiv1ForUpdateModal(String qsDiv1);

    /**
     * Desc: 수정 모달창 - 특정 수입검사 항목을 가져오는 메소드
     */
    InspProcessUpdateVO getInspProcessDetailsBySeq(Long qiID);

    /**
     * Desc: 수정 모달창 - 수입검사 항목을 UPDATE 하는 메소드
     */
    void updateInspProcess(InspProcessUpdateVO updateVO);

}
