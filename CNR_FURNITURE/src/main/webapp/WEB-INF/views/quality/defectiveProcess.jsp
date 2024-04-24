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
	<!-- 검색 Form -->
	<form action="/inspectionOB" id="searchInspOB" name="searchInspOB" class="col-md-12" method="get">
	  <div class="content-header">
	    <div class="container-fluid">
	      <div class="row mb-2">
	        <div class="col-sm-12">
	          <ol class="breadcrumb float-sm-left">
	            <h1 class="m-0"><i class="far fa-clipboard"></i>&nbsp;공정불량실적</h1>
	          </ol>
	          <ol class="breadcrumb float-sm-right">
	            <div class="reset">
	            	<a href="/quality/inspectionOB">
	              	<img class="resetPng" alt="reset" src="/resources/img/reset.png" >
	              </a>
	            </div>[]
	            <div class="col-sm-1 ml-auto">
	              <button type="submit" class="btn btn-primary search-btn" id="" onClick="javascript: search();">
	                <i class="fa-solid fa-magnifying-glass"></i>&nbsp;검색
	              </button>
	            </div>
	          </ol>
	        </div><!-- /.col -->
	      </div><!-- /.row -->
	      <!-- 검색창 -->
	     	<!-- 검색행1 -->
	       <div class="inspection-searchBar">
	       	<!-- 제조LOT번호 -->
	         <div class="col-sm-2 inspection-name">제조LOT번호</div>
	         <div class="col-sm-2 inspection-text">
	         	<input type="search" list="lotIDList" class="col-sm-12"  id="lotID" name="lotID" value="${cri.lotID}">
	         	<datalist id="lotIDList">
	         		<c:forEach items="${lotIDList}" var="lot">
								<option value='${lot.lotID}'
                	<c:if test="${cri.lotID == lot.lotID}">selected</c:if> >${lot.lotID}
								</option>
							</c:forEach>
	         	</datalist>
	         </div><!-- /.제조LOT번호 -->
	         <!-- 공정번호 -->
	         <div class="col-sm-1 inspection-name">공정번호</div>
	         <div class="col-sm-2 inspection-text">
	         	<input type="search" list="processIDList" class="col-sm-12" id="processID" name="processID" value="${cri.processID}">
	         	<datalist id="processIDList">
	         		<c:forEach items="${processIDList}" var="proc">
								<option value='${proc.processID}'
                	<c:if test="${cri.processID == proc.processID}">selected</c:if> >${proc.processID}
								</option>
							</c:forEach>
	         	</datalist>
	         </div><!-- /.공정번호 -->
	       </div><!-- /.검색행1 -->
	       <!-- 검색행2 -->
	       <div class="inspection-searchBar" style="margin-top: -7px;">
	       	<!-- 불량유형 -->
	         <div class="col-sm-1 inspection-name">불량유형</div>
	         <div class="col-sm-3 inspection-text">
	         	<!-- 불량유형1 -->
	         	<select class="col-sm-6"  id="qsDiv1" name="qsDiv1">
	         		<option value="">불량유형1 선택</option>
	            <c:forEach items="${qsDiv1List}" var="qsDiv1s">
	            	<option value='${qsDiv1s.qsDiv1}'
                	<c:if test="${cri.qsDiv1 == qsDiv1s.qsDiv1}">selected</c:if> >${qsDiv1s.qsDiv1}
								</option>
							</c:forEach>
	          </select><!-- /.불량유형1 -->
	          &nbsp;
	          <!-- 불량유형2 -->
	          <select class="col-sm-6"  id="qsDiv2" name="qsDiv2">
	            <option value="">불량유형2 선택</option>
	            <c:forEach items="${qsDiv2List}" var="qsDiv2s">
								<option value='${qsDiv2s.qsDiv2}'
                	<c:if test="${cri.qsDiv2 == qsDiv2s.qsDiv2}">selected</c:if> >${qsDiv2s.qsDiv2}
								</option>
							</c:forEach>
	          </select><!-- /.불량유형2 -->
	         </div><!-- /.불량유형 -->
	         <!-- 검사일자 -->
	         <div class="col-sm-1 inspection-name">검사일자</div>
	         <div class="col-sm-3 inspection-text">
	         	<input type="date" class="col-sm-6" id="inspectionDate1" name="inspectionDate1" value='${cri.inspectionDate1}' />
	         	&nbsp;
	         	<input type="date" class="col-sm-6" id="inspectionDate2" name="inspectionDate2" value='${cri.inspectionDate2}' />
	         </div><!-- /.검사일자 -->
	       </div><!-- /.검색행2 -->


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
		        			<c:forEach var="def" items="${defectiveProcessList}">
			        		<tr>
			        			<th><fmt:formatNumber value="${def.lotID}" pattern="#,##0" /></th>
			        			<th><fmt:formatNumber value="${def.processID}" pattern="#,##0" /></th>
			        			<th><c:out value="${def.qsDiv1}" /></th>
			        			<th><c:out value="${def.qsDiv2}" /></th>
			        			
			        			<td><fmt:formatNumber value="${def.listSeq}" pattern="#,##0" /></td>
			        			<td><c:out value="${def.productName}" /></td>
			        			<td><c:out value="${def.unit}" /></td>
			        			<td><fmt:formatNumber value="${def.totalWorkQuantity}" pattern="#,##0" /></td>
			        			<td><fmt:formatNumber value="${def.totalGoodQuantity}" pattern="#,##0" /></td>
			        			<td><fmt:formatNumber value="${def.totalDefectQuantity}" pattern="#,##0" /></td>
			        			<td><fmt:formatNumber value="${def.defectRate}" pattern="#,###0.000"/></td>
			        		</tr>
			        		</c:forEach>
			        		
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