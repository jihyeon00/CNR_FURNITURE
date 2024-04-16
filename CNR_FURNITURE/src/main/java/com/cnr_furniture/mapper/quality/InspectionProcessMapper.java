package com.cnr_furniture.mapper.quality;

import com.cnr_furniture.domain.quality.inspectionProcess.*;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface InspectionProcessMapper {
    /* [공정불량등록] - 검색 및 현황 조회 ====================================================================================================== */
    /**
     * Desc: 검색창 - 제조LOT번호 - 조회
     */
    List<InspectionProcessListVO> getLotIDList();

    /**
     * Desc: 검색창 - 공정번호 - 조회
     */
    List<InspectionProcessListVO> getProcessIDList();

    /**
     * Desc: 검색창 - 공정명 - 조회
     */
    List<InspectionProcessListVO> getProcessNameList();

    /**
     * Desc: 검색창 - 불량유형1 - 조회
     */
    List<InspectionProcessListVO> getQsDiv1List();

    /**
     * Desc: 검색창 - 불량유형1에 따른 불량유형2 조회
     */
    List<InspectionProcessListVO> getQsDiv2ListByQsDiv1(String qsDiv1);

    /**
     * Desc: 검색창 - 작업번호 - 조회
     */
    List<InspectionProcessListVO> getWorkIDList();

    /**
     * Desc: 검색창 - 설비번호 - 조회
     */
    List<InspectionProcessListVO> getMachineIDList();

    /**
     * Desc: 공정검사현황 목록 조회(with 검색)
     */
    List<InspectionProcessListVO> getInspProcessList(CriteriaInspProcessVO cri);
}
