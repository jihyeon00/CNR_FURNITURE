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
            <h1 class="m-0"><i class="far fa-clipboard"></i>&nbsp;수주정보조회</h1>
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
      <div class="row itemContractInfo-search-row">
        <div class="col-sm-12 itemContractInfo-searchBar">
          <!-- 계약번호 -->
          <div class="col-sm-1 itemContractInfo-search-title first-search-col">계약번호</div>
          <div class="col-sm-2 itemContractInfo-search-content first-search-col">
            <input type="text" class="col-sm-12" id="" name="" />
          </div><!-- /.계약번호 -->
          <!-- 수주일자 -->
          <div class="col-sm-1 itemContractInfo-search-title">수주일자</div>
          <div class="col-sm-2 itemContractInfo-search-content">
          	<input type="date" class="col-sm-12" id="" name="" />
          </div><!-- /.수주일자 -->
          <!-- 제품번호 -->
          <div class="col-sm-1 itemContractInfo-search-title">제품번호</div>
          <div class="col-sm-2 itemContractInfo-search-content">
            <select class="col-sm-12" aria-label="Default select example">
              <option selected>제품번호 선택</option>
              <option value="1">One</option>
              <option value="2">Two</option>
              <option value="3">Three</option>
            </select>
          </div><!-- /.제품번호 -->
        </div><!-- /.searchBar -->
      </div><!-- /.row -->
    </div><!-- /.container-fluid -->
  </div><!-- /.content-header -->

	<!-- Main content -->
  <div class="content">
    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-12 itemContractInfo-titleAndTable">
        	<!-- 테이블목록 title -->
        	<div class="row itemContractInfo-titleAndBtn">
	          <div class="col-sm-9 itemContractInfo-title">
	            <i class="fa fa-list"></i>
	            <span>수주정보목록</span>
	          </div><!-- /.테이블목록 title -->
          </div><!-- /.row -->
          <!-- 제품테이블 -->
          <div class="col-sm-12">
            <div class="table itemContractInfo-table">
              <table cellpadding="0" cellspacing="0" border="0">
                <thead class="table-header itemContractInfo-table-header">
                  <tr>
                    <th>No</th>
                    <th>계약번호</th>
                    <th>거래처명</th>
                    <th>수주일자</th>
                    <th>입고일자</th>
                    <th>제품명</th>
                    <th>계약수량</th>
                    <th>단위</th>
                    <th>단가(₩)</th>
                    <th>합계(₩)</th>
                  </tr>
                </thead>
                <tbody class="table-content itemContractInfo-table-content">
                  <tr>
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
                  </tr>
                  <tr>
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
                  </tr>
                  <tr>
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
                  </tr>
                  <tr>
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
                  </tr>
                  <tr>
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
                  </tr>
                  <tr>
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
