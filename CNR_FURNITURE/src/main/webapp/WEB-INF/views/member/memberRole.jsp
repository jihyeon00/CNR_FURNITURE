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
            <h1 class="m-0"><i class="far fa-clipboard"></i> 사용자별 권한 관리</h1>
          </div><!-- /.col -->
          <div class="col-md-6 ml-auto">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="/main">Home</a></li>
              <li class="breadcrumb-item active">권한관리</li>
            </ol>
          </div><!-- /.col -->
        <div class="col-md-12">
            <div class="member-btn">
              <button type="button" class="btn btn-info">권한변경</button>
              <button type="button" class="btn btn-default"
                data-toggle="modal" data-target="#addMember">사원등록</button>
            </div>
        </div>
        <!-- 검색창 -->
        <form action="" id="searchForm" class="col-md-12" onSubmit="return false">
          <div class="col-md-12 searchBer">
            <div class="col-sm-1 sb-name">권한</div>
            <div class="col-sm-2 sb-text">
              <select class="col-sm-12"  id="find_Role" name="find_Role">
                <option value="">권한 선택</option>
                <c:forEach var="list" items = "${roleList}">
                  <option value='${list.e_ROLE}'
                    <c:if test="${find_Role eq list.e_ROLE}">selected='selected'</c:if> >${list.e_ROLE}
                  </option>
                </c:forEach>
              </select>
            </div>
            <div class="col-sm-1 sb-name">부서</div>
            <div class="col-sm-2 sb-text">
              <input type="text" class="col-sm-12" id="find_DP_name" name="find_DP_name"
                value='<c:out value="${search.find_DP_name}"/>' autocomplete="off" />
            </div>
            <div class="col-sm-1 sb-name">사원명</div>
            <div class="col-sm-2 sb-text">
              <input type="text" class="col-sm-12" id="find_emp_name" name="find_emp_name"
                value='<c:out value="${search.find_emp_name}"/>' autocomplete="off" />
            </div>
            <div class="col-sm-1 ml-auto">
              <button type="submit" class="btn btn-primary search-btn"
                id="" onClick="javascript: search();">검색</button>
            </div>
          </div>
        </form>
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
            <div class="table ETable">
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
                <tbody class="tbl-content ETable">
                  <c:forEach var="Employee" items="${EmployeeList}">
                    <tr>
                      <td></td>
                      <td>${Employee.e_ID}</td>
                      <td>${Employee.e_NAME}</td>
                      <td>${Employee.e_ROLE}</td>
                      <td>${Employee.e_DP_NAME}</td>
                      <td>${Employee.e_PH}</td>
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


  <!-- 사원등록 모달 -->
  <div class="modal fade" id="addMember" tabindex="-1" role="dialog" aria-labelledby="addMemberModalLabel">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title" id="addMemberModalLabel">사원등록</h4>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        </div>
        <div class="modal-body">
          ...
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-primary">등록</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
        </div>
      </div>
    </div>
  </div>


  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->

  <script>
    // 페이지가 로드될 때
    window.onload = function() {
        // 이전에 선택된 권한 값 가져오기
        var selectedRole = localStorage.getItem('selectedRole');
        // 선택된 권한 값이 존재하면 드롭다운에 설정
        if (selectedRole) {
            document.getElementById('find_Role').value = selectedRole;
        }
    }
    // 검색창
  	function search() {
  	  // 현재 선택된 권한 값 가져오기
      var selectedRole = document.getElementById('find_Role').value;
      // 선택된 권한 값을 로컬 스토리지에 저장
      localStorage.setItem('selectedRole', selectedRole);
      // 검색 로직 실행
  		document.getElementById('searchForm').submit();
  	}
  </script>

<%@ include file="../includes/footer.jsp" %>
