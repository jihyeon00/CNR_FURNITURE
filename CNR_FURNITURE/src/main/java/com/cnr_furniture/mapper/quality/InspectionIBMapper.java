package com.cnr_furniture.mapper.quality;

import com.cnr_furniture.domain.quality.CriteriaInspIBVO;
import com.cnr_furniture.domain.quality.InspectionIBListVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface InspectionIBMapper {
    /**
     * Desc: 검색창 - 자재번호 - 조회
     */
    List<InspectionIBListVO> getMatIDList();

    /**
     * Desc: 검색창 - 계약번호 - 조회
     */
    List<InspectionIBListVO> getContractIDList();

    /**
     * Desc: 검색창 - 불량유형1 - 조회
     */
    List<InspectionIBListVO> getQsDiv1List();

    /**
     * Desc: 검색창 - 불량유형2 - 조회
     */
    List<InspectionIBListVO> getQsDiv2ListByQsDiv1(String qsDiv1);


    /**
     * Desc: 수입검사현황 목록 조회(with 검색), 자재 IB 불량 현황 조회
     */
    List<InspectionIBListVO> getInspectionIBList(CriteriaInspIBVO cri);
}
