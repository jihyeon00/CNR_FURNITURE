package com.cnr_furniture.service.quality.inspectionProcess;

import com.cnr_furniture.domain.quality.inspectionProcess.CriteriaInspProcessVO;
import com.cnr_furniture.domain.quality.inspectionProcess.InspectionProcessListVO;
import com.cnr_furniture.mapper.quality.InspectionProcessMapper;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Log4j
@Service
@AllArgsConstructor
public class InspectionProcessServiceImpl implements InspectionProcessService {
    private InspectionProcessMapper inspectionProcessMapper;

    /* [공정불량등록] - 검색 및 현황 조회 ====================================================================================================== */
    /**
     * Desc: 검색창 - 제조LOT번호 - 조회
     */
    @Override
    public List<InspectionProcessListVO> getLotIDList() {
        log.info("getLotIDList....");
        return inspectionProcessMapper.getLotIDList();
    }
    /**
     * Desc: 검색창 - 공정번호 - 조회
     */
    @Override
    public List<InspectionProcessListVO> getProcessIDList() {
        log.info("getProcessIDList....");
        return inspectionProcessMapper.getProcessIDList();
    }

    /**
     * Desc: 검색창 - 공정명 - 조회
     */
    @Override
    public List<InspectionProcessListVO> getProcessNameList() {
        log.info("getProcessNameList....");
        return inspectionProcessMapper.getProcessNameList();
    }

    /**
     * Desc: 검색창 - 불량유형1 - 조회
     */
    @Override
    public List<InspectionProcessListVO> getQsDiv1List() {
        log.info("getQsDiv1List....");
        return inspectionProcessMapper.getQsDiv1List();
    }

    /**
     * Desc: 검색창 - 불량유형1에 따른 불량유형2 조회
     */
    @Override
    public List<InspectionProcessListVO> getQsDiv2ListByQsDiv1(String qsDiv1) {
        log.info("getQsDiv2ListByQsDiv1....");
        return inspectionProcessMapper.getQsDiv2ListByQsDiv1(qsDiv1);
    }

    /**
     * Desc: 검색창 - 작업번호 - 조회
     */
    @Override
    public List<InspectionProcessListVO> getWorkIDList() {
        log.info("getWorkIDList....");
        return inspectionProcessMapper.getWorkIDList();
    }

    /**
     * Desc: 검색창 - 설비번호 - 조회
     */
    @Override
    public List<InspectionProcessListVO> getMachineIDList() {
        log.info("getMachineIDList....");
        return inspectionProcessMapper.getMachineIDList();
    }

    /**
     * Desc: 공정검사현황 목록 조회(with 검색)
     */
    @Override
    public List<InspectionProcessListVO> getInspProcessList(CriteriaInspProcessVO cri) {
        log.info("getInspProcessList....");
        return inspectionProcessMapper.getInspProcessList(cri);
    }
}
