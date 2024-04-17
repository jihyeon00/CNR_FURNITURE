package com.cnr_furniture.service;

import com.cnr_furniture.domain.CompanyVO;
import com.cnr_furniture.domain.member.MemberSearch;
import com.cnr_furniture.mapper.CompanyMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;

import java.util.List;

@Log4j
@Service
public class CompanyServiceImpl implements CompanyService{
  @Autowired
  private CompanyMapper companyMapper;

  /** 거래처 정보 조회 **/
  @Override
  public List<CompanyVO> getCompanyList(MemberSearch search) {
    List<CompanyVO> CompanyList = companyMapper.getCompanyList(search);
    return CompanyList;
  }

  /** 거래처명 리스트 **/
  @Override
  public List<CompanyVO> CompanyNameList() {
    List<CompanyVO> CompanyNameList = companyMapper.CompanyNameList();
    return CompanyNameList;
  }
}
