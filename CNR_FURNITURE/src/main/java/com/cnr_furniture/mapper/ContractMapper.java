package com.cnr_furniture.mapper;

import com.cnr_furniture.domain.MaterialInfo.MaterialInfoVO;
import com.cnr_furniture.domain.contract.ContractSearch;
import com.cnr_furniture.domain.contract.ContractVO;

import java.util.List;

public interface ContractMapper {
  /** 계약 조회 **/
  List<ContractVO> selectByContract(ContractSearch search);

  /** 자재 검색 조회 **/
  List<MaterialInfoVO> materialList();
}
