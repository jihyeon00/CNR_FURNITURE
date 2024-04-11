package com.cnr_furniture.service;

import com.cnr_furniture.domain.CompanyVO;
import com.cnr_furniture.domain.member.MemberSearch;

import java.util.List;

public interface CompanyService {
  /** 거래처 정보 조회 **/
  List<CompanyVO> getCompanyList(MemberSearch search);
}
