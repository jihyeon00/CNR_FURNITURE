package com.cnr_furniture.service.quality.defectiveProcess;

import com.cnr_furniture.domain.quality.defectiveProcess.CriteriaDftProcessVO;
import com.cnr_furniture.domain.quality.defectiveProcess.DftProcessListVO;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface DefectiveProcessService {
  /**
   * Desc: 검색창 - 제조LOT번호 - 조회
   */
  List<DftProcessListVO> getLotIDList();

  /**
   * Desc: 검색창 - 공정번호 - 조회
   */
  List<DftProcessListVO> getProcessIDList();

  /**
   * Desc: 검색창 - 불량유형1 - 조회
   */
  List<DftProcessListVO> getQsDiv1List();

  /**
   * Desc: 검색창 - 불량유형1에 따른 불량유형2 조회
   */
  List<DftProcessListVO> getQsDiv2ListByQsDiv1(String qsDiv1);

  /**
   * Desc: 공정불량실적 조회(with 검색)
   */
  List<DftProcessListVO> getDftProcessList(CriteriaDftProcessVO cri);
}
