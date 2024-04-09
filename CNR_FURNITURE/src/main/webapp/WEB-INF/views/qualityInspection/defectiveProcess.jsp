<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!-- jQuery 연결 -->
<script defer src="/resources/js/quality.js"></script>

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
          <div class="col-sm-1 defectiveProc-name">제품번호</div>
          <div class="col-sm-2 defectiveProc-text">
          	<input list="workCompanyNameList" class="col-sm-12"  id="workCompanyName" name="workCompanyName">
          </div><!-- /.제품번호 -->
          <!-- 제품명 -->
          <div class="col-sm-1 defectiveProc-name">제품명</div>
          <div class="col-sm-2 defectiveProc-text">
          	<input list="workCompanyNameList" class="col-sm-12"  id="workCompanyName" name="workCompanyName">
          </div><!-- /.제품명 -->
        </div><!-- /.검색행1 -->
        <!-- 검색행2 -->
        <div class="col-md-12 defectiveProc-searchBar" style="margin-top: -7px;">
        	<!-- 제조LOT번호 -->
          <div class="col-sm-2 defectiveProc-name" style="margin-left: -1%;">제조LOT번호</div>
          <div class="col-sm-2 defectiveProc-text">
          	<input list="workCompanyNameList" class="col-sm-12"  id="workCompanyName" name="workCompanyName">
          </div><!-- /.제조LOT번호 -->
        	<!-- 작업번호 -->
          <div class="col-sm-1 defectiveProc-name">작업번호</div>
          <div class="col-sm-2 defectiveProc-text">
          	<input list="workCompanyNameList" class="col-sm-12"  id="workCompanyName" name="workCompanyName">
          </div><!-- /.작업번호 -->
          <!-- 공정번호 -->
          <div class="col-sm-1 defectiveProc-name">공정번호</div>
          <div class="col-sm-2 defectiveProc-text">
            <input type="text" class="col-sm-12" id="find_emp_name" name="find_emp_name"
              value='<c:out value="${search.find_emp_name}"/>' autocomplete="off" />
          </div><!-- /.공정번호 -->
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
        	<div class="defectiveProc-titleAndBtn">
	          <div class="col-sm-9 defectiveProc-title">
	            <i class="fa fa-list"></i>
	            <span>공정별 불량실적목록</span>
	          </div><!-- /.테이블목록 title -->
          </div><!-- /.titleAndBtn -->
          <!-- 제품테이블 -->
          <div class="col-sm-12">
            <div class="defectiveProc-table">
              <table cellpadding="0" cellspacing="0" border="0">
                <thead class="defectiveProc-table-header">
                  <tr>
                    <th>No</th>
                    <th>제품번호</th>
                    <th>제조LOT번호</th>
                    <th>공정번호</th>
                    <th>작업번호</th>
                    <th>제품명</th>
                    <th>단위</th>
                    <th>일일총작업수량</th>
                    <th>양품수량</th>
                    <th>불량수량</th>
                    <th>불량유형1</th>
                    <th>불량유형2</th>
                    <th>불량등록일자</th>
                    <th>비고</th>
                    <th>수정</th>
                    <th>삭제</th>
                  </tr>
                </thead>
                <tbody class="defectiveProc-table-content">
                  <tr>
                    <td>1열</td>
										<td>2열</td>
										<td>3열</td>
										<td>4열</td>
										<td>5열</td>
										<td>6열ddddddddddddddddddddddddddddddddd</td>
										<td>7열</td>
										<td>8열</td>
										<td>9열</td>
										<td>10열dddddddddddddddddddddddddddddddddddddddddddd</td>
										<td>11열</td>
										<td>12열</td>
										<td>13열</td>
										<td>14열</td>
										<td class="edit-defectiveProc-row" onclick="editDefectiveProcRow(this);" style="color:#17a2b8;">
											수정
										</td>
										<td class="remove-defectiveProc-row" onclick="editDefectiveProcRow(this);" style="color:#c82333;">
											삭제
										</td>
                  </tr>
                  <tr>
                    <td>1열</td>
										<td>2열</td>
										<td>3열</td>
										<td>4열</td>
										<td>5열</td>
										<td>6열ddddddddddddddddddddddddddddddddd</td>
										<td>7열</td>
										<td>8열</td>
										<td>9열</td>
										<td>10열dddddddddddddddddddddddddddddddddddddddddddd</td>
										<td>11열</td>
										<td>12열</td>
										<td>13열</td>
										<td>14열</td>
										<td class="edit-defectiveProc-row" onclick="editDefectiveProcRow(this);" style="color:#17a2b8;">
											수정
										</td>
										<td class="remove-defectiveProc-row" onclick="editDefectiveProcRow(this);" style="color:#c82333;">
											삭제
										</td>
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
