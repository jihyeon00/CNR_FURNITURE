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
	          		<h1 class="m-0"><i class="far fa-clipboard"></i>생산현황</h1>
	          	</ol>
	            <ol class="breadcrumb float-sm-right">
		            <div class="reset">
			        		<img class="resetPng" alt="reset" src="/resources/img/reset.png" >
			        	</div>
	              <div class="col-sm-1 ml-auto" style="margin-left: 10px;">
	              	<button type="submit" class="btn btn-primary search-btn"
	                id="" onClick="javascript: search();"><i class="fa-solid fa-magnifying-glass"></i>검색</button>
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
               <div class="col-sm-1 sb-name">착수일</div>
               <div class="col-sm-4 sb-text" style="margin-left: 8px;">
                 <input type="date" class="col-sm-6 input-text"  id="workStartDate" name="workStartDate"
                   value='<c:out value="${search.find_emp_name}"/>' autocomplete="off" style="margin-right: 4px;"/>
                   ~
                 <input type="date" class="col-sm-6 input-text"  id="workEndDate" name="workEndDate"
                   value='<c:out value="${search.find_emp_name}"/>' autocomplete="off" style="margin-left: 4px;"/>
               </div>
             </div>
             <!-- 검색창 2줄 -->
             <div class="searchBar" style="margin-top: -12px;">
               <div class="col-sm-1 sb-name">제조<br>LOT번호</div>
                 <div class="col-sm-2 sb-text">
                 <input type="text" class="col-sm-12 input-text" id="find_DP_name" name="find_DP_name"
                   value='<c:out value="${search.find_DP_name}"/>' autocomplete="off" />
               </div>
               <div class="col-sm-1 sb-name">제품번호</div>
               <div class="col-sm-2 sb-text">
                 <input type="text" class="col-sm-12 input-text" id="find_DP_name" name="find_DP_name"
                   value='<c:out value="${search.find_DP_name}"/>' autocomplete="off" />
               </div>
               <div class="col-sm-1 sb-name">진행상황</div>
               <div class="col-sm-2 sb-text">
                 <select class="col-sm-12"  id="find_Role" name="find_Role">
	                <option value="">진행상황 선택</option>
	                <c:forEach var="list" items = "${roleList}">
	                  <option value='${list.e_ROLE}'
	                    <c:if test="${find_Role eq list.e_ROLE}">selected='selected'</c:if> >${list.e_ROLE}
	                  </option>
	                </c:forEach>
	              </select>
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
	        <!-- 공정불량실적으로 페이지 이동 버튼 -->
	        <div class="col-sm-12 todayWorkInsertBtn" style="margin-top: -20px;">
	           <button type="button" id="" class="btn btn-default search-btn" onclick="location.href='inspectionProcess'">
	            <img class="add-circle-icon" alt="add" src="/resources/img/add-circle-outline.svg" style="opacity: 0.6; width: auto;" >
	            공정불량실적으로 이동
	          </button>
	        </div><!-- /.당일작업등록 버튼 -->
	        <!-- 생산현황 Table -->
	        <div class="titleAndTable" id="selectProductionStatusTable">
	          <div class="productionTable">
	            <table cellpadding="0" cellspacing="0" border="0"  >
	              <thead class="production-tbl-header">
	                <tr>
	                  <th>No</th>
	                  <th>거래처명</th>
	                  <th>제조LOT번호</th>
	                  <th>제품번호</th>
	                  <th>제품명</th>
	                  <th>진행상황</th>
	                  <th>착수일</th>
	                  <th>완수(예정)일</th>
	                  <th>기준단위</th>
	                  <th>계획수량</th>
	                  <th>누적생산수량</th>
	                  <th>누적불량수량</th>
	                </tr>
	              </thead>
	              <tbody class="production-tbl-content">
	                <tr>
	                  <td>1</td>
	                  <td>인테리어뭐시기뭐</td>
	                  <td>300001</td>
	                  <td>10000001</td>
	                  <td>의자-A</td>
	                  <td>생산대기</td>
	                  <td>2024-04-07</td>
	                  <td>2024-04-08</td>
	                  <td>EA</td>
	                  <td>5000</td>
	                  <td>1200</td>
	                  <td>30</td>
	                </tr>
	                <tr>
	                  <td>1</td>
	                  <td>인테리어뭐시기뭐</td>
	                  <td>300001</td>
	                  <td>10000001</td>
	                  <td>의자-A</td>
	                  <td>생산대기</td>
	                  <td>2024-04-07</td>
	                  <td>2024-04-08</td>
	                  <td>EA</td>
	                  <td>5000</td>
	                  <td>1200</td>
	                  <td>30</td>
	                </tr>
	                <tr>
	                  <td>1</td>
	                  <td>인테리어뭐시기뭐</td>
	                  <td>300001</td>
	                  <td>10000001</td>
	                  <td>의자-A</td>
	                  <td>생산대기</td>
	                  <td>2024-04-07</td>
	                  <td>2024-04-08</td>
	                  <td>EA</td>
	                  <td>5000</td>
	                  <td>1200</td>
	                  <td>30</td>
	                </tr>
	                <tr>
	                  <td>1</td>
	                  <td>인테리어뭐시기뭐</td>
	                  <td>300001</td>
	                  <td>10000001</td>
	                  <td>의자-A</td>
	                  <td>생산대기</td>
	                  <td>2024-04-07</td>
	                  <td>2024-04-08</td>
	                  <td>EA</td>
	                  <td>5000</td>
	                  <td>1200</td>
	                  <td>30</td>
	                </tr>
	                <tr>
	                  <td>1</td>
	                  <td>인테리어뭐시기뭐</td>
	                  <td>300001</td>
	                  <td>10000001</td>
	                  <td>의자-A</td>
	                  <td>생산대기</td>
	                  <td>2024-04-07</td>
	                  <td>2024-04-08</td>
	                  <td>EA</td>
	                  <td>5000</td>
	                  <td>1200</td>
	                  <td>30</td>
	                </tr>
	                <tr>
	                  <td>1</td>
	                  <td>인테리어뭐시기뭐</td>
	                  <td>300001</td>
	                  <td>10000001</td>
	                  <td>의자-A</td>
	                  <td>생산대기</td>
	                  <td>2024-04-07</td>
	                  <td>2024-04-08</td>
	                  <td>EA</td>
	                  <td>5000</td>
	                  <td>1200</td>
	                  <td>30</td>
	                </tr>
	                <tr>
	                  <td>1</td>
	                  <td>인테리어뭐시기뭐</td>
	                  <td>300001</td>
	                  <td>10000001</td>
	                  <td>의자-A</td>
	                  <td>생산대기</td>
	                  <td>2024-04-07</td>
	                  <td>2024-04-08</td>
	                  <td>EA</td>
	                  <td>5000</td>
	                  <td>1200</td>
	                  <td>30</td>
	                </tr>
	                <tr>
	                  <td>1</td>
	                  <td>인테리어뭐시기뭐</td>
	                  <td>300001</td>
	                  <td>10000001</td>
	                  <td>의자-A</td>
	                  <td>생산대기</td>
	                  <td>2024-04-07</td>
	                  <td>2024-04-08</td>
	                  <td>EA</td>
	                  <td>5000</td>
	                  <td>1200</td>
	                  <td>30</td>
	                </tr>
	                <tr>
	                  <td>1</td>
	                  <td>인테리어뭐시기뭐</td>
	                  <td>300001</td>
	                  <td>10000001</td>
	                  <td>의자-A</td>
	                  <td>생산대기</td>
	                  <td>2024-04-07</td>
	                  <td>2024-04-08</td>
	                  <td>EA</td>
	                  <td>5000</td>
	                  <td>1200</td>
	                  <td>30</td>
	                </tr>
	              </tbody>
	            </table><!-- /.table -->
	       		</div><!-- /.workTable -->
	       	</div><!-- /.titleAndTable -->
					
     	</div><!-- /.row -->
   	</div><!-- /.container-fluid -->
 	</div><!-- /.content -->
 </div><!-- /.content-wrapper -->

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->
  
  <script type="text/javascript">
  	// 지시일자 value 값을 현재 날짜로 지정
	  document.getElementById('workStartDate').valueAsDate = new Date();
	  document.getElementById('workEndDate').valueAsDate = new Date();
			
		//검색창
		function search() {
	    // 검색 로직 실행
			document.getElementById('searchForm').submit();
		}
		
		
  </script>
  <script defer src="/resources/js/work.js"></script>
<%@ include file="../includes/footer.jsp" %>
