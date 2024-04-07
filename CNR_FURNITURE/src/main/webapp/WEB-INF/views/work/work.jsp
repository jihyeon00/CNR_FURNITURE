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
         <form action="" id="searchForm" class="col-md-12" onSubmit="return false">
	          <div class="col-sm-12" >
	          	<ol class="breadcrumb float-sm-left">
	          		<h1 class="m-0"><i class="far fa-clipboard"></i>작업관리</h1>
	          	</ol>
	            <ol class="breadcrumb float-sm-right">
		            <div class="reset">
			        		<img class="resetPng" alt="reset" src="/resources/img/reset.png" >
			        	</div>
	              <div class="col-sm-1 ml-auto">
	              	<button type="submit" class="btn btn-primary search-btn"
	                id="" onClick="javascript: search();"><i class="fa-solid fa-magnifying-glass"></i>&nbsp;검색</button>
	            	</div>
	            </ol>
	          </div><!-- /.col -->
	          <br>
          	<!-- 검색창 1줄 -->
             <div class="searchBar">
               <div class="col-sm-1 sb-name">거래처명</div>
               <div class="col-sm-2 sb-text">
                 <input list="workCompanyNameList" class="col-sm-12"  id="workCompanyName" name="workCompanyName">
                 <datalist id="workCompanyNameList">
                   <c:forEach var="list" items = "${roleList}">
                     <option value='${list.e_ROLE}'
                       <c:if test="${find_Role eq list.e_ROLE}">selected='selected'</c:if> >${list.e_ROLE}
                     </option>
                   </c:forEach>
                  </datalist>
               </div>
               <div class="col-sm-1 sb-name">제품명</div>
               <div class="col-sm-2 sb-text">
                 <input list="workItemNameList" class="col-sm-12"  id="workItemName" name="workItemName">
                 <datalist id="workItemNameList">
                   <c:forEach var="list" items = "${roleList}">
                     <option value='${list.e_ROLE}'
                       <c:if test="${find_Role eq list.e_ROLE}">selected='selected'</c:if> >${list.e_ROLE}
                     </option>
                   </c:forEach>
                 </datalist>
               </div>
               <div class="col-sm-1 sb-name">지시일자</div>
               <div class="col-sm-2 sb-text" style="margin-left: 4px;">
                 <input type="date" class="col-sm-6"  id="workDate1" name="workDate1"
                   value='<c:out value="${search.find_emp_name}"/>' autocomplete="off" />
                   ~
                 <input type="date" class="col-sm-6"  id="workDate2" name="workDate2"
                   value='<c:out value="${search.find_emp_name}"/>' autocomplete="off" />
               </div>
             </div>
             <!-- 검색창 2줄 -->
             <div class="searchBar" style="margin-top: -12px;">
               <div class="col-sm-1 sb-name">제조LOT번호</div>
                 <div class="col-sm-2 sb-text">
                 <input type="text" class="col-sm-12" id="find_DP_name" name="find_DP_name"
                   value='<c:out value="${search.find_DP_name}"/>' autocomplete="off" />
               </div>
               <div class="col-sm-1 sb-name">공정번호</div>
               <div class="col-sm-2 sb-text">
                 <input type="text" class="col-sm-12" id="find_DP_name" name="find_DP_name"
                   value='<c:out value="${search.find_DP_name}"/>' autocomplete="off" />
               </div>
               <div class="col-sm-1 sb-name">작업번호</div>
               <div class="col-sm-2 sb-text">
                 <input type="text" class="col-sm-12" id="find_emp_name" name="find_emp_name"
                   value='<c:out value="${search.find_emp_name}"/>' autocomplete="off" />
               </div>
             </div>
           </form>
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <div class="content">
      <div class="container-fluid">
        <div class="row">
        <!-- Table -->
        <div class="titleAndTable">
           <div class="workTableTitle">
              <div class="icon"><i class="fa fa-list"></i></div>
              <div class="workTableName">목록입니다.</div>
            </div>
          <div class="table">
            <table cellpadding="0" cellspacing="0" border="0">
              <thead class="tbl-header">
                <tr>
                  <th>No</th>
                  <th>제조LOT번호</th>
                  <th>제품번호</th>
                  <th>제품명</th>
                  <th>수주업체</th>
                  <th>착수일</th>
                  <th>완수(예정)일</th>
                  <th>진행상황</th>
                  <th>계획수량</th>
                  <th>단위</th>
                  <th>누적생산수량</th>
                  <th>누적불량수량</th>
                </tr>
              </thead>
              <tbody class="tbl-content">
                <tr>
                  <td>AAC</td>
                  <td>AUSTRALIAN COMPANY </td>
                  <td>$1.38</td>
                  <td>+2.01</td>
                  <td>-0.36%</td>
                  <td>-0.36%</td>
                  <td>-0.36%</td>
                  <td>-0.36%</td>
                  <td>-0.36%</td>
                  <td>-0.36%</td>
                  <td>-0.36%</td>
                  <td>-0.36%</td>
                </tr>
              </tbody>
            </table>
            <!-- /.table -->
          </div>
	        <!-- /.titleAndTable -->
	        
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
  
  <script type="text/javascript">
  	// 지시일자 value 값을 현재 날짜로 지정
	  document.getElementById('workDate1').valueAsDate = new Date();
	  document.getElementById('workDate2').valueAsDate = new Date();
		//페이지가 로드될 때
	  window.onload = function() {
		}
		//검색창
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
