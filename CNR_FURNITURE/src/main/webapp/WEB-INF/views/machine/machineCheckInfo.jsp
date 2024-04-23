<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ include file="../includes/header.jsp" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-12">
              <ol class="breadcrumb float-sm-left">
                <h1 class="m-0"><i class="far fa-clipboard"></i>설비관리체크기준관리</h1>
              </ol>
              <ol class="breadcrumb float-sm-right">
                <div class="reset">
                  <a href="machineCheckInfo"><img class="resetPng" alt="reset" src="/resources/img/reset.png" ></a>
                </div>
              </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>

    <!-- 검색창 -->
    <form action="/M/machine/machineCheckInfo" id="searchForm" name="searchForm" method="get">
        <div class="headerBar">
            <div class="machineSearch">
                <div class="machineName">
                    <div class="machineCheckType">설비관리유형</div>
                    <select id="find_machine_check_type" name="find_machine_check_type" class="find_machine_check_type">
                        <option class="checkType" disabled selected>유형</option>
                        <c:forEach var="list" items = "${getMachineCheckType}">
                            <option value="${list.mci_div}" ${list.mci_div == searchMachineCheckVO.find_machine_check_type ? 'selected' : ''}>
                            ${list.mci_div}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="machineType">
                    <div class="MachineCheckMethod">점검방법</div>
                        <select id="find_machine_check_method" name="find_machine_check_method" class="find_machine_check_method">
                            <option class="checkMethod" disabled selected>점검 방법</option>
                            <c:forEach var="list" items = "${getMachineCheckMethod}">
                                <option value="${list.mci_method}" ${list.mci_method == searchMachineCheckVO.find_machine_check_method ? 'selected' : ''}>${list.mci_method}</option>
                            </c:forEach>
                        </select>
                </div>
                <div class="machinePosition">
                    <div class="searchMachine">체크리스트 조건</div>
                    <input type="search" name="find_machine_check_condition" id="find_machine_check_condition" class="find_machine_check_condition" value='<c:out value="${searchMachineCheckVO.find_machine_check_condition}" />' autocomplete="off">
                </div>
            </div>
            <div class="searchbtn">
                <button type="button" id="searchbtn" class="btn btn-block btn-primary" onClick="javascript: searchMachineCheck();"><i class="fa-solid fa-magnifying-glass"></i>&nbsp;검색</button>
                <button type="button" id="addBtn" class="btn btn-block btn-default" data-toggle="modal" data-target="#AddModal">추가</button>
            </div>
        </div>
    </form>
    <!-- /.content-header -->

    <!-- Main content -->
        <!-- Main content -->
        <div class="content">
          <div class="container-fluid">
            <div class="row">
              <div class="table" style="height:550px; overflow-y: auto;">
                <table cellpadding="0" cellspacing="0" border="0">
                  <thead class="tbl-header">
                    <tr>
                      <th>체크리스트 번호</th>
                      <th>유형</th>
                      <th>점검방법</th>
                      <th>체크리스트 조건</th>
                    </tr>
                  </thead>
                  <tbody class="tbl-content">
                    <c:forEach items="${machineCheckVOList}" var="machineCheckVOList">
                        <tr>
                          <td id="checkId"><c:out value="${machineCheckVOList.mci_id}" /></td>
                          <td id="checkType"><c:out value="${machineCheckVOList.mci_div}" /></td>
                          <td id="checkMethod"><c:out value="${machineCheckVOList.mci_method}" /></td>
                          <td id="checkCondition"><c:out value="${machineCheckVOList.mci_condition}" /></td>
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

  <!-- 등록 모달 -->
  <div class="modal fade" id="AddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title" id="myModalLabell">설비별 체크리스트 정보 추가</h4>
        </div>
       <div class="modal-body">
           <div class="ModalAddCheck">
             <div class="addMachineNumber">
                 <div class="addNumberMachine">설비번호</div>
                 <input type="text" name="modalAddNumber" id="modalAddNumber" class="modalAddNumber" autocomplete="off">
             </div>
             <div class="addMachineType">
                 <div class="addTypeMachine">설비관리유형</div>
                 <input type="text" name="modalAddTypeCheck" id="modalAddTypeCheck" class="modalAddTypeCheck" autocomplete="off">
             </div>
             <div class="addMachineMethod">
                 <div class="addMethodMachine">점검방법</div>
                 <input type="text" name="modalAddMethod" id="modalAddMethod" class="modalAddMethod" autocomplete="off">
             </div>
             <div class="addMachineCondition">
                 <div class="addConditionMachine">조건</div>
                 <input type="text" name="modalAddCondition" id="modalAddCondition" class="modalAddCondition" autocomplete="off">
             </div>
           </div>
       </div>
        <div class="modal-footer">
          <button type="button" id="insertMachineCheck" class="btn btn-primary">등록</button>
          <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
        </div>
      </div>
    </div>
  </div>

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->

<script>
    /* 체크리스트 등록 모달 저장 */
    $(document).ready(function(){
        $('#insertMachineCheck').on('click', function() {
            var modalAddNumber = $('#modalAddNumber').val();
            var modalAddTypeCheck = $('#modalAddTypeCheck').val();
            var modalAddMethod = $('#modalAddMethod').val();
            var modalAddCondition = $('#modalAddCondition').val();

            // 입력된 값을 객체로 생성
            var data = {
                modalAddNumber: modalAddNumber,
                modalAddTypeCheck: modalAddTypeCheck,
                modalAddMethod: modalAddMethod,
                modalAddCondition: modalAddCondition
            };

            $.ajax({
                type: 'POST',
                url: '/M/machine/machineCheckInfo', // 서버의 컨트롤러 매핑 주소
                data : JSON.stringify(data),
                contentType : "application/json; charset=utf-8",
                success: function(response) {
                    // 성공 시 처리
                    alert('등록되었습니다.');
                    // 새로운 데이터 행 추가
                    var newRow = "<tr>" +
                        "<td>" + response.mci_id + "</td>" +
                        "<td>" + response.modalAddTypeCheck + "</td>" +
                        "<td>" + response.modalAddMethod + "</td>" +
                        "<td>" + response.modalAddCondition + "</td>" +
                        "</tr>";
                    $(".tbl-content").append(newRow);

                    // 모달 숨기기
                    document.getElementById('AddModal').style.display = 'none';
                    document.getElementsByClassName('modal-backdrop fade')[0].style.display = 'none';

                },
                error: function(xhr, status, error) {
                    // 실패 시 처리
                    console.log('error: ', error);

                    alert('등록에 실패하였습니다.');
                }
            });
        });
    });

    /* 검색 버튼 */
    function searchMachineCheck() {
        // form을 submit
        document.getElementById('searchForm').submit();
    }




</script>

<%@ include file="../includes/footer.jsp" %>
