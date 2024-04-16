<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<link rel="stylesheet" href="/resources/css/bom.css">
<%@ include file="../includes/header.jsp" %>
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
            <h1 class="m-0"><i class="far fa-clipboard"></i> BOM 등록</h1>
          </div><!-- /.col -->
          <div class="col-md-6">         
            <div class="resetBtn2">
               <a href="./insert"><img class="resetPng" alt="reset" src="/resources/img/reset.png" ></a>
            </div>
            <div class="BomInfo-btn">
              <button type="button" class="btn btn-Default"><a href="/bom" style="color: #000;">
              BOM 관리
              </a></button>
        		</div>
          </div>
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <div class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-6">
            <!-- BOM 등록 테이블 -->
            <div class="ITableName"></div>
             <!-- BOM 등록 -->
             <div class="bomInsertBox">
               <form id="bomInsert-form">		        	
			        	<div class="row modal-content1">
									<div class="col-md-6">
					          제품 번호
					         <!--  <input type="text" name="" id="itemId" data-itemId="" class="form-control" autocomplete="off"> -->
					         <select class="col-md-8" aria-label=".form-select-sm example" id="itemId">
                       <option value="">--choose--</option>
                       <c:forEach items="${itemList}" var="Item">
                     	 	<option value="${Item.i_id}" ${bomSearch.type == 'INum' ? 'selected' : ''}>${Item.i_id}</option>
                       </c:forEach>
                   </select>
			          	</div>
			          	<div class="col-md-6">
					         	자재 번호
					          <!-- <input type="text" name="" id="mtId" data-mtId="" class="form-control" autocomplete="off"> -->
				          <select class="col-md-8" aria-label=".form-select-sm example" id="mtId">
                       <option value="">--choose--</option>
                       <c:forEach items="${mtList}" var="MT">
                     	 	<option value="${MT.m_id}" ${mtSearch.type == 'MNum' ? 'selected' : ''}>${MT.m_id}</option>
                       </c:forEach>
                   </select>
				          </div>		
			          </div>	
								<br/>
		          	<div class="row modal-content2">
									<div class="col-md-6">
					         자재 단위
					          <input type="text" name="" id="mtUnit" data-mtUnit="" class="form-control" autocomplete="off" 
					          placeholder="단위는 ea, L, m, set, kg " />
		          		</div>
			          	<div class="col-md-6">
					          자재 수량
					          <input type="text" name="" id="mtQuantity" data-mtQuantity="" class="form-control" autocomplete="off">
				          </div>		
		          	</div>		          				          
	        		</form>
		        		<div class="col-sm-1 ml-auto addLine">
	              	<button type="button" class="btn btn-Primary bomBtn" id="addBomList" name="">추가</button>
	           	  </div>
           	</div>

            <div class="table" style="height:auto;margin-bottom: 5px;">
	            <table cellpadding="0" cellspacing="0" border="0" class="bomInsertTable">
	              <thead class="tbl-header">
	                <tr>
	                  <th>제품 번호</th>
	                  <th>자재 번호</th>
	                  <th>단위</th>
	                  <th>수량</th>
	                  <th>수정</th>
	                </tr>
	              </thead>
	              <tbody class="tbl-content addBomListUL" style="height: 400px;">
	          
	              </tbody>
	            </table>
            <!-- /.table -->
         		</div>		      	
		      	<div class="MovePage">
			      	<div class="">
	              <button type="button" class="btn btn-Default"><a href="/itemInfo" style="color: #000;">
	              제품등록
	              </a></button>
	        		</div>
	        		<div class="">
	              <button type="button" class="btn btn-Default"><a href="/materialInfo" style="color: #000;">
	              자재등록
	              </a></button>
	        		</div>
        		</div>
       	</div>

          <div class="col-md-6">
            <!-- 제품 목록 테이블 -->
            <div class="ITableName">
              <div class="icon"><i class="fa fa-list"></i></div>
              <div>제품 목록</div>
              <form id='searchItemBominsert' action='./insert' method='get' class="bomSearchBtn"> 
	             	<div class="col-sm-1">
		            	<select name='type'>
		            		<option value="">--선택--</option>
						    		<option value="INum"<c:out value="${bomSearch.type == 'INum' ? 'selected' : ''}" />>제품번호</option>
				    				<option value="IName"<c:out value="${bomSearch.type == 'IName' ? 'selected' : ''}" />>제품명</option>
		            	</select>
	            	</div>
                <div class="col-sm-1">
	        	      <input type="text" name="keyword" />
	          	  </div> 
		            <div class="col-sm-1">
		              <button type="button" class="btn btn-primary searchItem" id="" name="" >검색</button>
		            </div>
	            </form>
            </div>
            <div class="table" style="height: 300px;">
              <table cellpadding="0" cellspacing="0" border="0" class="bomInsertTable">
                <thead class="tbl-header">
                  <tr>
                    <th>NO</th>
                    <th>제품번호</th>
                    <th>제품명</th>
                  </tr>
                </thead>
                <tbody class="tbl-content">
                	<c:forEach var="Item" items="${itemList}">
	                  <tr>
	                    <td><c:out value="${Item.rn}" /></td>
	                    <td><c:out value="${Item.i_id}" /></td>
	                    <td><c:out value="${Item.i_name}" /></td>
	                  </tr>
                  </c:forEach>  
                </tbody>
              </table>
              <!-- /.table -->
            </div>

            <!-- 자재 목록 테이블 -->
            <div class="ITableName">
              <div class="icon"><i class="fa fa-list"></i></div>
              <div>자재 목록</div>
              <form id='searchMTBominsert' action='./insert' method='get' class="bomSearchBtn"> 
	              <div class="col-sm-1">
		            	<select name='type'>
		            		<option value="">--선택--</option>
						    		<option value="MNum"<c:out value="${mtSearch.type == 'MNum' ? 'selected' : ''}" />>자재번호</option>
						    		<option value="MName"<c:out value="${mtSearch.type == 'MName' ? 'selected' : ''}" />>자재명</option>
		            	</select>
		            </div>
                <div class="col-sm-1">
	        	      <input type="text" id="" name="keyword" />
	          	  </div>
		            <div class="col-sm-1">
		              <button type="button" class="btn btn-primary searchItem" id="" name="" >검색</button>
		            </div>
	            </form>
            </div>
            <div class="table" style="height: 300px;">
              <table cellpadding="0" cellspacing="0" border="0" class="bomInsertTable">
                <thead class="tbl-header">
                  <tr>
                    <th>NO</th>
                    <th>자재번호</th>
                    <th>자재명</th>
                  </tr>
                </thead>
                <tbody class="tbl-content">
                	<c:forEach var="MT" items="${mtList}">
	                  <tr>
	                    <td><c:out value="${MT.rn}" /></td>
	                    <td><c:out value="${MT.m_id}" /></td>
	                    <td><c:out value="${MT.m_name}" /></td>
	                  </tr>
                  </c:forEach>
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
 </div>

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->

	
<%@ include file="../includes/footer.jsp" %>

<script>

	/* 제품 목록 조회 */
	let searchItemBominsert = $("#searchItemBominsert");
	$("#searchItemBominsert button").on("click",
	function(e) {
	    if (!searchItemBominsert.find("option:selected").val()) {
	        alert("검색종류를 선택하세요");
	        return false;
	    }
	
	    if (!searchItemBominsert.find("input[name='keyword']").val()) {
	        alert("키워드를 입력하세요");
	        return false;
	    }
	
	    e.preventDefault();
	
	    searchItemBominsert.submit();
	});
	
	
	
	/* 자재 목록 조회 */
	let searchMTBominsert = $("#searchMTBominsert");
	$("#searchMTBominsert button").on("click",
	function(e) {
	    if (!searchMTBominsert.find("option:selected").val()) {
	        alert("검색종류를 선택하세요");
	        return false;
	    }
	
	    if (!searchMTBominsert.find("input[name='keyword']").val()) {
	        alert("키워드를 입력하세요");
	        return false;
	    }
	
	    e.preventDefault();
	
	    searchMTBominsert.submit();
	});
	
	
	
	
		/*   var str = "";
    
	str += "<tr>";
	    str += "    <td>";
  str += "        <input class='form-check-input' type='checkbox' />";
  str += "    </td>";
	str += "    <td>" + itemId + "</td>";
	str += "    <td>" + mtId + "</td>";
	str += "    <td>" + mtUnit + "</td>";
	str += "    <td>" + mtQuantity + "</td>";
	str += "</tr>";

	addBomListUL.html(str); // 결과를 HTML에 삽입(html 렌더링한다)  
	위를 사용하지 않는이유: 
		1. 반복적인 문자열 연산이 필요하고 성능에 부담을 줄 수 있고,
		2. 클릭할 때마다 기존 내용을 대체(replace)하는 것이 아니라, 기존 내용에 새로운 요소를 추가하려면 다른 방법이 필요  */

		
	//let addBomListUL = $(".addBomListUL");
	/* BOM 목록 등록추가버튼  */
	$('#addBomList').on('click', function(e) {
		 
		  // 폼 내부에서 데이터를 가져오기
	  	var itemId = $('#itemId').val();
	    var mtId = $('#mtId').val();
	    var mtUnit = $('#mtUnit').val();
	    var mtQuantity = $('#mtQuantity').val();
	
	    console.log('itemId:', itemId);
	    console.log('mtId:', mtId);
	    console.log('mtUnit:', mtUnit);
	    console.log('mtQuantity:', mtQuantity);
        	
	    $.ajax({
	        // request처리
	        type : 'post',                                      // form의 method속성 값
	        url : '/bom/insert/' + itemId + "/" + mtId + "/" + mtUnit + "/" + mtQuantity,       // form의 action값
	        data: JSON.stringify({ itemId: itemId, mtId: mtId, mtUnit: mtUnit, mtQuantity: mtQuantity }), // json으로 string처리하면서 파라미터 전달
	        contentType : "application/json; charset=utf-8",    // content-type지정
	        // response처리
	        success : function(result, status, xhr) {           // call 성공시 오는 처리되는 함수
	        	// 새로운 행(tr)을 생성하여 HTML 문자열로 저장
	            var newRow = 
	            		"<tr>" +
	    					/*  "<td><input class='form-check-input chk' type='checkbox' /></td>" + */
	        	        "<td class='itemId'>" + itemId + "</td>" +
	        	        "<td class='mtId'>" + mtId + "</td>" +
	        	        "<td class='mtUnit'>" + mtUnit + "</td>" +
	        	        "<td class='mtQuantity'>" + mtQuantity + "</td>" +
	        	        "<td class='modifyBomInserted'>수정</td>" +
	                "</tr>";
	
	            // 생성한 행을 테이블에 추가
	            $('.addBomListUL').append(newRow);   
	            alert('BOM이 등록되었습니다');
	        },
	        error : function(xhr, status, er) {                 // call 실패시 오는 처리되는 함수
	        	 // 오류 발생 시 실행할 코드
		            if (xhr.responseJSON && xhr.responseJSON.error) {
		                alert('제품에 등록된 자재가 있습니다. 다시 확인해주세요');
		            } else {
		                alert('제품에 등록된 자재가 있습니다. 다시 확인해주세요.');
		            }
		        }
	    });
    
	 });
	 
	// '수정' 버튼 클릭 이벤트 핸들러 등록
    $('.addBomListUL').on('click', '.modifyBomInserted', function() {
        var $row = $(this).closest('tr');

        // 각 셀의 값을 입력 필드로 변경
       /*  $row.find('td').each(function() {
            var currentValue = $(this).text();
            $(this).html('<input type="text" class="form-control" value="' + currentValue + '">');
        }); */
        $row.find('td').each(function() {
            var currentValue = $(this).text();
            var className = $(this).attr("class");
            
            if (!(className == 'itemId' || className == 'mtId')) { 
            	$(this).html('<input type="text" class="form-control" value="' + currentValue + '">');
            }
        });

        // '수정' 버튼을 '완료' 버튼으로 변경
        $(this).text('완료').removeClass('modifyBomInserted').addClass('completeBomEdit');

        // '완료' 버튼(수정 완료 버튼) 클릭 이벤트 핸들러 등록
        $(this).on('click', function() {
	        var $row2 = $(this).closest('tr');
	
	        // 각 셀의 입력 필드 값을 가져와서 해당 셀의 내용으로 설정
	        $row2.find('input').each(function() {
	            var newValue = $(this).val();
	            $(this).closest('td').text(newValue);
	        });

	         // '완료' 버튼을 '수정' 버튼으로 변경
	         $(this).text('수정').removeClass('completeBomEdit').addClass('modifyBomInserted');
	         /*    $row.find('.completeBomEdit').text('수정').removeClass('completeBomEdit').addClass('modifyBomInserted'); */

            // 수정된 데이터를 서버로 전송하여 처리 (실제 AJAX 요청)
            var itemId = $row2.find('.itemId').text();
            var mtId = $row2.find('.mtId').text();
            var mtUnit = $row2.find('.mtUnit').text();
            var mtQuantity = $row2.find('.mtQuantity').text();

            var dataToUpdate = {
            		b_item_id: itemId,
            		b_material_id: mtId,
            		b_unit: mtUnit,
                b_material_quantity: mtQuantity
            };
            
            console.log(dataToUpdate);
            
            console.log('$row', $row);
            console.log('$row2', $row2);
            console.log('$(this)', $(this));

            // AJAX 요청을 통해 서버에 데이터 전송
            $.ajax({
                type: 'POST',
                url:  '/bom/modifyAll/' + itemId + '/' + mtId, // 수정 처리를 위한 서버 URL
                contentType: 'application/json; charset=utf-8',
                data: JSON.stringify(dataToUpdate),
                success: function(response) {
                    alert('BOM 수정이 완료되었습니다.');
                    
                    $row.find('td').each(function() {
                        var className = $(this).attr("class");
                        
                        if (className == 'mtUnit') { 
                        	$(this).html(mtUnit);
                        }
                        if (className == 'mtQuantity') { 
                        	$(this).html(mtQuantity);
                        }
                    });
                },
                error: function(xhr, status, er) {
                    alert('BOM 수정 중 오류가 발생했습니다. 다시 시도해 주세요.');
                    console.error('error:', er);
                }
            });
        });
    });
</script>
