package com.cnr_furniture.service.quality;

import com.cnr_furniture.domain.quality.CriteriaInspIBVO;
import com.cnr_furniture.domain.quality.InspectionIBListVO;
import com.cnr_furniture.mapper.quality.InspectionIBMapper;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Log4j
@Service
public class InspectionIBServiceImpl implements InspectionIBService{
    @Autowired
    private InspectionIBMapper inspectionIBMapper;

    /**
     * Desc: 검색창 - 자재번호 - 조회
     */
    @Override
    public List<InspectionIBListVO> getMatIDList() {
        log.info("getMatIDList....");
        return inspectionIBMapper.getMatIDList();
    }

    /**
     * Desc: 검색창 - 계약번호 - 조회
     */
    @Override
    public List<InspectionIBListVO> getContractIDList() {
        log.info("getContractIDList....");
        return inspectionIBMapper.getContractIDList();
    }

    /**
     * Desc: 검색창 - 불량유형1 - 조회
     */
    @Override
    public List<InspectionIBListVO> getQsDiv1List() {
        log.info("getQsDiv1List....");
        return inspectionIBMapper.getQsDiv1List();
    }

    /**
     * Desc: 검색창 - 불량유형1에 따른 불량유형2 조회
     */
    @Override
    public List<InspectionIBListVO> getQsDiv2ListByQsDiv1(String qsDiv1) {
        log.info("getQsDiv2ListByQsDiv1....");
        return inspectionIBMapper.getQsDiv2ListByQsDiv1(qsDiv1);
    }

    /**
     * Desc: 수입검사현황 목록 조회(with 검색), 자재 IB 불량 현황 조회
     */
    @Override
    public List<InspectionIBListVO> getInspectionIBList(CriteriaInspIBVO cri) {
        log.info("getInspectionIBList....");
        return inspectionIBMapper.getInspectionIBList(cri);
    }

}
