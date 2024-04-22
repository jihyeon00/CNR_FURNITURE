<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<script defer src="/resources/js/memberSearch.js"></script>

<%@ include file="../includes/header.jsp" %>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-md-6">
            <h1 class="m-0"><i class="far fa-clipboard"></i> 거래처관리</h1>
          </div><!-- /.col -->
          <div class="col-md-6 ml-auto">
            <ol class="breadcrumb float-sm-right">
              <div class="member-btn">
              </div>
            </ol>
          </div><!-- /.col -->
        </div>
        <div class="row">
          <!-- 검색창 -->
          <form action="" id="searchForm" class="col-md-12" onSubmit="return false">
            <div class="searchBer">
              <div class="col-sm-1 sb-name">거래처유형</div>
              <div class="col-sm-2 sb-text">
                <select class="col-sm-12"  id="find_c_div" name="find_c_div">
                  <option value="">발주/수주</option>
                  <option value='발주업체' <c:if test="${search.find_c_div == '발주업체'}">selected</c:if>>발주업체</option>
                  <option value='수주업체' <c:if test="${search.find_c_div == '수주업체'}">selected</c:if>>수주업체</option>
                </select>
              </div>
              <div class="col-sm-1 sb-name">거래처명</div>
              <div class="col-sm-2 sb-text">
                <input list="companyList" class="col-sm-12 input-companyList" name="find_c_name" id="find_c_name"
                  value='<c:out value="${search.find_c_name}" />'>
                <datalist id="companyList">
                  <c:forEach var="list" items = "${CompanyNameList}">
                    <option value='${list.c_NAME}'label='${list.c_NAME}'>
                    </option>
                  </c:forEach>
                </datalist>
              </div>
              <div class="col-sm-6">
                <div class="sb-btns">
                  <button type="button" class="btn btn-reset" id="" onClick="location.href='/standardInfo/companyInfo'">
                    <img class="resetPng" alt="reset" id="btn-reset" src="/resources/img/reset.png" >
                  </button>
                  <button type="submit" class="btn btn-primary" id=""
                    onClick="javascript: search();">
                    <i class="fa-solid fa-magnifying-glass"></i>&nbsp;검색</button>
                </div>
              </div>
            </div>
          </form>
        </div>
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
              <div class="employee">거래처목록</div>
            </div>
            <div class="table member-ETable">
              <table cellpadding="0" cellspacing="0" border="0">
                <colgroup>
                  <col style="width: 13%" />
                  <col style="width: 15%" />
                  <col style="width: 12%" />
                  <col style="width: 12%" />
                  <col style="width: 23%" />
                  <col style="width: 25%" />
                </colgroup>
                <thead class="tbl-header">
                  <tr>
                    <th>거래처번호</th>
                    <th>거래처명</th>
                    <th>거래처유형</th>
                    <th>연락처</th>
                    <th>이메일</th>
                    <th>주소</th>
                  </tr>
                </thead>
                <tbody class="tbl-content member-ETable">
                  <c:forEach var="List" items="${CompanyList}">
                    <tr>
                      <td>${List.c_ID}</td>
                      <td>${List.c_NAME}</td>
                      <td>${List.c_DIV}</td>
                      <td>${List.c_PH}</td>
                      <td>${List.c_EMAIL}</td>
                      <td>${List.c_ADDRESS}</td>
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


  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->


<%@ include file="../includes/footer.jsp" %>
