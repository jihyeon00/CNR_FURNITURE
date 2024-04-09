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
              <h1 class="m-0"><i class="far fa-clipboard"></i>설비정보관리</h1>
            </ol>
            <ol class="breadcrumb float-sm-right">
              <div class="reset" href="/machineInfo">
                <a href="./machineInfo"><img class="resetPng" alt="reset" src="/resources/img/reset.png"></a>
              </div>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- 검색창 -->

    <form action="" id="searchForm" onSubmit="return false">
        <div class="headerBar">
            <div class="machineSearch">
                <div class="machineName">
                    <div class="searchMachine">설비명</div>
                    <input type="search" name="find_machine_name" id="find_machine_name" class="machineBox" value='<c:out value="${searchMachine.find_machine_name}" />' autocomplete="off">
                </div>
                <div class="machineType">
                    <div class="searchMachine">설비유형</div>
                    <input type="search" name="find_machine_type" id="find_machine_type" class="machineBox" value='<c:out value="${searchMachine.find_machine_type}" />' autocomplete="off">
                </div>
                <div class="machinePosition">
                    <div class="searchMachine">설비위치</div>
                    <input type="search" name="find_machine_position" id="find_machine_position" class="machineBox" value='<c:out value="${searchMachine.find_machine_position}" />' autocomplete="off">
                </div>
            </div>
            <div class="searchbtn">
                <button type="button" id="searchbtn" class="btn btn-block btn-primary" onClick="javascript: searchMachine();"><i class="fa-solid fa-magnifying-glass"></i>&nbsp;검색</button>
                <button type="button" id="addBtn" class="btn btn-block btn-default" data-toggle="modal" data-target="#myModal" >등록</button>
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
                      <th>NO</th>
                      <th>설비번호</th>
                      <th>설비명</th>
                      <th>설비유형</th>
                      <th>설비위치</th>
                      <th>수정</th>
                    </tr>
                  </thead>
                  <tbody class="tbl-content">
                  <c:forEach items="${machineVOList}" var="machineList">
                    <tr>
                      <td id="machineRowNum"><c:out value="${machineList.rownum}" /></td>
                      <td id="machineId"><c:out value="${machineList.mi_id}" /></td>
                      <td id="machineName"><c:out value="${machineList.mi_name}" /></td>
                      <td id="machineType"><c:out value="${machineList.mi_type}" /></td>
                      <td id="machinePosition"><c:out value="${machineList.mi_position}" /></td>
                      <td><a id="updateMachine]" data-toggle="modal" data-target="#updateModal">수정</a></td>
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
  <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title" id="myModalLabel">설비등록</h4>
        </div>
        <div class="modal-body">
          <div class="madalAdd">
            <div class="nameaddmodal">
                <div class="addName">설비명</div>
                <input type="text" name="modalAddName" id="modalAddName" class="modalAddName" autocomplete="off">
            </div>
            <div class="typeaddmodal">
                <div class="addType">설비유형</div>
                <input type="text" name="modalAddType" id="modalAddType" class="modalAddType" autocomplete="off">
            </div>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" id="insertMachine" class="btn btn-primary">등록</button>
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
    // 설비 등록 모달
    $(document).ready(function(){
        $('#insertMachine').on('click', function() {
            var modalAddName = $('#modalAddName').val();
            var modalAddType = $('#modalAddType').val();

            // 입력된 값을 객체로 생성
            var data = {
                modalAddName: modalAddName,
                modalAddType: modalAddType,
            };

            $.ajax({
                type: 'POST',
                url: '/machineInfoAdd', // 서버의 컨트롤러 매핑 주소
                data : JSON.stringify(data),
                contentType : "application/json; charset=utf-8",
                success: function(response) {
                    // 성공 시 처리
                    alert('등록되었습니다.');
                    // 새로운 데이터 행 추가
                    var newRow = "<tr>" +
                        "<td id='machineRowNum'>" + response.rownum + "</td>" +
                        "<td id='machineId'>" + response.mi_id + "</td>" +
                        "<td id='machineName'>" + response.mi_name + "</td>" +
                        "<td id='machineType'>" + response.mi_type + "</td>" +
                        "<td id='machinePosition' >" + (response.mi_position !== null ? response.mi_position : '') + "</td>" +
                        "<td><a id='updateMachine' data-toggle='modal' data-target='#updateModal'>수정</a></td>" +
                        "</tr>";
                    $(".tbl-content").append(newRow);

                    // 모달 숨기기
                    document.getElementById('myModal').style.display = 'none';
                    document.getElementsByClassName('modal-backdrop fade')[0].style.display = 'none';

                    // 수정 버튼 클릭 시
                    $(document).on('click', '#updateMachine', function() {

                        // 해당 행의 데이터 가져오기
                        var row = $(this).closest('tr');
                        var mi_id = row.find("#machineId").text();
                        var mi_name = row.find("#machineName").text();
                        var mi_type = row.find("#machineType").text();
                        var mi_position = row.find("#machinePosition").text();

                        // 모달 내의 각 input 요소에 데이터 설정
                        $('#modalUpdateNumber').val(mi_id);
                        $('#modalUpdateName').val(mi_name);
                        $('#modalUpdateType').val(mi_type);
                        $('#modalUpdatePosition').val(mi_position);

                        // 모달 열기
                        $('#updateModal').modal('show');
                    });
                },
                error: function(xhr, status, error) {
                    // 실패 시 처리
                    console.log('error: ', error);

                    alert('등록에 실패하였습니다.');
                }
            });
        });
    });

    // 설비 수정 모달
    $(document).ready(function() {
        // 수정 버튼 클릭 시
        $(document).on('click', '#updateMachine', function() {

            // 해당 행의 데이터 가져오기
            var row = $(this).closest('tr');
            var mi_id = row.find("#machineId").text();
            var mi_name = row.find("#machineName").text();
            var mi_type = row.find("#machineType").text();
            var mi_position = row.find("#machinePosition").text();

            // 모달 내의 각 input 요소에 데이터 설정
            $('#modalUpdateNumber').val(mi_id);
            $('#modalUpdateName').val(mi_name);
            $('#modalUpdateType').val(mi_type);
            $('#modalUpdatePosition').val(mi_position);

            // 모달 열기
            $('#updateModal').modal('show');
        });
    });

    // 수정 등록
    function modifySubmit() {
      document.getElementById('updateForm').submit();
   }

    // 검색
    function searchMachine() {
       document.getElementById('searchForm').submit();
    }


</script>


<%@ include file="../includes/footer.jsp" %>
