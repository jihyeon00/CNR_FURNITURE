<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<link rel="stylesheet" href="/resources/css/process.css">
<%@ include file="../includes/header.jsp" %>
<script src="/resources/js/process.js"></script>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-md-6">
            <h1 class="m-0"><i class="far fa-clipboard"></i> 제조수행지시</h1>
          </div><!-- /.col -->
          <div class="col-md-6 ml-auto">
           <form action="/manufacturingPerform" method="get">
            <div class="pro-btn">
              <button type="submit" id="prosearchbtn" class="btn btn-primary">조희</button>
	            <button type="button" id= proaddBtn class="btn btn-default" data-toggle="modal" data-target="#register-Process-Btn">등록</button>
            </div>
          </div><!-- /.col -->
      </div><!-- /.container-fluid -->
    </div>
      <div class="proheaderBar">
        <div class="process1Search">
            <div class="proName">
                <div class="searchProbar">제조LOT번호</div>
                    <select id="proRunList" class="processBox" name="process" id="processInput">
                        <option value="">--선택--</option>
                        <c:forEach items="${proRunList}" var="Run">
                            <option value="${Run.p_lot_id}">
                                ${Run.p_lot_id}
                            </option>
                        </c:forEach>
                    </select>
            </div>
            <div class="proType">
                <div class="searchProbar">지시일자</div>
                <input type="date" class="processBox" id="startDate" autocomplete="off" name="startDate" value='<c:out value="${processDate.startDate}"/>'/>
                 <p class="textPro5"> ~ </p>
                <input type="date" class="processBox" autocomplete="off" name="endDate" id="endDate" value='<c:out value="${processDate.endDate}"/>' />
            </div>
            <div class="proPosition">
                <div class="searchProbar">공정번호</div>
				  <select name="search_process" id="search_process" class="processBox" autocomplete="off">
                        <option value="">--선택--</option>
                        <c:forEach items="${proRunList}" var="Run">
                            <option value="${Run.p_pi_id}">
                                ${Run.p_pi_id}
                            </option>
                        </c:forEach>
              	  </select>
                </div>
             </div>

        </div>
  </form>
    <!-- /.content-header -->
    <!-- Main content -->
    <div class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-12">
            <!-- 제조수행테이블 -->
            <div class="ProTableName">
              <div class="icon"><i class="fa fa-list"></i></div>
              <div class="employee">제조수행지시목록</div>
            </div>
            <div class="table ProTable">
              <table cellpadding="0" cellspacing="0" border="0">
                <thead class="tbl-headerPro">
                       <th>NO</th>
                       <th>제조LOT번호</th>
                       <th>공정번호</th>
                       <th>제품번호</th>
                       <th>계획수량</th>
                       <th>생산시작날짜</th>
                       <th>진행사항</th>
                       <th>비고</th>
                </thead>
                <tbody class="tbl-content ProTable">
                    <c:forEach items="${proRunList1}" var="RunPro">
                        <tr>
                            <td><c:out value="${RunPro.rn}"/></td>
                            <td><c:out value="${RunPro.p_lot_id}"/></td>
                            <td><c:out value="${RunPro.p_pi_id}"/></td>
                            <td><c:out value="${RunPro.p_b_item_id}"/></td>
                            <td><c:out value="${RunPro.p_plan_quantity}" /></td>
                            <td><c:out value="${RunPro.p_start_date}"  /></td>
                            <td><c:out value="${RunPro.p_Status}"/></td>
                            <td><c:out value="${RunPro.p_note}"/></td>
                        </tr>
                    </c:forEach>
                </tbody>
               </table>
              <!-- /.table -->
	          </div>
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


<!-- 등록 모달 -->
<div class="modal fade" id="register-Process-Btn" tabindex="-1" role="dialog" aria-labelledby="registerProcessGridSystemModalLabel">
  <div class="modal-dialog register-Process-Modal-Dialog" role="document">
    <div class="modal-content">
        <div class="modal-header">
            <div class="processModalTitle" id="registerProcessGridSystemModalLabel" style="font-size: 150%; font-weight:800;">제조수행지시등록</div>
        </div>
         <form action="./manufacturingPerformInsert" method="post" id="insertProDaForm">
            <div class="modal-body">
					<table class="processtable">
					  <tr>
					    <th scope="col" class="process-highlight">제조LOT번호</th>
                            <th scope="col" class="process-highlight2">
                                <select class="process-select" id="proLot" name="p_lot_id">
                                    <option value="">--선택--</option>
                                <c:forEach items="${insLotList}" var="proLot">
                                    <option value="${proLot.ins_lot_id}" ${proLot.ins_lot_id == processDate.ins_lot_id ? 'selected' : ''}>${proLot.ins_lot_id}</option>
                                </c:forEach>
                                </select>
                            </th>
                        <th scope="col" class="process-highlight" >제품번호</th>
                        <th scope="col" class="process-highlight2">
                                <select class="process-select" id="proItem" name="p_b_item_id">
                                    <option value="">--선택--</option>
                                <c:forEach items="${insItemList}" var="proItem">
                                    <option value="${proItem.ins_item_id}" ${proItem.ins_item_id == processDate.ins_item_id ? 'selected' : ''}>${proItem.ins_item_id}</option>
                                </c:forEach>
                                </select>
                        </th>
					  </tr>
					  <tr>
					  <th scope="col" class="process-highlight">공정번호</th>
					    <td class="process-highlight2">
                             <select class="process-select" id="proPi" name="p_pi_id">
                                 <option value="">--선택--</option>
                             <c:forEach items="${insPiList}" var="proLot">
                                 <option value="${proLot.ins_pi_id}" ${proLot.ins_pi_id == processDate.ins_pi_id ? 'selected' : ''}>${proLot.ins_pi_id}</option>
                             </c:forEach>
                             </select>
					    </td>
					    <th scope="col" class="process-highlight">계획수량</th>
					    <td class="process-highlight2">
					        <input  type="text"  name="p_plan_quantity" id="p_plan_quantity" class="process-select" autocomplete="off">
					    </td>
					  <tr>
					    <th scope="col" class="process-highlight">비고</th>
					    <td colspan="5" class="process-highlight2">>
					        <textarea rows="3" cols="83" class="process-textarea" name="p_note"  id="p_note"></textarea>
					    </td>
					  </tr>
					</table>
                </div>
               </form>
             <div class="modal-footer">
                <button type="button" class="btn btn-primary" onClick ="insertProDaBox()">등록</button>
                <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
            </div>
        </div><!-- /.modal-content -->
      </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->


  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->


<%@ include file="../includes/footer.jsp" %>


<script>
    $('#proLot').on('change', function() {
        var proLot = $(this).val();
        var proItemSelect = $('#proItem');
        var proPiSelect = $('#proPi');  // 공정 번호 select element 추가
        proItemSelect.empty();
        proPiSelect.empty();  // 공정 번호 선택지 초기화

        if (proLot) {
            $.ajax({
                url: '/insItemList?ins_lot_id=' + proLot,
                type: 'GET',
                dataType: 'json',
                success: function(data) {
                    console.log('response data', data);
                    if (data.length > 0) {
                        proItemSelect.append($('<option>', { value: "", text: "--선택--" }));
                        $.each(data, function(index, item) {
                            proItemSelect.append($('<option>', {
                                value: item.ins_item_id,
                                text: item.ins_item_id
                            }));
                        });
                    } else {
                        proItemSelect.append('<option value="">No Options Available</option>');
                    }
                },
                error: function(xhr, status, error) {
                    console.error("Error loading proItem options: ", error);
                }
            });
        } else {
            proItemSelect.append('<option value="">Select Lot first</option>');
            proPiSelect.append('<option value="">Select Item first</option>');
        }
    });

    $('#proItem').on('change', function() {
        var proLot = $('#proLot').val();  // LOT 번호를 다시 가져옴
        var proItem = $(this).val();
        var proPiSelect = $('#proPi');
        proPiSelect.empty();

        if (proItem) {
            $.ajax({
                url: '/insPiList?ins_lot_id=' + proLot + '&ins_item_id=' + proItem,
                type: 'GET',
                dataType: 'json',
                success: function(data) {
                    console.log('response data', data);
                    if (data.length > 0) {
                        proPiSelect.append($('<option>', { value: "", text: "--선택--" }));
                        $.each(data, function(index, pi) {
                            proPiSelect.append($('<option>', {
                                value: pi.ins_pi_id,
                                text: pi.ins_pi_id
                            }));
                        });
                    } else {
                        proPiSelect.append('<option value="">No Options Available</option>');
                    }
                },
                error: function(xhr, status, error) {
                    console.error("Error loading proPi options: ", error);
                }
            });
        } else {
            proPiSelect.append('<option value="">Select Item first</option>');
        }
    });
</script>


