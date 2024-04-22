<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<%@ include file="../includes/header.jsp" %>
<script defer src="/resources/js/memberSearch.js"></script>
<script defer src="/resources/js/member.js"></script>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-md-6">
            <h1 class="m-0"><i class="far fa-clipboard"></i> 사용자별 권한 관리</h1>
          </div><!-- /.col -->
          <div class="col-md-6 ml-auto">
            <ol class="breadcrumb float-sm-right">
              <div class="member-btn">
                <button type="button" class="btn btn-info" id="roleUp" onClick="checkboxArr()">권한변경</button>
                <button type="button" class="btn btn-default" id="addMembers" onClick="addMemberModal"
                  data-toggle="modal" data-target="#addMember">사원등록</button>
              </div>
            </ol>
          </div><!-- /.col -->
        </div>
        <div class="row">
          <!-- 검색창 -->
          <form action="" id="searchForm" class="col-md-12" onSubmit="return false">
            <div class="searchBer">
              <div class="col-sm-1 sb-name">권한</div>
              <div class="col-sm-2 sb-text">
                <select class="col-sm-12"  id="find_Role" name="find_Role">
                  <option value="권한선택" disabled selected>권한선택</option>
                  <c:forEach var="list" items = "${roleList}">
                    <option value='${list.role}'
                      <c:if test="${search.find_Role == list.role}">selected</c:if> >${list.role_kr}
                    </option>
                  </c:forEach>
                </select>
              </div>
              <div class="col-sm-1 sb-name">부서</div>
              <div class="col-sm-2 sb-text">
                <input list="companyList" class="col-sm-12 input-companyList" name="find_DP_name" id="find_DP_name"
                  value='<c:out value="${search.find_DP_name}" />' autocomplete="off" >
                <datalist id="companyList">
                  <c:forEach var="list" items = "${dpNameList}">
                    <option value='${list.dp_name}'label='${list.dp_name}'>
                    </option>
                  </c:forEach>
                </datalist>
              </div>
              <div class="col-sm-1 sb-name">사원명</div>
              <div class="col-sm-2 sb-text">
                <input type="text" class="col-sm-12" id="find_emp_name" name="find_emp_name"
                  value='<c:out value="${search.find_emp_name}"/>' autocomplete="off" />
              </div>
              <div class="col-sm-3">
                <div class="sb-btns">
                  <button type="button" class="btn btn-reset" id="" onClick="location.href='/M/member/memberRole'">
                    <img class="resetPng" alt="reset" id="btn-reset" src="/resources/img/reset.png" >
                  </button>
                  <button type="submit" class="btn btn-primary" id=""
                    onClick="javascript: search();">
                    <i class="fa-solid fa-magnifying-glass"></i>&nbsp;검색</button>
                </div>
              </div>
            </div>
          </form>
        </div>
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <div class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-12">
            <!-- 직원목록 테이블 -->
            <div class="ETableTitle">
              <div class="icon"><i class="fa fa-list"></i></div>
              <div class="employee">직원목록</div>
            </div>
            <div class="table member-ETable">
              <table cellpadding="0" cellspacing="0" border="0">
                <colgroup>
                  <col style="width: 5%" />
                  <col style="width: 13%" />
                  <col style="width: 13%" />
                  <col style="width: 13%" />
                  <col style="width: 13%" />
                  <col style="width: 20%" />
                  <col style="width: 22%" />
                </colgroup>
                <thead class="tbl-header">
                  <tr>
                    <th></th>
                    <th>사원번호</th>
                    <th>사원명</th>
                    <th>권한</th>
                    <th>부서</th>
                    <th>연락처</th>
                    <th>이메일</th>
                  </tr>
                </thead>
                <tbody class="tbl-content member-ETable" id="memberRoleList">
                  <c:forEach var="list" items="${EmployeeList}">
                    <tr>
                      <td><input type="checkbox" value="${list.id}" class="list-checkBox"></td>
                      <td><div id="m_id"><c:out value="${list.id}"/></div></td>
                      <td><div id="m_name"><c:out value="${list.name}"/></div></td>
                      <td><div id="m_role"><c:out value="${list.role_kr}"/></div></td>
                      <td><c:out value="${list.dp_name}"/></td>
                      <td><c:out value="${list.ph}"/></td>
                      <td><c:out value="${list.email}"/></td>
                    </tr>
                  </c:forEach>
                </tbody>
              </table>
              <!-- /.table -->
	          </div>
          </div>
        <!-- /.row -->
      </div>
      <!-- /.container-fluid -->
    </div>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->


  <!-- 사원등록 모달 -->
  <div class="modal fade" id="addMember" tabindex="-1" role="dialog" aria-labelledby="addMemberModalLabel">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">
        <div class="modal-header addMember-header">
          <h4 class="modal-title addMember-title" id="addMemberModalLabel">사원등록</h4>
          <button type="button" class="close modalClose" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        </div>
        <div class="modal-body">
          <form action="/addStaffMember" id="addMemberForm" method="Post" onSubmit="return false">
            <div class="row">
              <div class="col-md-12 addMember-area">
                <div class="col-md-8 addMember-Text-area">
                  <div class="col-md-12">사원명</div>
                  <input type="text" class="col-sm-12 addMember-Text" id="name" name="name" autocomplete="off"/>
                  <div class="col-md-12">부서</div>
                  <select name="dp_name" id="dp_name" class="col-sm-12 addMember-Text">
                    <option value="" selected>부서 선택</option>
                    <c:forEach var="dpList" items = "${dpNameList}">
                      <option value='<c:out value="${dpList.dp_name}"/>'><c:out value="${dpList.dp_name}"/></option>
                    </c:forEach>
                  </select>
                  <div class="col-md-12">연락처</div>
                  <input type="text" class="col-sm-12 addMember-Text" id="ph" name="ph" autocomplete="off"/>
                  <div class="col-md-12">email</div>
                  <input type="text" class="col-sm-12 addMember-Text" id="email" name="email" autocomplete="off"/>
                </div>
              </div>
            </div>
          </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-primary" onClick="staffInsert();">등록</button>
          <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
        </div>
      </div>
    </div>
  </div>


  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->


<%@ include file="../includes/footer.jsp" %>
