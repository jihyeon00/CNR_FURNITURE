<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ include file="../includes/header.jsp" %>
<link rel="stylesheet" href="/resources/css/itemInfo.css">
<script defer src="/resources/js/itemInfo.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-md-6">
            <h1 class="m-0"><i class="far fa-clipboard"></i> 제품 정보 관리</h1>
          </div><!-- /.col -->
<!--           <div class="col-md-6 ml-auto">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="/main">Home</a></li>
              <li class="breadcrumb-item active">제품 정보</li>
            </ol>
          </div>/.col -->
          <div class="col-md-6">         
            <div class="resetBtn">
               <a href="./itemInfo"><img class="resetPng" alt="reset" src="/resources/img/reset.png" ></a>
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
          <!-- 제품번호/명 검색창 -->
          <div class="col-md-12 itemSearchBar">
          	<form id='searchItemForm' action='./itemInfo' method='get'>
		           <div class="col-sm-1">		
		           	<select name='type'>
		           		<option value="">--선택--</option>
					    		<option value="INum"<c:out value="${itemSearch.type == 'INum' ? 'selected' : ''}" />>제품번호</option>
					    		<option value="IName"<c:out value="${itemSearch.type == 'IName' ? 'selected' : ''}" />>제품명</option>
					    		<option value="IUses"<c:out value="${itemSearch.type == 'IUses' ? 'selected' : ''}" />>제품용도</option>
		           	</select>
		           </div>
		           <div class="col-sm-1">
		             <input type="text" name='keyword' value='<c:out value="${itemSearch.keyword}"/>' />
		           </div>
		           <div class="col-sm-1">    
		             <button type="button" class="btn btn-primary search" id="searchItemBtn" name="">
		             <i class="fa-solid fa-magnifying-glass"></i>&nbsp;검색
		             </button>
		           </div>		           
		      	</form>
		      	<div class="member-btn">
             <button type="button" class="btn btn-Default" data-toggle="modal" data-target="#myModal1">제품등록</button>
            </div>
          </div>
        
       <div class="ItemTableName">
	      <div class="icon"><i class="fa fa-list"></i></div>
	      <div>제품 목록</div>
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
		        </tr>
		      </thead>
		      <tbody class="tbl-content">
		      	<c:forEach var="Item" items="${itemList}">
		        <tr>
		       		<td><c:out value="${Item.rn}" /></td>	
		          <td><c:out value="${Item.i_id}" /></td>	  
		          <td><c:out value="${Item.i_name}" /></td>
		          <td><c:out value="${Item.i_color}" /></td>
		          <td><c:out value="${Item.i_standard}" /></td>
		          <td><c:out value="${Item.i_type}" /></td>	
		          <td><c:out value="${Item.i_uses}" /></td>	
		          <td>  	
						  	<div class="modifyItem" name="modifyItem" id="modifyItem<c:out value="${Item.i_id}" />" 
						  	onClick='ItemUpdates(<c:out value="${Item.i_id}"/>)' data-toggle="modal" data-target="#myModal2"
							 	value='<c:out value="${Item.i_id}"/>' data-i-id="<c:out value="${Item.i_id}" />" >수정
								</div>										
				  		</td>			          
		        </tr>
		        </c:forEach>
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
			        <form action="./itemInsert" method="post" id="insertItemForm" onSubmit="return false">
			          <label for="modalUpdateName" class="form-label">제품명</label>
			          <input type="text" name="i_name" id="i_name" class="form-control" autocomplete="off">
			
			          <label for="modalProductAmount" class="form-label">제품 색상</label>
			          <input type="text" name="i_color" id="i_color" class="form-control" autocomplete="off">
			          
			          <label for="modalProductAmount" class="form-label">제품 규격</label>
			          <input type="text" name="i_standard" id="i_standard" class="form-control" autocomplete="off">		
			          
			          <label for="modalProductAmount" class="form-label">제품 종류</label>
			          <input type="text" name="i_type" id="i_type" class="form-control" autocomplete="off">		
			          
			          <label for="modalProductAmount" class="form-label">제품 용도</label>
			          <input type="text" name="i_uses" id="i_uses" class="form-control" autocomplete="off" placeholder="필수! 반제품 또는 완제품으로 입력해주세요">						          
			        </form>
			      </div>
			      <div class="modal-footer">
			      	<button type="submit" class="btn btn-primary" onClick="insertItemBox()">등록</button>
			       	<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
			      </div>
			    </div>
			  </div>
	</div>
  <!--============================================================== -->
	  
	<!-- 모달창 수정  -->
	<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2">
				 <div class="modal-dialog" role="document">
				   <div class="modal-content">
				      <div class="modal-header">
		        <h4 class="modal-title" id="myModalLabel">제품정보 수정</h4>
		      </div>
		      <div class="modal-body">
		        <form  action="./itemUpdate" method="post" id="itemUpdateForm"	onSubmit="return false">        	
		        	<div class="row modal-content1">
								<div class="col-md-6">
					          <label for="modalProductAmount" class="form-label">제품 번호</label>
					          <input type="text" name="i_id2" id="i_id2" value='<c:out value="${Item.i_id}" />' class="form-control" autocomplete="off" readonly>
		          	</div>
		          	<div class="col-md-6">
				          <label for="modalProductAmount" class="form-label">제품명</label>
				          <input type="text" name="i_name2" id="i_name2" value='<c:out value="${Item.i_name}" />' class="form-control" autocomplete="off">
			          </div>		
		          </div>	
							
							<div class="row modal-content2">
								<div class="col-md-6">
					          <label for="modalProductAmount" class="form-label">제품 색상</label>
					          <input type="text" name="i_color2" id="i_color2" value='<c:out value="${Item.i_color}" />' class="form-control" autocomplete="off">
		          	</div>
		          	<div class="col-md-6">
				          <label for="modalProductAmount" class="form-label">제품 규격</label>
				          <input type="text" name="i_standard2" id="i_standard2" value='<c:out value="${Item.i_standard}" />' class="form-control" autocomplete="off">
			          </div>		
		          </div>
		          
		          <div class="row modal-content3">
								<div class="col-md-6">
					          <label for="modalProductAmount" class="form-label">제품 종류</label>
					          <input type="text" name="i_type2" id="i_type2" value='<c:out value="${Item.i_type}" />' class="form-control" autocomplete="off">
		          	</div>
		          	<div class="col-md-6">
				          <label for="modalProductAmount" class="form-label">제품 용도</label>
				          <input type="text" name="i_uses2" id="i_uses2" value='<c:out value="${Item.i_uses}" />' class="form-control" autocomplete="off">
			          </div>		
		          </div>      				          
		        </form>
		      </div>				     
				     <div class="modal-footer">
				       <button type="button" class="btn btn-info" onClick="updateItemBox()">수정</button>
				       <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
				     </div>
			    </div>
			  </div>
	</div>
	<!-- 모달창 수정 끝============================ -->
															

<%@ include file="../includes/footer.jsp" %>
