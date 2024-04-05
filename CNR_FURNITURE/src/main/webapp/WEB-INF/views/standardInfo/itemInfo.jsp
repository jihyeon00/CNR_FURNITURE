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
          <div class="col-md-6">
            <h1 class="m-0"><i class="far fa-clipboard"></i> 제품 정보 관리</h1>
          </div><!-- /.col -->
          <div class="col-md-6 ml-auto">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="/main">Home</a></li>
              <li class="breadcrumb-item active">제품 정보</li>
            </ol>
          </div><!-- /.col -->
        <div class="col-md-12">
            <div class="member-btn">
              <button type="button" class="btn btn-Default" data-toggle="modal" data-target="#myModal1">제품등록</button>
            </div>
        </div>
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->
    </div>

    <!-- Main content -->
    <div class="content">
      <div class="container-fluid">
        <div class="row">
          <!-- 검색창 -->
          <div class="col-md-12 searchBar">
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
        
       <div class="ETableName">
	      <div class="icon"><i class="fa fa-list"></i></div>
	      <div class="employee">제품 목록</div>
      </div>    
		  <div class="table" style="height: 700px;">
		    <table cellpadding="0" cellspacing="0" border="0" style="height: 700px;">
		      <thead class="tbl-header">
		        <tr>
		          <th>NO</th>
		          <th>제품 번호</th>
		          <th>제품명</th>
		          <th>제품 색상</th>
		          <th>제품 규격</th>
		          <th>제품 종류</th>
		          <th>제품 용도</th>
		          <th>수정</th>
		          <th>삭제</th>
		        </tr>
		      </thead>
		      <tbody class="tbl-content">
		        <tr>
		          <td>1</td>	  
		          <td>10000001</td>
		          <td>의자-A</td>
		          <td>무색</td>
		          <td>성인용</td>	
		          <td>의자</td>	
		          <td>완제품</td>	
		          <td>  	
						  	<div class="modify-btn" data-toggle="modal" data-target="#myModal2">
							  수정
								</div>
				  		</td>			
		          <td>X</td>		          
		        </tr>
		        
		       <tr>
		          <td>1</td>	  
		          <td>10000001</td>
		          <td>의자-A</td>
		          <td>무색</td>
		          <td>성인용</td>	
		          <td>의자</td>	
		          <td>완제품</td>	
		          <td>  	
						  	<div class="modify-btn" data-toggle="modal" data-target="#myModal2">
							  수정
								</div>
				  		</td>			
		          <td>X</td>		          
		        </tr>
		        <tr>
		          <td>1</td>	  
		          <td>10000001</td>
		          <td>의자-A</td>
		          <td>무색</td>
		          <td>성인용</td>	
		          <td>의자</td>	
		          <td>완제품</td>	
		          <td>  	
						  	<div class="modify-btn" data-toggle="modal" data-target="#myModal2">
							  수정
								</div>
				  		</td>			
		          <td>X</td>		          
		        </tr>
		        <tr>
		          <td>1</td>	  
		          <td>10000001</td>
		          <td>의자-A</td>
		          <td>무색</td>
		          <td>성인용</td>	
		          <td>의자</td>	
		          <td>완제품</td>	
		          <td>  	
						  	<div class="modify-btn" data-toggle="modal" data-target="#myModal2">
							  수정
								</div>
				  		</td>			
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
  </div>

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->
  
  <!-- 모달창 등록  -->
	<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1">
			  <div class="modal-dialog" role="document">
				  <div class="modal-content">
				    <div class="modal-header">
		        	<h4 class="modal-title" id="myModalLabel">제품정보 등록</h4>
			      </div>
			      <div class="modal-body">
			        <form id="materialModify-form">
			          <label for="modalUpdateName" class="form-label">제품명</label>
			          <input type="text" name="modalUpdateName" id="modalUpdateName" class="form-control" autocomplete="off">
			
			          <label for="modalProductAmount" class="form-label">제품 색상</label>
			          <input type="text" name="modalProductAmount" id="modalProductAmount" class="form-control" autocomplete="off">
			          
			          <label for="modalProductAmount" class="form-label">제품 규격</label>
			          <input type="text" name="modalProductAmount" id="modalProductAmount" class="form-control" autocomplete="off">		
			          
			          <label for="modalProductAmount" class="form-label">제품 종류</label>
			          <input type="text" name="modalProductAmount" id="modalProductAmount" class="form-control" autocomplete="off">		
			          
			          <label for="modalProductAmount" class="form-label">제품 용도</label>
			          <input type="text" name="modalProductAmount" id="modalProductAmount" class="form-control" autocomplete="off">						          
			        </form>
			      </div>
			      <div class="modal-footer">
			      	<button type="button" class="btn btn-primary">등록</button>
			       	<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
			      </div>
			    </div>
			  </div>
	</div>

	  
	<!-- 모달창 수정  -->
	<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2">
				 <div class="modal-dialog" role="document">
				   <div class="modal-content">
				      <div class="modal-header">
		        <h4 class="modal-title" id="myModalLabel">제품정보 수정</h4>
		      </div>
		      <div class="modal-body">
		        <form id="materialModify-form">
		        	
		        	<div class="row modal-content1">
								<div class="col-md-6">
					          <label for="modalProductAmount" class="form-label">제품 번호</label>
					          <input type="text" name="" id="" class="form-control" autocomplete="off" readonly>
		          	</div>
		          	<div class="col-md-6">
				          <label for="modalProductAmount" class="form-label">제품명</label>
				          <input type="text" name="" id="" class="form-control" autocomplete="off">
			          </div>		
		          </div>	
							
							<div class="row modal-content2">
								<div class="col-md-6">
					          <label for="modalProductAmount" class="form-label">제품 색상</label>
					          <input type="text" name="" id="" class="form-control" autocomplete="off">
		          	</div>
		          	<div class="col-md-6">
				          <label for="modalProductAmount" class="form-label">제품 규격</label>
				          <input type="text" name="" id="" class="form-control" autocomplete="off">
			          </div>		
		          </div>
		          
		          <div class="row modal-content3">
								<div class="col-md-6">
					          <label for="modalProductAmount" class="form-label">제품 종류</label>
					          <input type="text" name="" id="" class="form-control" autocomplete="off">
		          	</div>
		          	<div class="col-md-6">
				          <label for="modalProductAmount" class="form-label">제품 용도</label>
				          <input type="text" name="" id="" class="form-control" autocomplete="off">
			          </div>		
		          </div>
		          				          
		        </form>
		      </div>				     
				     <div class="modal-footer">
				       <button type="button" class="btn btn-info">수정</button>
				       <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
				     </div>
			    </div>
			  </div>
	</div>
	<!-- 모달창 수정 끝============================ -->
								
								
								
								

<%@ include file="../includes/footer.jsp" %>