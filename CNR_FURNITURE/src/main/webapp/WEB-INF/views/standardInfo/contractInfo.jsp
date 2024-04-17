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
            <h1 class="m-0"><i class="far fa-clipboard"></i> 계약관리</h1>
          </div><!-- /.col -->
          <div class="col-md-6 ml-auto">
            <ol class="breadcrumb float-sm-right">
              <div class="sb-btns">
                <button type="button" class="btn btn-reset" id="" onClick="location.href='/contractInfo'">
                  <img class="resetPng" alt="reset" id="btn-reset" src="/resources/img/reset.png" >
                </button>
                <button type="submit" class="btn btn-primary" id=""
                  onClick="javascript: search();">
                  <i class="fa-solid fa-magnifying-glass"></i>&nbsp;검색</button>
              </div>
            </ol>
          </div><!-- /.col -->
        </div>
        <div class="row mb-2" style="margin-top: -20px;">
          <!-- 검색창 -->
          <form action="" id="searchForm" class="col-md-12" method='get' onSubmit="return false">
            <!-- 검색행1 -->
            <div class="searchBar">
              <!-- 거래처명 -->
              <div class="col-sm-1 sb-name" style="">거래처명</div>
              <div class="col-sm-3 sb-text">
                <input list="companyList" class="col-sm-12 input-companyList" name="find_name" id="find_name"
                  value='<c:out value="${search.find_name}" />'>
                <datalist id="companyList">
                  <c:forEach var="list" items = "${CompanyNameList}">
                    <option value='${list.c_NAME}'label='${list.c_NAME}'>
                    </option>
                  </c:forEach>
                </datalist>
              </div><!-- /.거래처명 -->
              <!-- 자재명/번호 -->
              <div class="col-sm-2 sb-name">자재명/번호</div>
              <div class="col-sm-2 sb-text">
                <input list="materialList" class="col-sm-12 input-companyList" name="find_material" id="find_material"
                  value='<c:out value="${search.find_material}" />'>
                <datalist id="materialList">
                  <c:forEach var="materialList" items = "${materialList}">
                    <option value='${materialList.m_id}'label='${materialList.m_name}'>
                    </option>
                  </c:forEach>
                </datalist>
              </div><!-- /.자재명/번호 -->
              <!-- 입고일 -->
              <div class="col-sm-1 sb-name">입고일</div>
              <div class="col-sm-3 sb-text">
                <input type="date" class="col-sm-6" value='<c:out value="${search.find_ib_start_Date}" />'
                    id="find_ib_start_Date" name="find_ib_start_Date">~
                <input type="date" class="col-sm-6" value='<c:out value="${search.find_ib_end_Date}" />'
                    id="find_ib_end_Date" name="find_ib_end_Date">
              </div><!-- /.입고일 -->
            </div><!-- /.검색행1 -->
            <!-- 검색행2 -->
            <div class="searchBar" style="margin-top: -12px;">
              <!-- 계약날짜 -->
              <div class="col-sm-1 sb-name" style="">계약날짜</div>
              <div class="col-sm-3 sb-text">
                <input type="date" class="col-sm-6" value='<c:out value="${search.find_contract_start_date}" />'
                    id="find_contract_start_date" name="find_contract_start_date">
                <input type="date" class="col-sm-6" value='<c:out value="${search.find_contract_end_date}" />'
                    id="find_contract_end_date" name="find_contract_end_date">
              </div><!-- /.계약날짜 -->
              <!-- 제품명/번호 -->
              <div class="col-sm-2 sb-name">제품명/번호</div>
              <div class="col-sm-2 sb-text">
                <input list="itemList" class="col-sm-12 input-companyList" name="find_item" id="find_item"
                  value='<c:out value="${search.find_item}" />'>
                <datalist id="itemList">
                  <c:forEach var="itemList" items = "${itemList}">
                    <option value='${itemList.itemId}'label='${itemList.itemName}'>
                    </option>
                  </c:forEach>
                </datalist>
              </div><!-- /.제품명/번호 -->
              <!-- 출고일 -->
              <div class="col-sm-1 sb-name">출고일</div>
              <div class="col-sm-3 sb-text">
                <input type="date" class="col-sm-6" value='<c:out value="${search.find_ob_start_Date}" />'
                    id="find_ob_start_Date" name="find_ob_start_Date"> ~
                <input type="date" class="col-sm-6" value='<c:out value="${search.find_ob_end_Date}" />'
                    id="find_ob_end_Date" name="find_ob_end_Date">
              </div><!-- /.출고일 -->
            </div><!-- /.검색행2 -->
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
            <div class="ETableTitle" style="margin-top: -15px;">
              <div class="icon"><i class="fa fa-list"></i></div>
              <div class="employee">계약목록</div>
            </div>
            <div class="table member-ETable">
              <table cellpadding="0" cellspacing="0" border="0">
                <colgroup>
                  <col style="width: %" />
                  <col style="width: %" />
                  <col style="width: %" />
                  <col style="width: %" />
                  <col style="width: %" />
                  <col style="width: %" />
                  <col style="width: %" />
                  <col style="width: %" />
                  <col style="width: %" />
                  <col style="width: %" />
                  <col style="width: %" />
                </colgroup>
                <thead class="tbl-header">
                  <tr>
                    <th>No</th>
                    <th>구분</th>
                    <th>거래처명</th>
                    <th>자재</th>
                    <th>제품</th>
                    <th>금액</th>
                    <th>수량</th>
                    <th>수량단위</th>
                    <th>계약날짜</th>
                    <th>입고일</th>
                    <th>출고일</th>
                  </tr>
                </thead>
                <tbody class="tbl-content member-ETable">
                  <c:forEach var="Contract" items="${ContractList}">
                    <tr>
                      <td>${Contract.id}</td>
                      <td>${Contract.c_div}</td>
                      <td>${Contract.company_name}</td>
                      <td>${Contract.material_name}</td>
                      <td>${Contract.item_name}</td>
                      <td>${Contract.money}</td>
                      <td>${Contract.quantity}</td>
                      <td>${Contract.unit}</td>
                      <td>${Contract.c_date}</td>
                      <td>${Contract.ib_date}</td>
                      <td>${Contract.ob_date}</td>
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
