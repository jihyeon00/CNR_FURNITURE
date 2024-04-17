package com.cnr_furniture.service;

import com.cnr_furniture.domain.MaterialInfo.MaterialInfoVO;
import com.cnr_furniture.domain.contract.ContractSearch;
import com.cnr_furniture.domain.contract.ContractVO;
import com.cnr_furniture.mapper.ContractMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;

import java.util.List;

@Log4j
@Service
public class ContractServiceImpl implements ContractService{
  @Autowired
  private ContractMapper contractMapper;

  /** 계약 조회 **/
  @Override
  public List<ContractVO> selectByContract(ContractSearch search) {
    List<ContractVO> ContractList = contractMapper.selectByContract(search);
    return ContractList;
  }

  /** 자재 검색 조회 **/
  @Override
  public List<MaterialInfoVO> materialList() {
    List<MaterialInfoVO> materialList = contractMapper.materialList();
    return materialList;
  }
}
