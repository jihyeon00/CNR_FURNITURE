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
          <div class="col-sm-6">
            <h1 class="m-0"><i class="far fa-clipboard"></i> 제목</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="/main">Home</a></li>
              <li class="breadcrumb-item active">제목</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <div class="content">
      <div class="container-fluid">
        <div class="row">
         <!-- 검색창 -->
          <div class="col-md-12 searchBer">
            <div class="col-sm-1 sb-name">부서</div>
            <div class="col-sm-2 sb-text"><input type="text" class="col-sm-12" id="" name=""/></div>
            <div class="col-sm-1 sb-name">사원명</div>
            <div class="col-sm-2 sb-text"><input type="text" class="col-sm-12" id="" name=""/></div>
            <div class="col-sm-1 ml-auto">
              <button type="button" class="btn btn-Primary search" id="" name="">검색</button>
            </div>
          </div>
        <div class="titleAndTable">
          <div class="title">
            <i class="fa fa-list"></i>
            <span>목록입니다.</span>
            <div class="reset">
              <img alt="reset" src="/resources/img/reset.png" style="width: 20px; height: 20px;">
            </div>
          </div>
          <div class="table">
            <table cellpadding="0" cellspacing="0" border="0">
              <thead class="tbl-header">
                <tr>
                  <th>Code</th>
                  <th>안녕하세요</th>
                  <th>Price</th>
                  <th>Change</th>
                  <th>Change %</th>
                </tr>
              </thead>
              <tbody class="tbl-content">
                <tr>
                  <td>AAC</td>
                  <td>AUSTRALIAN COMPANY </td>
                  <td>$1.38</td>
                  <td>+2.01</td>
                  <td>-0.36%</td>
                </tr>
                <tr>
                  <td>AAD</td>
                  <td>AUSENCO</td>
                  <td>$2.38</td>
                  <td>-0.01</td>
                  <td>-1.36%</td>
                </tr>
                <tr>
                  <td>AAX</td>
                  <td>ADELAIDE</td>
                  <td>$3.22</td>
                  <td>+0.01</td>
                  <td>+1.36%</td>
                </tr>
                <tr>
                  <td>XXD</td>
                  <td>ADITYA BIRLA</td>
                  <td>$1.02</td>
                  <td>-1.01</td>
                  <td>+2.36%</td>
                </tr>
                <tr>
                  <td>AAC</td>
                  <td>AUSTRALIAN COMPANY </td>
                  <td>$1.38</td>
                  <td>+2.01</td>
                  <td>-0.36%</td>
                </tr>
                <tr>
                  <td>AAD</td>
                  <td>AUSENCO</td>
                  <td>$2.38</td>
                  <td>-0.01</td>
                  <td>-1.36%</td>
                </tr>
                <tr>
                  <td>AAX</td>
                  <td>ADELAIDE</td>
                  <td>$3.22</td>
                  <td>+0.01</td>
                  <td>+1.36%</td>
                </tr>
                <tr>
                  <td>XXD</td>
                  <td>ADITYA BIRLA</td>
                  <td>$1.02</td>
                  <td>-1.01</td>
                  <td>+2.36%</td>
                </tr>
                <tr>
                  <td>AAC</td>
                  <td>AUSTRALIAN COMPANY </td>
                  <td>$1.38</td>
                  <td>+2.01</td>
                  <td>-0.36%</td>
                </tr>
                <tr>
                  <td>AAD</td>
                  <td>AUSENCO</td>
                  <td>$2.38</td>
                  <td>-0.01</td>
                  <td>-1.36%</td>
                </tr>
                <tr>
                  <td>AAX</td>
                  <td>ADELAIDE</td>
                  <td>$3.22</td>
                  <td>+0.01</td>
                  <td>+1.36%</td>
                </tr>
                <tr>
                  <td>XXD</td>
                  <td>ADITYA BIRLA</td>
                  <td>$1.02</td>
                  <td>-1.01</td>
                  <td>+2.36%</td>
                </tr>
                <tr>
                  <td>AAC</td>
                  <td>AUSTRALIAN COMPANY </td>
                  <td>$1.38</td>
                  <td>+2.01</td>
                  <td>-0.36%</td>
                </tr>
              </tbody>
            </table>
            <!-- /.table -->
          </div>
	        <!-- /.titleAndTable -->
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
