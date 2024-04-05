<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ include file="../includes/header.jsp" %>
<link rel="stylesheet" href="/resources/css/itemInfo.css">
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
						  	<div class="modifyItem" data-toggle="modal" data-target="#myModal2" data-i-id="<c:out value="${Item.i_id}" />">
							 	수정
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

	  
	<!-- 모달창 수정  -->
	<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2">
				 <div class="modal-dialog" role="document">
				   <div class="modal-content">
				      <div class="modal-header">
		        <h4 class="modal-title" id="myModalLabel">제품정보 수정</h4>
		      </div>
		      <div class="modal-body">
		        <form  action="./itemUpdate" method="post" id="insertUpdateForm"	onSubmit="return false">        	
		        	<div class="row modal-content1">
								<div class="col-md-6">
					          <label for="modalProductAmount" class="form-label">제품 번호</label>
					          <input type="text" name="i_id" id="i_id" value='<c:out value="${Item.i_id}" />' class="form-control" autocomplete="off" readonly>
		          	</div>
		          	<div class="col-md-6">
				          <label for="modalProductAmount" class="form-label">제품명</label>
				          <input type="text" name="i_name" id="i_name" value='<c:out value="${Item.i_name}" />' class="form-control" autocomplete="off">
			          </div>		
		          </div>	
							
							<div class="row modal-content2">
								<div class="col-md-6">
					          <label for="modalProductAmount" class="form-label">제품 색상</label>
					          <input type="text" name="i_color" id="i_color" value='<c:out value="${Item.i_color}" />' class="form-control" autocomplete="off">
		          	</div>
		          	<div class="col-md-6">
				          <label for="modalProductAmount" class="form-label">제품 규격</label>
				          <input type="text" name="i_standard" id="i_standard" value='<c:out value="${Item.i_standard}" />' class="form-control" autocomplete="off">
			          </div>		
		          </div>
		          
		          <div class="row modal-content3">
								<div class="col-md-6">
					          <label for="modalProductAmount" class="form-label">제품 종류</label>
					          <input type="text" name="i_type" id="i_type" value='<c:out value="${Item.i_type}" />' class="form-control" autocomplete="off">
		          	</div>
		          	<div class="col-md-6">
				          <label for="modalProductAmount" class="form-label">제품 용도</label>
				          <input type="text" name="i_uses" id="i_uses" value='<c:out value="${Item.i_uses}" />' class="form-control" autocomplete="off">
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

<script>

/*등록시 사용  */
	function checkAllFields() {
	    return ($('#i_name').val() && $('#i_color').val() && $('#i_standard').val() && $('#i_type').val() && $('#i_uses').val());
	}
	
	
	function insertItemBox() {
		   console.log($('#i_name').val());
		
		     if (!checkAllFields()) {
				Swal.fire({
				    title: '입력 오류',
				    text: '모든 정보를 입력하세요.',
				    icon: 'error',
				    confirmButtonColor: '#48088A'
				});
				return;
			    }
		
			 // 사용자가 등록을 원하는지 확인하는 창 표시 
		       Swal.fire({
			 title: '정말 게시하겠습니까?',
			 text: '게시후 삭제할 수 없습니다.',
			 icon: 'warning',
			
			 showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
			 confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
			 cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
			 confirmButtonText: '확인', // confirm 버튼 텍스트 지정
			 cancelButtonText: '취소', // cancel 버튼 텍스트 지정                      
			 reverseButtons: true, // 버튼 순서 거꾸로
			
		   }).then(result => {
		      if (result.isConfirmed) {
			  Swal.fire('게시가 완료되었습니다.', '', 'success');
			  setTimeout(function() {
			      document.getElementById('insertItemForm').submit();
			  }, 2000); // 2초 후에 폼 제출
		      }else if (result.isDismissed) { // 만약 모달창에서 cancel 버튼을 눌렀다면
			  Swal.fire('게시가 취소되었습니다.', '', 'info');
		       }
		   });
		
		} 	
	
/* 수정할 ID 값을 모달창으로 불러오기  */
	document.addEventListener('DOMContentLoaded', function() {
	    const modifyItemDiv = document.querySelector('.modifyItem');

	    if (modifyItemDiv) {
	        modifyItemDiv.addEventListener('click', function(event) {
	            // 클릭한 요소에서 data-i-id 속성 값 가져오기
	            const itemId = event.currentTarget.dataset.iId;
	            
	            if (itemId) {
	                console.log('클릭한 아이템의 ID:', itemId);

	                // 여기서 모달 열기 등의 추가 동작 수행 가능
	                $('#myModal2').modal('show');
	            } else {
	                console.error('아이템 ID를 가져오는 데 실패했습니다.');
	            }
	        });
	    }
	});
	
/* 수정시 사용  */
 	function updateItemBox() {
		   console.log($('#i_id').val());
		   
	 Swal.fire({
	   	    title: '수정 하시겠습니까?',
	   	    text: '',
	   	    icon: 'warning',
	   	    showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
	   	    confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
	   	    cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
	   	    confirmButtonText: '확인', // confirm 버튼 텍스트 지정
	   	    cancelButtonText: '취소', // cancel 버튼 텍스트 지정                      
	   	    reverseButtons: true, // 버튼 순서 거꾸로
	   	}).then(result => {
	   	    if (result.isConfirmed) {
	   	        Swal.fire('수정 되었습니다.', '', 'success');
	   	        setTimeout(function() {
	   	         document.getElementById('insertUpdateForm').submit();
	   	        }, 2000); // 2초 후에 폼 제출
	   	    } else if (result.isDismissed) { // 만약 모달창에서 cancel 버튼을 눌렀다면
	   	        Swal.fire('수정 취소되었습니다.', '', 'info');
						}
	   	    
	    });   
	}
</script>