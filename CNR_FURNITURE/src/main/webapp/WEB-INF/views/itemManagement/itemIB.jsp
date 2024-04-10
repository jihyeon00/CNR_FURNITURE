<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!-- jQuery 연결 -->
<script defer src="/resources/js/itemMNG.js"></script>

<!-- 공통 header 연결 -->
<%@ include file="../includes/header.jsp" %>

<div class="content-wrapper">
  <div class="content-header">
    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-12">
          <ol class="breadcrumb float-sm-left">
            <h1 class="m-0"><i class="far fa-clipboard"></i>&nbsp;제품입고현황</h1>
          </ol>
          <ol class="breadcrumb float-sm-right">
            <div class="reset">
              <img class="resetPng" alt="reset" src="/resources/img/reset.png" >
            </div>
            <div class="col-sm-1 ml-auto">
              <button type="submit" class="btn btn-primary search-btn" id="" onClick="javascript: search();">
                <i class="fa-solid fa-magnifying-glass"></i>&nbsp;검색
              </button>
            </div>
          </ol>
        </div><!-- /.col -->
      </div><!-- /.row -->
      <!-- 검색창 -->
      <form action="" id="itemIBSearchForm" class="col-md-12" onSubmit="return false">
      	<!-- 검색행1 -->
        <div class="itemIB-searchBar">
        	<!-- 제조LOT번호 -->
          <div class="col-sm-2 itemIB-name">제조LOT번호</div>
          <div class="col-sm-2 itemIB-text">
          	<input list="workCompanyNameList" class="col-sm-12"  id="workCompanyName" name="workCompanyName">
          </div><!-- /.제조LOT번호 -->
        	<!-- 입고일자 -->
          <div class="col-sm-1 itemIB-name">입고일자</div>
          <div class="col-sm-2 itemIB-text">
          	<input type="date" class="col-sm-12" id="" name=""/>
          </div><!-- /.입고일자 -->
          <div class="col-sm-4"></div>
        </div><!-- /.검색행1 -->
        <!-- 검색행2 -->
        <div class="itemIB-searchBar" style="margin-top: -7px;">
        	<!-- 제품번호 -->
        	<div class="col-sm-1 itemIB-name">제품번호</div>
        	<div class="col-sm-2 itemIB-text">
        		<input list="workCompanyNameList" class="col-sm-12"  id="workCompanyName" name="workCompanyName">
        	</div><!-- /.제품번호 -->
        	<div class="col-sm-1"></div>
        	<!-- 제품용도 -->
        	<div class="col-sm-1 itemIB-name">제품용도</div>
        	<div class="col-sm-2 itemIB-text">
        		<select class="col-sm-12" aria-label="Default select example">
              <option selected>제품용도 선택</option>
              <option value="1">One</option>
              <option value="2">Two</option>
              <option value="3">Three</option>
            </select>
        	</div><!-- /.제품용도 -->
        </div><!-- /.검색행2 -->
      </form><!-- /.검색창 -->
      
    </div><!-- /.container-fluid -->
  </div><!-- /.content-header -->

	<!-- Main content -->
  <div class="content">
    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-12 itemIB-titleAndTable">
          <div class="itemIB-title">
            <i class="fa fa-list"></i>
            <span>제품입고목록</span>
          </div>
          <!-- 제품테이블 -->
          <div class="col-sm-12">
            <div class="itemIB-table">
              <table cellpadding="0" cellspacing="0" border="0">
                <thead class="itemIB-table-header">
                  <tr class="itemIB-table-subHeader">
                  	<th rowspan="2">제품용도</th>
                    <th>No</th>
                    <th>제조LOT번호</th>
                    <th>공정번호</th>
                    <th>설비번호</th>
                    <th>제품번호</th>
                    <th>제품명</th>
                    <th>입고일자</th>
                    <th>불량등록일자</th>
                    <th>총생산수량</th>
                    <th>양품수량</th>
                    <th>불량수량</th>
                    <th>불량률(%)</th>
                  </tr>
                </thead>
                <tbody class="itemIB-table-content">
                	<!-- 반제품 title -->
                  <tr>
                    <th rowspan="4" class="itemIB-table-header semiItemIB-header">반제품</th>
                  </tr>
                  <tr>
                    <!-- 반제품 1행 -->
                    <td>1열</td>
										<td>2열</td>
										<td>3열</td>
										<td>4열</td>
										<td>5열</td>
										<td>6열</td>
										<td>7열</td>
										<td>8열dddddddddddddd</td>
										<td>9열</td>
										<td>10열</td>
										<td>11열</td>
										<td>12열</td>
                  </tr>
                  <tr>
                    <!-- 반제품 2행 -->
                    <td>1열</td>
										<td>2열</td>
										<td>3열</td>
										<td>4열</td>
										<td>5열</td>
										<td>6열</td>
										<td>7열</td>
										<td>8열</td>
										<td>9열</td>
										<td>10열</td>
										<td>11열</td>
										<td>12열</td>
                  </tr>
                  <tr>
                    <!-- 반제품 3행 -->
                    <td>1열</td>
										<td>2열</td>
										<td>3열</td>
										<td>4열</td>
										<td>5열</td>
										<td>6열</td>
										<td>7열</td>
										<td>8열</td>
										<td>9열</td>
										<td>10열</td>
										<td>11열</td>
										<td>12열</td>
                  </tr>
                  <tr>
                    <th rowspan="4" class="itemIB-table-header finishedItemIB-header">완제품</th>
                  </tr>
                  <tr>
                    <!-- 완제품 1행 -->
                    <td>1열</td>
										<td>2열</td>
										<td>3열</td>
										<td>4열</td>
										<td>5열</td>
										<td>6열</td>
										<td>7열</td>
										<td>8열</td>
										<td>9열</td>
										<td>10열</td>
										<td>11열</td>
										<td>12열</td>
                  </tr>
                  <tr>
                    <!-- 완제품 2행 -->
                    <td>1열</td>
										<td>2열</td>
										<td>3열</td>
										<td>4열</td>
										<td>5열</td>
										<td>6열</td>
										<td>7열</td>
										<td>8열</td>
										<td>9열</td>
										<td>10열</td>
										<td>11열</td>
										<td>12열</td>
                  </tr>
                  <tr>
                    <!-- 완제품 3행 -->
                    <td>1열</td>
										<td>2열</td>
										<td>3열</td>
										<td>4열</td>
										<td>5열</td>
										<td>6열</td>
										<td>7열</td>
										<td>8열</td>
										<td>9열</td>
										<td>10열</td>
										<td>11열</td>
										<td>12열</td>
                  </tr>
                  <!-- 추가적인 행들 -->
                </tbody>
              </table>
              <!-- /.table -->
            </div>
          </div><!-- /.col-sm-11 -->
        </div><!-- /.col-sm-12 -->
      </div><!-- /.row -->
    </div><!-- /.container-fluid -->
  </div><!-- /.content -->
</div><!-- /.content-wrapper -->

<!-- 공통 footer 연결 -->
<%@ include file="../includes/footer.jsp" %>
