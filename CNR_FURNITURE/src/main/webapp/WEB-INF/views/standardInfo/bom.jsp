<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<link rel="stylesheet" href="/resources/css/bom.css">
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
         <div class="col-md-6">         
            <div class="resetBtn">
               <a href="./bom"><img class="resetPng" alt="reset" src="/resources/img/reset.png" ></a>
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
          <div class="col-md-12 bomSearchBar">
          	<form id='searchBomForm' action='./bom' method='get'>
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
	              <button type="button" class="btn btn-primary search" id="searchBomBtn" style="margin: 5px;">
	              <i class="fa-solid fa-magnifying-glass"></i>&nbsp;검색</button>
	            </div>
						</form>
            <div class="member-btn">
              <button type="button" class="btn btn-Default"><a href="bomInsert" style="color: #000;">
              BOM 등록
              </a></button>
        		</div>
          </div>

          <div class="col-md-5">
            <div class="BomTableName">
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
                  </tr>
                </thead>
                <tbody class="table-content">
                	<c:forEach var="Item" items="${itemList}">
	                  <tr>
	                    <td><c:out value="${Item.rn}" /></td>
	                    <td onClick='showBomList(<c:out value="${Item.i_id}"/>)' class="itemNumBtn">
	                    	<c:out value="${Item.i_id}" />
	                    </td>
	                    <td><c:out value="${Item.i_name}" /></td>
	                  </tr>     
	                 </c:forEach>    
                </tbody>
              </table>
              <!-- /.table -->
	          </div>
          </div>

          <div class="col-md-7">
            <!-- BOM 세부목록 테이블 -->
            <div class="BomTableName">
              <div class="icon"><i class="fa fa-list"></i></div>
              <div>BOM 세부목록</div>
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
                    <th>수정</th>
                  </tr>
                </thead>
                <tbody class="table-content checkBomList">
                	<%-- <c:forEach var="Bom" items="${bomList}" varStatus="status">
	                  <tr>
	                    <td id="rn<c:out value="${status.index}" />"><c:out value="${Bom.rn}" /></td>
	                    <td id="b_material_id<c:out value="${status.index}" />"><c:out value="${Bom.b_material_id}" /></td>
	                    <td id="m_name<c:out value="${status.index}" />"><c:out value="${Bom.m_name}" /></td>
	                    <td id="b_unit<c:out value="${status.index}" />"><c:out value="${Bom.b_unit}" /></td>
	                    <td id="b_material_quantity<c:out value="${status.index}" />"><c:out value="${Bom.b_material_quantity}" /></td>
	                  </tr>
                  </c:forEach> --%>
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

<script>

	/*Bom 검색*/

let searchBomForm = $("#searchBomForm");
	$("#searchBomForm button").on("click",
    function(e) {
        if (!searchBomForm.find("option:selected").val()) {
            alert("검색종류를 선택하세요");
            return false;
        }

        if (!searchBomForm.find("input[name='keyword']").val()) {
            alert("키워드를 입력하세요");
            return false;
        }

        e.preventDefault();

        searchBomForm.submit();
    });
	
	
	
	
	let bomListUL = $(".checkBomList");
	let tempQuantity = 0;
	
	function showBomList(i_id) {
	    // i_id를 가져와서 화면에 뿌려주는 함수 선언 i_id=B_ITEM_ID
	    $.get("/bomList/" + i_id, function(result) {
	        // 1. Bom 목록 rest ajax로 가져오기, ajax 함수 콜 성공시 처리
	        console.log("showBomList:", result);

	        var str = "";
	        if (!result || result.length === 0) {
	            bomListUL.html(""); // 제품에 등록된 bom이 없을 때 비우기
	            return;
	        }

	        // 제품에 등록된 bom이 있을 경우 아래를 뿌려준다
	        for (var i = 0; i < result.length; i++) {
	            str += "<tr>";
	            str += "    <td>" + result[i].rn + "</td>";
	            /* str += "		<td id='itemId-" + result[i].b_item_id + "' style='display: none;' data-itemid='" + result[i].b_item_id + "'>" + result[i].b_item_id + "</td>"; */
	            str += "    <td>" + result[i].b_material_id + "</td>";
	            str += "    <td>" + result[i].m_name + "</td>";
	            str += "    <td>" + result[i].b_unit + "</td>";
	            str += "    <td id='mQuantity-" + result[i].b_material_id + "'>" + result[i].b_material_quantity + "</td>";
	            str += "    <td id='mQuantity-backup-" + result[i].b_material_id + "' style='display: none;'>" + result[i].b_material_quantity + "</td>";
	            str += "    <td>";
	            str += "        <div class='modifyBom' id='modifyBom-" + result[i].b_material_id + "' data-bmid='" + result[i].b_material_id + "' data-itemid='" + result[i].b_item_id + "'>수정</div>";
	            str += "    </td>";
	            str += "</tr>";
	        }

	        bomListUL.html(str); // 결과를 HTML에 삽입(html 렌더링한다)

	        // 댓글 수정 버튼 처리
	        $('.modifyBom').on('click', function(e) {
	            var bmid = $(this).attr('data-bmid'); // BOM 자재ID 가져오기
	            var itemId = $(this).attr('data-itemid'); 

	            const mQuantity = $('#mQuantity-' + bmid).text(); // 실제 내용 가져오기
	            console.log('modfiyBom', mQuantity);
	            tempQuantity = mQuantity;
	            
	            $('#mQuantity-' + bmid).replaceWith("<input type='text' id='mQuantity-" + bmid + "' value='" + (mQuantity || $('#mQuantity-' + bmid).val()) + "' />"); 
	            /* $('#mQuantity-' + bmid).replaceWith("<td id='mQuantity-" + bmid + "' value='" + (mQuantity || $('#mQuantity-' + bmid).val()) + "'></td>"); */

	            bomUpdate(bmid, itemId); // BOM 수정 처리
	        });
	    }).fail(function(xhr, status, err) {
	        console.error("showBomList error:", err);
	    });
	}
	// 특정 i_id에 대한 showBomList 호출, 가져와서 화면에 뿌려주는 함수 실행
	showBomList(1);  

	
	 //수정 버튼 실제 처리
    function bomUpdate(bomMaterialId, bItemId) {

    	console.log('bItemId:', bItemId);
    	
    	const bom = { 
    			b_item_id: bItemId,
    			b_material_id: bomMaterialId, 
    			b_material_quantity: $('#mQuantity-' + bomMaterialId).val()
  		};
    	
			$.ajax({
            // request처리
            type : 'post',                                      // form의 method속성 값
            url : '/bom/' + bomMaterialId + "/" + bItemId,                               // form의 action값
            //url : '/bom/' + bomMaterialId,                               // form의 action값
            data : JSON.stringify(bom),                       // json으로 string처리하면서 파라미터 전달
            contentType : "application/json; charset=utf-8",    // content-type지정
            // response처리
            success : function(result, status, xhr) {           // call 성공시 오는 처리되는 함수
            	$('#mQuantity-backup-' + bomMaterialId).text($('#mQuantity-' + bomMaterialId).val());
            	console.log('zzzzzzzzzz', $('#mQuantity-' + bomMaterialId).val());
            	console.log('tempQuan22', tempQuantity);
            	
            	// 그림 원래대로
            	/* console.log('aaaa:', $('#mQuantity-' + bomMaterialId).prop('tagName')); */
            	if (tempQuantity != $('#mQuantity-' + bomMaterialId).val()) {
            		$('#mQuantity-' + bomMaterialId).replaceWith("<td id='mQuantity-" + bomMaterialId + "'>" + $('#mQuantity-' + bomMaterialId).val() + "</td>");
            		/* tempQuantity = $('#mQuantity-' + bomMaterialId).val(); */
            	} 
            	/* console.log('bbbb:', $('#mQuantity-' + bomMaterialId).prop('tagName')); */
            },
            error : function(xhr, status, er) {                 // call 실패시 오는 처리되는 함수
                if (er) {
                    console.log('error:', er);
                }
            }
       });
		 
    }
	
	
/* Bom 목록의 제품번호 값과 일치하면 Bom세부목록에 Bom내용 불러오기  */
	/*  function bomList(i_id) {
	  $.get("/bomList/"+i_id , function(result) {
	      console.log("bomList:", result);
	
	      /* $('#b_material_id').val(result.b_material_id);
	      $('#m_name').val(result.m_name);
	      $('#b_unit').val(result.b_unit);
	      $('#b_material_quantity').val(result.b_material_quantity); 
	
	
	    }).fail(function(xhr, status, err){
	        console.log("bomList err:", err);
	    });
		} */


</script>