<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!-- stickyOnTable.css 연결 -->
<link rel="stylesheet" href="/resources/css/quality/stickyOnTable.css">
<!-- jQuery 연결 -->
<script defer src="/resources/js//quality/quality.js"></script>
<script defer src="/resources/js//quality/stickyOnTable.js"></script>

<!-- 공통 header 연결 -->
<%@ include file="../includes/header.jsp" %>



<div class="content-wrapper">
  <div class="content-header">
    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-12">
          <ol class="breadcrumb float-sm-left">
            <h1 class="m-0"><i class="far fa-clipboard"></i>&nbsp;공정불량실적</h1>
          </ol>
          <ol class="breadcrumb float-sm-right">
            <div class="reset">
              <img class="resetPng" alt="reset" src="/resources/img/reset.png" >
            </div>
            <div class="col-sm-1 ml-auto">
              <button type="submit" class="btn btn-primary defectiveProcSearchBtn" id="" onClick="javascript: search();">
                <i class="fa-solid fa-magnifying-glass"></i>&nbsp;검색
              </button>
            </div>
          </ol>
        </div><!-- /.col -->
      </div><!-- /.row -->
      <!-- 검색창 -->
      <form action="" id="defectiveProcSearchForm" class="col-md-12" onSubmit="return false">
      	<!-- 검색행1 -->
        <div class="col-md-12 defectiveProc-searchBar">
        	<!-- 불량유형 -->
          <div class="col-sm-1 defectiveProc-name" style="margin-left: -1%;">불량유형</div>
          <div class="col-sm-3 defectiveProc-text">
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
          <!-- 제품번호 -->
          <div class="col-sm-1 defectiveProc-name">생산일자</div>
          <div class="col-sm-2 defectiveProc-text">
          	<input type="date" class="col-sm-6" id="" name="" />
          	&nbsp;
          	<input type="date" class="col-sm-6" id="" name="" />
          </div><!-- /.제품번호 -->
        </div><!-- /.검색행1 -->
        <!-- 검색행2 -->
        <div class="col-md-12 defectiveProc-searchBar" style="margin-top: -7px;">
        	<!-- 제조LOT번호 -->
          <div class="col-sm-2 defectiveProc-name" style="margin-left: -1%;">제조LOT번호</div>
          <div class="col-sm-2 defectiveProc-text">
          	<input list="workCompanyNameList" class="col-sm-12"  id="workCompanyName" name="workCompanyName">
          </div><!-- /.제조LOT번호 -->
          <!-- 공정번호 -->
          <div class="col-sm-1 defectiveProc-name">공정번호</div>
          <div class="col-sm-2 defectiveProc-text">
            <input type="text" class="col-sm-12" id="find_emp_name" name="find_emp_name"
              value='<c:out value="${search.find_emp_name}"/>' autocomplete="off" />
          </div><!-- /.공정번호 -->
        	<!-- 설비번호 -->
          <div class="col-sm-1 defectiveProc-name">설비번호</div>
          <div class="col-sm-2 defectiveProc-text">
          	<input list="workCompanyNameList" class="col-sm-12"  id="workCompanyName" name="workCompanyName">
          </div><!-- /.설비번호 -->
        </div><!-- /.검색행2 -->
      </form>
    </div><!-- /.container-fluid -->
  </div><!-- /.content-header -->

	<!-- Main content -->
  <div class="content">
    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-12 defectiveProc-titleAndTable">
        	<!-- 테이블목록 title -->
        	<div class="defectiveProc-title">
            <i class="fa fa-list"></i>
            <span>공정별 불량실적목록</span>
          </div><!-- /.titleAndBtn -->
        </div><!-- /.defectiveProc-titleAndTable -->
        <div class="col-sm-12">
	        <div class="sot defectiveProc-table" data-sot-top="2" data-sot-left="4">
	        	<table cellpadding="0" cellspacing="0" border="0">
	        		<thead class="defectiveProc-table-header">
		        		<!-- 제목행 -->
		        		<tr>
		        			<th colspan="4">구분</th>
		        			<th rowspan="2" class="target-col">NO</th>
		        			<th rowspan="2">제품명</th>
		              <th rowspan="2">설비번호</th>
		              <th rowspan="2">단위</th>
		              <th rowspan="2">총생산수량</th>
		              <th rowspan="2">양품수량</th>
		              <th rowspan="2">불량수량</th>
		              <th rowspan="2" class="target-col">불량률(%)</th>
		        		</tr>
		        		<!-- 제목 열 -->
		        		<tr class="defectiveProc-table-sub-header">
		        			<th>제조LOT번호</th>
		        			<th>공정번호</th>
		        			<th>불량유형1</th>
		        			<th>불량유형2</th>
		        		</tr>
	        		</thead>
	        		<tbody class="defectiveProc-table-content">
		        		<tr>
		        			<th>LOT 1번</th>
		        			<th>공정 1번</th>
		        			<th>손상</th>
		        			<th>흠집</th>
		        			<td>1</td>
		        			<td>제품명 test</td>
		        			<td>설비1호기</td>
		        			<td>ea</td>
		        			<td>10,000</td>
		        			<td>9,999</td>
		        			<td>1</td>
		        			<td>(불량수량/양품수량) X 100</td>
		        		</tr>
		        		<tr>
		        			<th>LOT 1번</th>
		        			<th>공정 1번</th>
		        			<th>손상</th>
		        			<th>균열(갈라짐)</th>
		        			<td>2</td>
		        			<td>제품명 test2</td>
		        			<td>설비2호기</td>
		        			<td>ea</td>
		        			<td>10,000</td>
		        			<td>9,999</td>
		        			<td>1</td>
		        			<td>(불량수량/양품수량) X 100</td>
		        		</tr>
		        		
		        		<tr>
		        			<th>LOT 1번</th>
		        			<th>공정 1번</th>
		        			<th>형태변형</th>
		        			<th>휨</th>
		        			<td>3</td>
		        			<td>제품명 test2</td>
		        			<td>설비2호기</td>
		        			<td>ea</td>
		        			<td>10,000</td>
		        			<td>9,999</td>
		        			<td>1</td>
		        			<td>(불량수량/양품수량) X 100</td>
		        		</tr>
		        		<tr>
		        			<th>LOT 1번</th>
		        			<th>공정 1번</th>
		        			<th>형태변형</th>
		        			<th>꺼짐(찌그러짐)</th>
		        			<td>4</td>
		        			<td>제품명 test2</td>
		        			<td>설비2호기</td>
		        			<td>ea</td>
		        			<td>10,000</td>
		        			<td>9,999</td>
		        			<td>1</td>
		        			<td>(불량수량/양품수량) X 100</td>
		        		</tr>
		        		
		        		<tr>
		        			<th>LOT 1번</th>
		        			<th>공정 2번</th>
		        			<th>손상</th>
		        			<th>흠집</th>
		        			<td>5</td>
		        			<td>제품명 test</td>
		        			<td>설비1호기</td>
		        			<td>ea</td>
		        			<td>10,000</td>
		        			<td>9,999</td>
		        			<td>1</td>
		        			<td>(불량수량/양품수량) X 100</td>
		        		</tr>
		        		<tr>
		        			<th>LOT 1번</th>
		        			<th>공정 2번</th>
		        			<th>손상</th>
		        			<th>균열(갈라짐)</th>
		        			<td>6</td>
		        			<td>제품명 test2</td>
		        			<td>설비2호기</td>
		        			<td>ea</td>
		        			<td>10,000</td>
		        			<td>9,999</td>
		        			<td>1</td>
		        			<td>(불량수량/양품수량) X 100</td>
		        		</tr>
		        		
		        		<tr>
		        			<th>Scroll Test</th>
		        			<th>Scroll Test</th>
		        			<th>Scroll Test</th>
		        			<th>Scroll Test</th>
		        			<td>Scroll Test</td>
		        			<td>Scroll Test</td>
		        			<td>Scroll Test</td>
		        			<td>Scroll Test</td>
		        			<td>Scroll Test</td>
		        			<td>Scroll Test</td>
		        			<td>Scroll Test</td>
		        			<td>Scroll Test</td>
		        		</tr>
		        		<tr>
		        			<th>Scroll Test</th>
		        			<th>Scroll Test</th>
		        			<th>Scroll Test</th>
		        			<th>Scroll Test</th>
		        			<td>Scroll Test</td>
		        			<td>Scroll Test</td>
		        			<td>Scroll Test</td>
		        			<td>Scroll Test</td>
		        			<td>Scroll Test</td>
		        			<td>Scroll Test</td>
		        			<td>Scroll Test</td>
		        			<td>Scroll Test</td>
		        		</tr>
		        		<tr>
		        			<th>Scroll Test</th>
		        			<th>Scroll Test</th>
		        			<th>Scroll Test</th>
		        			<th>Scroll Test</th>
		        			<td>Scroll Test</td>
		        			<td>Scroll Test</td>
		        			<td>Scroll Test</td>
		        			<td>Scroll Test</td>
		        			<td>Scroll Test</td>
		        			<td>Scroll Test</td>
		        			<td>Scroll Test</td>
		        			<td>Scroll Test</td>
		        		</tr>
		        		<tr>
		        			<th>Scroll Test</th>
		        			<th>Scroll Test</th>
		        			<th>Scroll Test</th>
		        			<th>Scroll Test</th>
		        			<td>Scroll Test</td>
		        			<td>Scroll Test</td>
		        			<td>Scroll Test</td>
		        			<td>Scroll Test</td>
		        			<td>Scroll Test</td>
		        			<td>Scroll Test</td>
		        			<td>Scroll Test</td>
		        			<td>Scroll Test</td>
		        		</tr>
		        		<tr>
		        			<th>Scroll Test</th>
		        			<th>Scroll Test</th>
		        			<th>Scroll Test</th>
		        			<th>Scroll Test</th>
		        			<td>Scroll Test</td>
		        			<td>Scroll Test</td>
		        			<td>Scroll Test</td>
		        			<td>Scroll Test</td>
		        			<td>Scroll Test</td>
		        			<td>Scroll Test</td>
		        			<td>Scroll Test</td>
		        			<td>Scroll Test</td>
		        		</tr>
		        		<tr>
		        			<th>Scroll Test</th>
		        			<th>Scroll Test</th>
		        			<th>Scroll Test</th>
		        			<th>Scroll Test</th>
		        			<td>Scroll Test</td>
		        			<td>Scroll Test</td>
		        			<td>Scroll Test</td>
		        			<td>Scroll Test</td>
		        			<td>Scroll Test</td>
		        			<td>Scroll Test</td>
		        			<td>Scroll Test</td>
		        			<td>Scroll Test</td>
		        		</tr>
		        		<tr>
		        			<th>Scroll Test</th>
		        			<th>Scroll Test</th>
		        			<th>Scroll Test</th>
		        			<th>Scroll Test</th>
		        			<td>Scroll Test</td>
		        			<td>Scroll Test</td>
		        			<td>Scroll Test</td>
		        			<td>Scroll Test</td>
		        			<td>Scroll Test</td>
		        			<td>Scroll Test</td>
		        			<td>Scroll Test</td>
		        			<td>Scroll Test</td>
		        		</tr>
		        		<tr>
		        			<th>Scroll Test</th>
		        			<th>Scroll Test</th>
		        			<th>Scroll Test</th>
		        			<th>Scroll Test</th>
		        			<td>Scroll Test</td>
		        			<td>Scroll Test</td>
		        			<td>Scroll Test</td>
		        			<td>Scroll Test</td>
		        			<td>Scroll Test</td>
		        			<td>Scroll Test</td>
		        			<td>Scroll Test</td>
		        			<td>Scroll Test</td>
		        		</tr>
		        		<tr>
		        			<th>Scroll Test</th>
		        			<th>Scroll Test</th>
		        			<th>Scroll Test</th>
		        			<th>Scroll Test</th>
		        			<td>Scroll Test</td>
		        			<td>Scroll Test</td>
		        			<td>Scroll Test</td>
		        			<td>Scroll Test</td>
		        			<td>Scroll Test</td>
		        			<td>Scroll Test</td>
		        			<td>Scroll Test</td>
		        			<td>Scroll Test</td>
		        		</tr>
		        		<tr>
		        			<th>Scroll Test</th>
		        			<th>Scroll Test</th>
		        			<th>Scroll Test</th>
		        			<th>Scroll Test</th>
		        			<td>Scroll Test</td>
		        			<td>Scroll Test</td>
		        			<td>Scroll Test</td>
		        			<td>Scroll Test</td>
		        			<td>Scroll Test</td>
		        			<td>Scroll Test</td>
		        			<td>Scroll Test</td>
		        			<td>Scroll Test</td>
		        		</tr>
		        		<tr>
		        			<th>Scroll Test</th>
		        			<th>Scroll Test</th>
		        			<th>Scroll Test</th>
		        			<th>Scroll Test</th>
		        			<td>Scroll Test</td>
		        			<td>Scroll Test</td>
		        			<td>Scroll Test</td>
		        			<td>Scroll Test</td>
		        			<td>Scroll Test</td>
		        			<td>Scroll Test</td>
		        			<td>Scroll Test</td>
		        			<td>Scroll Test</td>
		        		</tr>
		        		<tr>
		        			<th>Scroll Test</th>
		        			<th>Scroll Test</th>
		        			<th>Scroll Test</th>
		        			<th>Scroll Test</th>
		        			<td>Scroll Test</td>
		        			<td>Scroll Test</td>
		        			<td>Scroll Test</td>
		        			<td>Scroll Test</td>
		        			<td>Scroll Test</td>
		        			<td>Scroll Test</td>
		        			<td>Scroll Test</td>
		        			<td>Scroll Test</td>
		        		</tr>
		        		<tr>
		        			<th>Scroll Test</th>
		        			<th>Scroll Test</th>
		        			<th>Scroll Test</th>
		        			<th>Scroll Test</th>
		        			<td>Scroll Test</td>
		        			<td>Scroll Test</td>
		        			<td>Scroll Test</td>
		        			<td>Scroll Test</td>
		        			<td>Scroll Test</td>
		        			<td>Scroll Test</td>
		        			<td>Scroll Test</td>
		        			<td>Scroll Test</td>
		        		</tr>
		        		<tr>
		        			<th>Scroll Test</th>
		        			<th>Scroll Test</th>
		        			<th>Scroll Test</th>
		        			<th>Scroll Test</th>
		        			<td>Scroll Test</td>
		        			<td>Scroll Test</td>
		        			<td>Scroll Test</td>
		        			<td>Scroll Test</td>
		        			<td>Scroll Test</td>
		        			<td>Scroll Test</td>
		        			<td>Scroll Test</td>
		        			<td>Scroll Test</td>
		        		</tr>
		        		<tr>
		        			<th>Scroll Test</th>
		        			<th>Scroll Test</th>
		        			<th>Scroll Test</th>
		        			<th>Scroll Test</th>
		        			<td>Scroll Test</td>
		        			<td>Scroll Test</td>
		        			<td>Scroll Test</td>
		        			<td>Scroll Test</td>
		        			<td>Scroll Test</td>
		        			<td>Scroll Test</td>
		        			<td>Scroll Test</td>
		        			<td>Scroll Test</td>
		        		</tr>
		        		
		        		
	        		</tbody>
	        	</table>
	        </div><!-- /.talbe-container -->
        </div>
      </div><!-- /.row -->
    </div><!-- /.container-fluid -->
  </div><!-- /.content -->
</div><!-- /.content-wrapper -->



<!-- 공통 footer 연결 -->
<%@ include file="../includes/footer.jsp" %>