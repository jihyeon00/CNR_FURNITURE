package com.cnr_furniture.service;

import com.cnr_furniture.domain.MaterialInfo.MaterialInfoVO;
import com.cnr_furniture.domain.contract.ContractSearch;
import com.cnr_furniture.domain.contract.ContractVO;

import java.util.List;

public interface ContractService {
  /** 계약 조회 **/
  List<ContractVO> selectByContract(ContractSearch search);

  /** 자재 검색 조회 **/
  List<MaterialInfoVO> materialList();
}
