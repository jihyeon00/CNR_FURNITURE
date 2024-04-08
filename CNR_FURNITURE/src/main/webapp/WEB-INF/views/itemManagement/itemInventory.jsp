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
            <h1 class="m-0"><i class="far fa-clipboard"></i>&nbsp;제품재고조회</h1>
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
      <div class="row itemInventory-search-row">
        <div class="col-sm-12 itemInventory-searchBar">
          <!-- 제품번호 -->
          <div class="col-sm-1 itemInventory-search-title first-search-col">제품번호</div>
          <div class="col-sm-2 itemInventory-search-content first-search-col">
            <select class="col-sm-12" aria-label="Default select example">
              <option selected>제품번호 선택</option>
              <option value="1">One</option>
              <option value="2">Two</option>
              <option value="3">Three</option>
            </select>
          </div><!-- /.제품번호 -->
          <!-- 제품명 -->
          <div class="col-sm-1 itemInventory-search-title">제품명</div>
          <div class="col-sm-2 itemInventory-search-content">
            <input type="text" class="col-sm-12" id="" name="" />
          </div><!-- /.제품용도 -->
          <!-- 제품용도 -->
          <div class="col-sm-1 itemInventory-search-title">제품용도</div>
          <div class="col-sm-2 itemInventory-search-content">
            <select class="col-sm-12" aria-label="Default select example">
              <option selected>제품용도 선택</option>
              <option value="1">One</option>
              <option value="2">Two</option>
              <option value="3">Three</option>
            </select>
          </div><!-- /.제품용도 -->
        </div><!-- /.searchBar -->
      </div><!-- /.row -->
    </div><!-- /.container-fluid -->
  </div><!-- /.content-header -->

	<!-- Main content -->
  <div class="content">
    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-12 itemInventory-titleAndTable">
        	<!-- 테이블목록 title -->
        	<div class="row itemInventory-titleAndBtn">
	          <div class="col-sm-9 itemInventory-title">
	            <i class="fa fa-list"></i>
	            <span>제품재고목록</span>
	          </div><!-- /.테이블목록 title -->
          </div><!-- /.row -->
          <!-- 제품테이블 -->
          <div class="col-sm-12">
            <div class="itemInventory-table">
              <table cellpadding="0" cellspacing="0" border="0">
                <thead class="itemInventory-table-header">
                  <tr class="itemInventory-table-subHeader">
                  	<th rowspan="2">제품용도</th>
                    <th>No</th>
                    <th>제품번호</th>
                    <th>제품용도</th>
                    <th>제품규격</th>
                    <th>제품명</th>
                    <th>단위</th>
                    <th>재고수량</th>
                  </tr>
                </thead>
                <tbody class="itemInventory-table-content">
                	<!-- 반제품 title -->
                  <tr>
                    <th rowspan="4" class="itemInventory-table-header semiItemIB-header">반제품</th>
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
                  </tr>
                	<!-- 완제품 title -->
                  <tr>
                    <th rowspan="4" class="itemInventory-table-header finishedItemIB-header">완제품</th>
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
