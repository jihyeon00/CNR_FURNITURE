<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ include file="../includes/header.jsp" %>
<link rel="stylesheet" href="/resources/css/materialInfo.css">


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
        <div class="row mb-3">
          <div class="col-sm-5">
            <div class="m-search">
            	<select style="padding: 5px;">
            		<option value="">--선택--</option>
				    <option>자재번호</option>
				    <option>자재명</option>
            	</select>
            	<input type="text" style="padding: 5px;"/>
            	<button style="padding: 5px;">조회</button>
            </div>
          </div><!-- /.col -->
          <div class="col-sm-2">
          	<!-- ===================================== -->
			<!-- <button type="button" class="btn btn-block btn-primary">자재등록</button> -->
			<!-- Button trigger modal -->
			<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
			  자재등록
			</button>
			
			<!-- Modal -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
			  <div class="modal-dialog" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			        <h4 class="modal-title" id="myModalLabel">Modal title</h4>
			      </div>
			      <div class="modal-body">
			        ...
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			        <button type="button" class="btn btn-primary">Save changes</button>
			      </div>
			    </div>
			  </div>
			</div>
			<!-- ===================================== -->
			
			
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <div class="content">
      <div class="container-fluid">
        <div class="row">
		  <div class="table" style="height: 700px;">
		    <table cellpadding="0" cellspacing="0" border="0" style="height: 700px;">
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
		          <td class="modify">수정</td>
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
