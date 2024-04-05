package com.cnr_furniture.service;

import com.cnr_furniture.domain.member.MemberVO;
import com.cnr_furniture.domain.member.Search;

import java.util.List;

public interface MemberService {
  /** 사원정보 조회 **/
  MemberVO selectMember(String E_EMAIL);

  /** 직원목록 조회 **/
  List<MemberVO> employeeList(Search search);
  /** 사원리스트 조회 **/
  List<MemberVO> staffList(Search search);
  /** 매니저리스트 조회 **/
  List<MemberVO> managerList(Search search);
  /** 디렉터리스트 조회 **/
  List<MemberVO> directorList(Search search);

  /** 권한 조회 **/
  List<MemberVO> roleList();
  /** 부서 조회 **/
  List<MemberVO> dpNameList();

}
