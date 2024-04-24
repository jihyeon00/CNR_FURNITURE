package com.cnr_furniture.service.quality.defectiveProcess;

import com.cnr_furniture.domain.quality.defectiveProcess.CriteriaDftProcessVO;
import com.cnr_furniture.domain.quality.defectiveProcess.DftProcessListVO;
import com.cnr_furniture.mapper.quality.DefectiveProcessMapper;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Log4j
@Service
public class DefectiveProcessServiceImpl implements DefectiveProcessService {
  @Autowired
  private DefectiveProcessMapper defectiveProcessMapper;

  /**
   * Desc: 검색창 - 제조LOT번호 - 조회
   */
  @Override
  public List<DftProcessListVO> getLotIDList() {
    return defectiveProcessMapper.getLotIDList();
  }

  /**
   * Desc: 검색창 - 공정번호 - 조회
   */
  @Override
  public List<DftProcessListVO> getProcessIDList() {
    return defectiveProcessMapper.getProcessIDList();
  }

  /**
   * Desc: 검색창 - 불량유형1 - 조회
   */
  @Override
  public List<DftProcessListVO> getQsDiv1List() {
    return defectiveProcessMapper.getQsDiv1List();
  }

  /**
   * Desc: 검색창 - 불량유형1에 따른 불량유형2 조회
   */
  @Override
  public List<DftProcessListVO> getQsDiv2ListByQsDiv1(String qsDiv1) {
    return defectiveProcessMapper.getQsDiv2ListByQsDiv1(qsDiv1);
  }

  /**
   * Desc: 공정불량실적 조회(with 검색)
   */
  @Override
  public List<DftProcessListVO> getDftProcessList(CriteriaDftProcessVO cri) {
    return defectiveProcessMapper.getDftProcessList(cri);
  }
}
