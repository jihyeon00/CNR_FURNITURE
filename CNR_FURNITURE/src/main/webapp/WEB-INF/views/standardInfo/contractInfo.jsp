<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<%@ include file="../includes/header.jsp" %>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-md-6">
            <h1 class="m-0"><i class="far fa-clipboard"></i> 계약관리</h1>
          </div><!-- /.col -->
          <div class="col-md-6 ml-auto">
            <ol class="breadcrumb float-sm-right">
              <div class="sb-btns">
                <button type="submit" class="btn btn-reset" id="" onClick="location.href='/contractInfo'">
                  <img class="resetPng" alt="reset" id="btn-reset" src="/resources/img/reset.png" >
                </button>
                <button type="submit" class="btn btn-primary" id=""
                  onClick="javascript: search();">
                  <i class="fa-solid fa-magnifying-glass"></i>&nbsp;검색</button>
              </div>
            </ol>
          </div><!-- /.col -->
        </div>
        <div class="row mb-2" style="margin-top: -40px;">
          <!-- 검색창 -->
          <form action="" id="searchForm" class="col-md-12" onSubmit="return false">
            <!-- 검색행1 -->
            <div class="searchBar">
              <!-- 제조LOT번호 -->
              <div class="col-sm-2 sb-name" style="">제조LOT번호</div>
              <div class="col-sm-2 sb-text">
                <input list="workCompanyNameList" class="col-sm-12"  id="" name="">
              </div><!-- /.제조LOT번호 -->
              <!-- 제품번호 -->
              <div class="col-sm-1 sb-name">제품번호</div>
              <div class="col-sm-2 sb-text">
                <input list="workCompanyNameList" class="col-sm-12"  id="" name="">
              </div><!-- /.제품번호 -->
              <!-- 제품명 -->
              <div class="col-sm-1 sb-name">제품명</div>
              <div class="col-sm-2 sb-text">
                <input list="workCompanyNameList" class="col-sm-12"  id="" name="">
              </div><!-- /.제품명 -->
            </div><!-- /.검색행1 -->
            <!-- 검색행2 -->
            <div class="searchBar" style="margin-top: -12px;">
              <!-- 불량유형 -->
              <div class="col-sm-1 sb-name" style="">불량유형</div>
              <div class="col-sm-3 sb-text">
                <!-- 불량유형1 -->
                <select class="col-sm-6"  id="find_Role" name="find_Role">
                  <option value="">불량유형1 선택</option>
                  <c:forEach var="list" items = "${roleList}">
                    <option value='${list.e_ROLE}'
                      <c:if test="${find_Role eq list.e_ROLE}">selected='selected'</c:if> >${list.e_ROLE}
                    </option>
                  </c:forEach>
                </select><!-- /.불량유형1 -->
                &nbsp;
                <!-- 불량유형2 -->
                <select class="col-sm-6"  id="find_Role" name="find_Role">
                  <option value="">불량유형2 선택</option>
                  <c:forEach var="list" items = "${roleList}">
                    <option value='${list.e_ROLE}'
                      <c:if test="${find_Role eq list.e_ROLE}">selected='selected'</c:if> >${list.e_ROLE}
                    </option>
                  </c:forEach>
                </select><!-- /.불량유형2 -->
              </div><!-- /.불량유형 -->
              <!-- 작업번호 -->
              <div class="col-sm-1 sb-name">작업번호</div>
              <div class="col-sm-2 sb-text">
                <input list="workCompanyNameList" class="col-sm-12"  id="workCompanyName" name="workCompanyName">
              </div><!-- /.작업번호 -->
              <!-- 공정번호 -->
              <div class="col-sm-1 sb-name">공정번호</div>
              <div class="col-sm-2 sb-text">
                <input type="text" class="col-sm-12" id="find_emp_name" name="find_emp_name"
                  value='<c:out value="${search.find_emp_name}"/>' autocomplete="off" />
              </div><!-- /.공정번호 -->
            </div><!-- /.검색행2 -->
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
                  <col style="width: %" />
                  <col style="width: %" />
                  <col style="width: %" />
                  <col style="width: %" />
                  <col style="width: %" />
                  <col style="width: %" />
                  <col style="width: %" />
                  <col style="width: %" />
                  <col style="width: %" />
                  <col style="width: %" />
                  <col style="width: %" />
                </colgroup>
                <thead class="tbl-header">
                  <tr>
                    <th>No</th>
                    <th>구분</th>
                    <th>거래처명</th>
                    <th>자재</th>
                    <th>제품</th>
                    <th>금액</th>
                    <th>수량</th>
                    <th>수량단위</th>
                    <th>계약날짜</th>
                    <th>입고일</th>
                    <th>출고일</th>
                  </tr>
                </thead>
                <tbody class="tbl-content member-ETable">
                  <c:forEach var="Employee" items="${EmployeeList}">
                    <tr>
                      <td>${Employee.e_ID}</td>
                      <td>${Employee.e_NAME}</td>
                      <td>${Employee.e_ROLE}</td>
                      <td>${Employee.e_DP_NAME}</td>
                      <td>${Employee.e_PH}</td>
                      <td>${Employee.e_EMAIL}</td>
                      <td>${Employee.e_EMAIL}</td>
                      <td>${Employee.e_EMAIL}</td>
                      <td>${Employee.e_EMAIL}</td>
                      <td>${Employee.e_EMAIL}</td>
                      <td>${Employee.e_EMAIL}</td>
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

  <script>
    // 검색창
  	function search() {
      // 검색 로직 실행
  		document.getElementById('searchForm').submit();
  	}
  </script>

<%@ include file="../includes/footer.jsp" %>
