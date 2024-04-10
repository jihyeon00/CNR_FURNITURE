<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!-- stickyOnTable.css 연결 -->
<link rel="stylesheet" href="/resources/css/quality/stickyOnTable.css">
<!-- jQuery 연결 -->
<script defer src="/resources/js//quality/defectiveItem.js"></script>
<script defer src="/resources/js//quality/stickyOnTable.js"></script>

<!-- 공통 header 연결 -->
<%@ include file="../includes/header.jsp" %>



<div class="content-wrapper">
  <div class="content-header">
    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-12">
          <ol class="breadcrumb float-sm-left">
            <h1 class="m-0"><i class="far fa-clipboard"></i>&nbsp;제품불량실적</h1>
          </ol>
          <ol class="breadcrumb float-sm-right">
            <div class="reset">
              <img class="resetPng" alt="reset" src="/resources/img/reset.png" >
            </div>
            <div class="col-sm-1 ml-auto">
              <button type="submit" class="btn btn-primary defectiveItemSearchBtn" id="" onClick="javascript: search();">
                <i class="fa-solid fa-magnifying-glass"></i>&nbsp;검색
              </button>
            </div>
          </ol>
        </div><!-- /.col -->
      </div><!-- /.row -->
      <!-- 검색창 -->
      <form action="" id="defectiveItemSearchForm" class="col-md-12" onSubmit="return false">
      	<!-- 검색행1 -->
        <div class="col-md-12 defectiveItem-searchBar">
        	<!-- 불량유형 -->
          <div class="col-sm-1 defectiveItem-name" style="margin-left: -1%;">불량유형</div>
          <div class="col-sm-3 defectiveItem-text">
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
          <!-- 생산일자 -->
          <div class="col-sm-1 defectiveItem-name">생산일자</div>
          <div class="col-sm-2 defectiveItem-text">
          	<input type="date" class="col-sm-6" id="" name="" />
          	&nbsp;
          	<input type="date" class="col-sm-6" id="" name="" />
          </div><!-- /.생산일자 -->
          <!-- 제조LOT번호 -->
          <div class="col-sm-2 defectiveItem-name">제조LOT번호</div>
          <div class="col-sm-2 defectiveItem-text">
          	<input list="workCompanyNameList" class="col-sm-12"  id="workCompanyName" name="workCompanyName">
          </div><!-- /.제조LOT번호 -->
        </div><!-- /.검색행1 -->
      </form><!-- /.검색창 -->
    </div><!-- /.container-fluid -->
  </div><!-- /.content-header -->

	<!-- Main content -->
  <div class="content">
    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-12 defectiveItem-titleAndTable">
        	<!-- 테이블목록 title -->
        	<div class="defectiveItem-title">
            <i class="fa fa-list"></i>
            <span>공정별 불량실적목록</span>
          </div><!-- /.titleAndBtn -->
        </div><!-- /.defectiveItem-titleAndTable -->
        
        <!-- 평균불량률 총계 -->
        <div class="col-sm-12 total-defect-avg">
        	<div class="defect-title">평균불량률 총계(%)</div>
        	<div class="col-sm-1 defect-text">숫자숫자</div>
        </div><!-- /.평균불량률 총계 -->
        
        <div class="col-sm-12">
	        <div class="sot defectiveItem-table" data-sot-top="2" data-sot-left="2">
	        	<table cellpadding="0" cellspacing="0" border="0">
	        		<thead class="defectiveItem-table-header">
		        		<!-- 제목 -->
		        		<tr>
						      <th colspan="2">구분</th>
						      <th rowspan="2">NO</th>
						      <th colspan="2">생산일자</th>
						      <th colspan="5">제조LOT번호별 불량률(%)</th>
						      <th rowspan="2">평균불량률(%)</th>
						    </tr>
						    <tr>
						      <th>불량유형1</th>
						      <th>불량유형2</th>
						      <th>생산착수일</th>
						      <th>생산완수일</th>
						      <th>라인1</th>
						      <th>라인2</th>
						      <th>라인3</th>
						      <th>라인4</th>
						      <th>라인5</th>
						    </tr>
	        		</thead>
	        		<tbody class="defectiveItem-table-content">
	        			<!-- 유형1: 손상 -->
	        			<tr>
						      <th rowspan="4">손상</th>
						      <th>균열(갈라짐)</th>
						      <td>1</td>
						      <td>날짜1</td>
						      <td>날짜1</td>
						      <td>라인1 불량률</td>
						      <td>라인2 불량률</td>
						      <td>라인3 불량률</td>
						      <td>라인4 불량률</td>
						      <td>라인5 불량률</td>
						      <td>평균 불량률1</td>
						      <!-- 나머지 셀들 -->
						    </tr>
						    <tr>
						      <th>파손</th>
						      <td>2</td>
						      <td>날짜2</td>
						      <td>날짜2</td>
						      <td>라인1 불량률</td>
						      <td>라인2 불량률</td>
						      <td>라인3 불량률</td>
						      <td>라인4 불량률</td>
						      <td>라인5 불량률</td>
						      <td>평균 불량률2</td>
						      <!-- 나머지 셀들 -->
						    </tr>
						    <tr>
						      <th>찍힘</th>
						      <td>3</td>
						      <td>날짜3</td>
						      <td>날짜3</td>
						      <td>라인1 불량률</td>
						      <td>라인2 불량률</td>
						      <td>라인3 불량률</td>
						      <td>라인4 불량률</td>
						      <td>라인5 불량률</td>
						      <td>평균 불량률3</td>
						      <!-- 나머지 셀들 -->
						    </tr>
						    <tr>
						    	<th></th>
						      <th colspan="3">평균불량률 소계(%)</th>
						      <td>라인1 불량률 소계</td>
						      <td>라인2 불량률 소계</td>
						      <td>라인3 불량률 소계</td>
						      <td>라인4 불량률 소계</td>
						      <td>라인5 불량률 소계</td>
						      <td>유형1 전체 평균불량률</td>
						    </tr><!-- /.유형1: 손상 -->
						    
						    <!-- 유형1: 형태변형 -->
	        			<tr>
						      <th rowspan="4">형태변형</th>
						      <th>휨</th>
						      <td>4</td>
						      <td>날짜1</td>
						      <td>날짜1</td>
						      <td>라인1 불량률</td>
						      <td>라인2 불량률</td>
						      <td>라인3 불량률</td>
						      <td>라인4 불량률</td>
						      <td>라인5 불량률</td>
						      <td>평균 불량률1</td>
						    </tr>
						    <tr>
						      <th>꺼짐(찌그러짐)</th>
						      <td>5</td>
						      <td>날짜2</td>
						      <td>날짜2</td>
						      <td>라인1 불량률</td>
						      <td>라인2 불량률</td>
						      <td>라인3 불량률</td>
						      <td>라인4 불량률</td>
						      <td>라인5 불량률</td>
						      <td>평균 불량률2</td>
						    </tr>
						    <tr>
						      <th>찍힘</th>
						      <td>6</td>
						      <td>날짜3</td>
						      <td>날짜3</td>
						      <td>라인1 불량률</td>
						      <td>라인2 불량률</td>
						      <td>라인3 불량률</td>
						      <td>라인4 불량률</td>
						      <td>라인5 불량률</td>
						      <td>평균 불량률3</td>
						    </tr>
						    <tr>
						    	<th></th>
						      <th colspan="3">평균불량률 소계(%)</th>
						      <td>라인1 불량률 소계</td>
						      <td>라인2 불량률 소계</td>
						      <td>라인3 불량률 소계</td>
						      <td>라인4 불량률 소계</td>
						      <td>라인5 불량률 소계</td>
						      <td>유형1 전체 평균불량률</td>
						    </tr><!-- /.유형1: 형태변형 -->
						    
						    <!-- 유형1: test -->
	        			<tr>
						      <th rowspan="4">test</th>
						      <th>test</th>
						      <td>7</td>
						      <td>날짜1</td>
						      <td>날짜1</td>
						      <td>라인1 불량률</td>
						      <td>라인2 불량률</td>
						      <td>라인3 불량률</td>
						      <td>라인4 불량률</td>
						      <td>라인5 불량률</td>
						      <td>평균 불량률1</td>
						    </tr>
						    <tr>
						      <th>test</th>
						      <td>8</td>
						      <td>날짜2</td>
						      <td>날짜2</td>
						      <td>라인1 불량률</td>
						      <td>라인2 불량률</td>
						      <td>라인3 불량률</td>
						      <td>라인4 불량률</td>
						      <td>라인5 불량률</td>
						      <td>평균 불량률2</td>
						    </tr>
						    <tr>
						      <th>test</th>
						      <td>9</td>
						      <td>날짜3</td>
						      <td>날짜3</td>
						      <td>라인1 불량률</td>
						      <td>라인2 불량률</td>
						      <td>라인3 불량률</td>
						      <td>라인4 불량률</td>
						      <td>라인5 불량률</td>
						      <td>평균 불량률3</td>
						    </tr>
						    <tr>
						    	<th></th>
						      <th colspan="3">평균불량률 소계(%)</th>
						      <td>라인1 불량률 소계</td>
						      <td>라인2 불량률 소계</td>
						      <td>라인3 불량률 소계</td>
						      <td>라인4 불량률 소계</td>
						      <td>라인5 불량률 소계</td>
						      <td>유형1 전체 평균불량률</td>
						    </tr><!-- /.유형1: test -->
						    <!-- 다른 불량유형 행들 -->	        		
		        		
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