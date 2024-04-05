<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<link rel="stylesheet" href="/resources/css/bom.css">
<link rel="stylesheet" href="/resources/css/materialInfo.css">
<%@ include file="../includes/header.jsp" %>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-md-6">
            <h1 class="m-0"><i class="far fa-clipboard"></i> BOM 관리</h1>
          </div><!-- /.col -->
          <div class="col-md-6 ml-auto">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="/main">Home</a></li>
              <li class="breadcrumb-item active">BOM 정보</li>
            </ol>
          </div><!-- /.col -->
        <div class="col-md-12">
            <div class="member-btn">
              <button type="button" class="btn btn-Default"><a href="addBom" style="color: #000;">BOM 등록</a></button>
            </div>
        </div>
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <div class="content">
      <div class="container-fluid">
        <div class="row">
          <!-- 검색창 -->
          <div class="col-md-12 bomSearchBar">
             <div class="col-sm-1">
            	<select>
            		<option value="">--선택--</option>
				    		<option>제품번호</option>
				    		<option>제품명</option>
            	</select>
            </div>
            <div class="col-sm-1">
              <input type="text" id="" name="" />
            </div>
            <div class="col-sm-1 ml-auto">
              <button type="button" class="btn btn-primary search" id="" name="" style="margin: 5px;">검색</button>
            </div>
          </div>

          <div class="col-md-6">
            <!-- 사원테이블 -->
            <div class="ETableName">
              <div class="icon"><i class="fa fa-list"></i></div>
              <div class="employee">BOM 목록</div>
            </div>
            <div class="table ETable" style="height: 700px;">
              <table cellpadding="0" cellspacing="0" border="0" style="height: 700px;">
                <thead class="tbl-header">
                  <tr>
                    <th>NO</th>
                    <th>제품 번호</th>
                    <th>제품명</th>
                    <th>수정</th>
                    <th>삭제</th>
                  </tr>
                </thead>
                <tbody class="tbl-content ETable">
                  <tr>
                    <td>1</td>
                    <td>10000001</td>
                    <td>의자-A</td>
                    <td>
                    	<div class="modify-btn" data-toggle="modal" data-target="#myModal2">
							  			수정
											</div>
										</td>
                    <td class="delete-btn">삭제</td>
                  </tr>
                  <tr>
                    <td>1</td>
                    <td>10000001</td>
                    <td>의자-A</td>
                    <td>
                    	<div class="modify-btn" data-toggle="modal" data-target="#myModal2">
							  			수정
											</div>
										</td>
                    <td>삭제</td>
                  </tr>
                   <tr>
                    <td>1</td>
                    <td>10000001</td>
                    <td>의자-A</td>
                    <td>
                    	<div class="modify-btn" data-toggle="modal" data-target="#myModal2">
							  			수정
											</div>
										</td>
                    <td>삭제</td>
                  </tr>
                   <tr>
                    <td>1</td>
                    <td>10000001</td>
                    <td>의자-A</td>
                    <td>
                    	<div class="modify-btn" data-toggle="modal" data-target="#myModal2">
							  			수정
											</div>
										</td>
                    <td>삭제</td>
                  </tr>
                </tbody>
              </table>
              <!-- /.table -->
	          </div>
          </div>

          <div class="col-md-6">
            <!-- BOM 세부목록 테이블 -->
            <div class="ETableName">
              <div class="icon"><i class="fa fa-list"></i></div>
              <div class="employee">BOM 세부목록</div>
            </div>
            <div class="table" style="height: 700px;">
              <table cellpadding="0" cellspacing="0" border="0" style="height: 700px;">
                <thead class="tbl-header">
                  <tr>
                    <th>NO</th>
                    <th>자재 번호</th>
                    <th>자재명</th>
                    <th>단위</th>
                    <th>수량</th>
                  </tr>
                </thead>
                <tbody class="tbl-content">
                  <tr>
                    <td>1</td>
                    <td>20000001</td>
                    <td>소나무</td>
                    <td>m</td>
                    <td>1</td>
                  </tr>
                </tbody>
              </table>
              <!-- /.table -->
            </div>
       
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
