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
            <h1 class="m-0">자재 정보 관리</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="/main">Home</a></li>
              <li class="breadcrumb-item active">자재 목록</li>
            </ol>
          </div><!-- /.col -->       
        </div><!-- /.row -->
        <br/>
        <div class="row mb-2">
          <div class="col-sm-6">
            <div class="m-search">
            	<div>자재 번호/명</div>
            	<input type="text" />
            	<button>조회</button>
            </div>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <div class="m-0">자재 등록 +</div>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <div class="content">
      <div class="container-fluid">
        <div class="row">
		  <div class="table">
		    <table cellpadding="0" cellspacing="0" border="0">
		      <thead class="tbl-header">
		        <tr>
		          <th>NO</th>
		          <th>자재 번호</th>
		          <th>자재명</th>
		          <th>자재 용도</th>
		          <th>수정</th>
		          <th>삭제</th>
		        </tr>
		      </thead>
		      <tbody class="tbl-content">
		        <tr>
		          <td>1</td>
		          <td>20000001</td>
		          <td>소나무</td>
		          <td>원자재</td>
		          <td>수정</td>
		          <td>X</td>
		        </tr>
		         <tr>
		          <td>1</td>
		          <td>20000001</td>
		          <td>소나무</td>
		          <td>원자재</td>
		          <td>수정</td>
		          <td>X</td>
		        </tr>
		         <tr>
		          <td>1</td>
		          <td>20000001</td>
		          <td>소나무</td>
		          <td>원자재</td>
		          <td>수정</td>
		          <td>X</td>
		        </tr>
	         </tbody>
			</table>
			<!-- /.table -->
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
