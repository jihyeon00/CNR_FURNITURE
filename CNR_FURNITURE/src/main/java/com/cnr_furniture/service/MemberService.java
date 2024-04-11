package com.cnr_furniture.service;

import com.cnr_furniture.domain.member.MemberVO;
import com.cnr_furniture.domain.member.MemberSearch;

import java.util.List;

public interface MemberService {
  /** 사원정보 조회 **/
  MemberVO selectByMember(String email);

  /** 직원목록 조회 **/
  List<MemberVO> employeeList(MemberSearch search);
  /** 사원리스트 조회 **/
  List<MemberVO> staffList(MemberSearch search);
  /** 매니저리스트 조회 **/
  List<MemberVO> managerList(MemberSearch search);
  /** 디렉터리스트 조회 **/
  List<MemberVO> directorList(MemberSearch search);

  /** 권한 조회 **/
  List<MemberVO> roleList();
  /** 부서 조회 **/
  List<MemberVO> dpNameList();

}
