package com.cnr_furniture.service;

import com.cnr_furniture.domain.member.MemberVO;
import com.cnr_furniture.domain.member.Search;
import com.cnr_furniture.mapper.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;

import java.util.List;

@Log4j
@Service
public class MemberServiceImpl implements MemberService{
  @Autowired
  private MemberMapper memberMapper;

  /** 사원정보 조회 **/
  @Override
  public MemberVO selectMember(String E_EMAIL) {
    return memberMapper.selectMember(E_EMAIL);
  }

  /** 직원목록 조회 **/
  @Override
  public List<MemberVO> employeeList(Search search) {
    List<MemberVO> employeeList = memberMapper.employeeList(search);
    return employeeList;
  }

  /** 사원리스트 조회 **/
  @Override
  public List<MemberVO> staffList(Search search) {
    List<MemberVO> staffList = memberMapper.staffList(search);
    return staffList;
  }

  /** 매니저리스트 조회 **/
  @Override
  public List<MemberVO> managerList(Search search) {
    List<MemberVO> managerList = memberMapper.managerList(search);
    return managerList;
  }

  /** 디렉터리스트 조회 **/
  @Override
  public List<MemberVO> directorList(Search search) {
    List<MemberVO> directorList = memberMapper.directorList(search);
    return directorList;
  }

  /** 권한 조회 **/
  @Override
  public List<MemberVO> roleList() {
    List<MemberVO> roleList = memberMapper.roleList();
    return roleList;
  }
  /** 부서 조회 **/
  @Override
  public List<MemberVO> dpNameList() {
    List<MemberVO> dpNameList = memberMapper.dpNameList();
    return dpNameList;
  }
}
