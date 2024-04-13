<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ include file="../includes/header.jsp" %>
<link rel="stylesheet" href="/resources/css/materialInfo.css">
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
            <h1 class="m-0"><i class="far fa-clipboard"></i> 자재 정보 관리</h1>
          </div><!-- /.col -->
          <div class="col-md-6">         
           <div class="resetBtn">
              <a href="./materialInfo"><img class="resetPng" alt="reset" src="/resources/img/reset.png" ></a>
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
          <div class="col-md-12 materialSearchBar">
	          <form id='searchMaterialForm' action='./materialInfo' method='get'>
	            <div class="col-sm-1">
	            	<select name='type'>
	            		<option value="">--선택--</option>
					    		<option value="MNum"<c:out value="${mtSearch.type == 'MNum' ? 'selected' : ''}" />>자재번호</option>
					    		<option value="MName"<c:out value="${mtSearch.type == 'MName' ? 'selected' : ''}" />>자재명</option>
					    		<option value="MUses"<c:out value="${mtSearch.type == 'MUses' ? 'selected' : ''}" />>자재용도</option>
	            	</select>
	            </div>
	            <div class="col-sm-1">
	              <input type="text" name="keyword" value='<c:out value="${mtSearch.keyword}"/>'/>
	            </div>
	            <div class="col-sm-1">
	              <button type="button" class="btn btn-primary search" id="searchMtBtn">
	              <i class="fa-solid fa-magnifying-glass"></i>&nbsp;검색
	              </button>
            	</div>
           </form>
           <div class="bomInsert-btn">
            <button type="button" class="btn btn-Default" data-toggle="modal" data-target="#myModal1">자재등록</button>
           </div>
          </div>
        
		      <div class="ETableName">
			      <div class="icon"><i class="fa fa-list"></i></div>
			      <div class="employee">자재 목록</div>
		      </div>  
				  <div class="table ETable" style="height: 700px;">
				    <table cellpadding="0" cellspacing="0" border="0" style="height: 700px;">
				      <thead class="tbl-header">
				        <tr>
				          <th>NO</th>
				          <th>자재 번호</th>
				          <th>자재명</th>
				          <th>자재 용도</th>
				          <th>수정</th>
				        </tr>
				      </thead>
				      <tbody class="table-content">
				      	<c:forEach var="MT" items="${mtList}">
					        <tr>
					          <td><c:out value="${MT.rn}" /></td>	  
					          <td><c:out value="${MT.m_id}" /></td>
					          <td><c:out value="${MT.m_name}" /></td>
					          <td><c:out value="${MT.m_uses}" /></td>		
					          <td>  	
									  	<div class="modifyMT" name="modifyMT" id="modifyMT<c:out value="${MT.m_id}" />" 
									  	onClick='MTUpdates(<c:out value="${MT.m_id}"/>)' data-toggle="modal" data-target="#myModal2" 
									  	value='<c:out value="${MT.m_id}"/>' data-i-id="<c:out value="${MT.m_id}" />">
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
        	<h4 class="modal-title" id="myModalLabel">자재정보 등록</h4>
	      </div>
	      <div class="modal-body">
	        <form action="./materialInsert" method="post" id="insertMTForm" onSubmit="return false">
	          <label for="modalUpdateName" class="form-label">자재명</label>
	          <input type="text" name="m_name" id="m_name" class="form-control" autocomplete="off">
	
	          <label for="modalProductAmount" class="form-label">자재 용도</label>
	          <input type="text" name="m_uses" id="m_uses" class="form-control" autocomplete="off"
	          placeholder="필수! 원자재, 부자재 또는 반제품으로 입력해주세요">     
	        </form>
	      </div>
	      <div class="modal-footer">
	      	<button type="button" class="btn btn-primary" onClick="insertMTBox()">등록</button>
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
       <h4 class="modal-title" id="myModalLabel">자재정보 수정</h4>
     </div>
     <div class="modal-body">
       <form action="./materialUpdate" method="post" id="mtUpdateForm"	onSubmit="return false">	        	
         <label for="modalProductAmount" class="form-label">자재 번호</label>
         <input type="text" name="m_id2" id="m_id2" class="form-control" autocomplete="off" readonly>

         <label for="modalProductAmount" class="form-label">자재명</label>
         <input type="text" name="m_name2" id="m_name2" class="form-control" autocomplete="off">

         <label for="modalProductAmount" class="form-label">자재 용도</label>
         <input type="text" name="m_uses2" id="m_uses2" class="form-control" autocomplete="off">	          				          
       </form>
     </div>				     
	     <div class="modal-footer">
	       <button type="button" class="btn btn-info" onClick="updateMTBox()">수정</button>
	       <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
	     </div>
    	</div>
  	</div>
	</div>
	<!-- 모달창 수정 끝============================ -->
																
								
<%@ include file="../includes/footer.jsp" %>

<script>

	/*자재 검색*/

	let searchMaterialForm = $("#searchMaterialForm");
   	$("#searchMaterialForm button").on("click",
        function(e) {
            if (!searchMaterialForm.find("option:selected").val()) {
                alert("검색종류를 선택하세요");
                return false;
            }

            if (!searchMaterialForm.find("input[name='keyword']").val()) {
                alert("키워드를 입력하세요");
                return false;
            }

            e.preventDefault();

            searchMaterialForm.submit();
        });
    
  /* 자재 등록시 사용  */
	function checkAllFields() {
	    return ($('#m_name').val() && $('#m_uses').val());
	}
	
	
	function insertMTBox() {
		
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
			      document.getElementById('insertMTForm').submit();
			  }, 2000); // 2초 후에 폼 제출
		      }else if (result.isDismissed) { // 만약 모달창에서 cancel 버튼을 눌렀다면
			  Swal.fire('게시가 취소되었습니다.', '', 'info');
		       }
		   });
		
		} 	   
	
    
  /* 수정시 사용  */
 	function updateMTBox() {		   
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
	   	         document.getElementById('mtUpdateForm').submit();
	   	        }, 2000); // 2초 후에 폼 제출
	   	    } else if (result.isDismissed) { // 만약 모달창에서 cancel 버튼을 눌렀다면
	   	        Swal.fire('수정 취소되었습니다.', '', 'info');
						}
	   	    
	    });   
	}
    
 /* 수정할 ID 값을 모달창으로 불러오기  */
  function MTUpdates(m_id) {
    $.get("/materialUpdate/"+m_id , function(result) {
        console.log("itemUpdate:", result);

        $('#m_id2').val(result.m_id);
        $('#m_name2').val(result.m_name);
        $('#m_uses2').val(result.m_uses);

      }).fail(function(xhr, status, err){
          console.log("materialUpdate err:", err);
      });
}
 
 
</script>
