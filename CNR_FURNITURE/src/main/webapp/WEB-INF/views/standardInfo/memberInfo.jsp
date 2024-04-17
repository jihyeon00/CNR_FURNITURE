<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<script defer src="/resources/js/memberSearch.js"></script>

<%@ include file="../includes/header.jsp" %>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <!-- 페이지 정보 -->
          <div class="col-md-6">
            <h1 class="m-0"><i class="far fa-clipboard"></i> 사원정보조회</h1>
          </div><!-- /.col -->
          <div class="col-md-6 ml-auto">
            <ol class="breadcrumb float-sm-right">
              <div class="member-btn">
              </div>
            </ol>
          </div><!-- /.col -->
        </div>
        <div class="row mb-2">
          <!-- 검색창 -->
          <form action="" id="searchForm" class="col-md-12" onSubmit="return false">
            <div class="searchBer">
              <div class="col-md-1 sb-name">부서</div>
              <div class="col-md-2 sb-text">
                <input list="companyList" class="col-sm-12 input-companyList" name="find_DP_name" id="find_DP_name"
                  value='<c:out value="${search.find_DP_name}" />' autocomplete="off" >
                <datalist id="companyList">
                  <c:forEach var="list" items = "${dpNameList}">
                    <option value='${list.dp_name}'label='${list.dp_name}'>
                    </option>
                  </c:forEach>
                </datalist>
              </div>
              <div class="col-md-1 sb-name">사원명</div>
              <div class="col-md-2 sb-text">
                <input type="text" class="col-sm-12" id="find_emp_name" name="find_emp_name"
                  value='<c:out value="${search.find_emp_name}"/>' autocomplete="off" />
              </div>
              <div class="col-md-6 ">
                <div class="sb-btns">
                  <button type="button" class="btn btn-reset" id="" onClick="location.href='/memberInfo'">
                    <img class="resetPng" alt="reset" id="btn-reset" src="/resources/img/reset.png">
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
          <div class="col-md-6">
            <!-- 사원테이블 -->
            <div class="ETableTitle">
              <div class="icon"><i class="fa fa-list"></i></div>
              <div class="employee">사원</div>
            </div>
            <div class="table member-ETable">
              <table cellpadding="0" cellspacing="0" border="0">
                <colgroup>
                  <col style="width: 16%" />
                  <col style="width: 16%" />
                  <col style="width: 16%" />
                  <col style="width: 20%" />
                  <col style="width: 32%" />
                </colgroup>
                <thead class="tbl-header">
                  <tr>
                    <th>사원번호</th>
                    <th>사원명</th>
                    <th>부서</th>
                    <th>연락처</th>
                    <th>이메일</th>
                  </tr>
                </thead>
                <tbody class="tbl-content member-ETable">
                  <c:forEach var="Staff" items="${StaffList}">
                    <tr>
                      <td><c:out value="${Staff.id}"/></td>
                      <td><c:out value="${Staff.name}"/></td>
                      <td><c:out value="${Staff.dp_name}"/></td>
                      <td><c:out value="${Staff.ph}"/></td>
                      <td><c:out value="${Staff.email}"/></td>
                    </tr>
                  </c:forEach>
                </tbody>
              </table>
              <!-- /.table -->
	          </div>
          </div>

          <div class="col-md-6">
            <!-- 매니저 테이블 -->
            <div class="ETableTitle">
              <div class="icon"><i class="fa fa-list"></i></div>
              <div class="employee">매니저</div>
            </div>
            <div class="table member-DTable">
              <table cellpadding="0" cellspacing="0" border="0">
                <colgroup>
                  <col style="width: 16%" />
                  <col style="width: 16%" />
                  <col style="width: 16%" />
                  <col style="width: 20%" />
                  <col style="width: 32%" />
                </colgroup>
                <thead class="tbl-header">
                  <tr>
                    <th>사원번호</th>
                    <th>사원명</th>
                    <th>부서</th>
                    <th>연락처</th>
                    <th>이메일</th>
                  </tr>
                </thead>
                <tbody class="tbl-content member-DTable">
                  <c:forEach var="Manager" items="${ManagerList}">
                    <tr>
                      <td><c:out value="${Manager.id}"/></td>
                      <td><c:out value="${Manager.name}"/></td>
                      <td><c:out value="${Manager.dp_name}"/></td>
                      <td><c:out value="${Manager.ph}"/></td>
                      <td><c:out value="${Manager.email}"/></td>
                    </tr>
                  </c:forEach>
                </tbody>
              </table>
              <!-- /.table -->
            </div>

            <!-- 디렉터 테이블 -->
            <div class="ETableTitle">
              <div class="icon"><i class="fa fa-list"></i></div>
              <div class="employee">디렉터</div>
            </div>
            <div class="table member-DTable">
              <table cellpadding="0" cellspacing="0" border="0">
                <colgroup>
                  <col style="width: 16%" />
                  <col style="width: 16%" />
                  <col style="width: 16%" />
                  <col style="width: 20%" />
                  <col style="width: 32%" />
                </colgroup>
                <thead class="tbl-header">
                  <tr>
                    <th>사원번호</th>
                    <th>사원명</th>
                    <th>부서</th>
                    <th>연락처</th>
                    <th>이메일</th>
                  </tr>
                </thead>
                <tbody class="tbl-content member-DTable">
                  <c:forEach var="Director" items="${DirectorList}">
                    <tr>
                      <td><c:out value="${Director.id}"/></td>
                      <td><c:out value="${Director.name}"/></td>
                      <td><c:out value="${Director.dp_name}"/></td>
                      <td><c:out value="${Director.ph}"/></td>
                      <td><c:out value="${Director.email}"/></td>
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

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->

<%@ include file="../includes/footer.jsp" %>
