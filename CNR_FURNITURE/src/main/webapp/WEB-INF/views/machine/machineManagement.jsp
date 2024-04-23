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
                <h1 class="m-0"><i class="far fa-clipboard"></i>설비관리</h1>
              </ol>
              <ol class="breadcrumb float-sm-right">
                <div class="reset">
                  <a href="./machineManagement"><img class="resetPng" alt="reset" src="/resources/img/reset.png" ></a>
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
                        <input type="search" name="find_machine_name" id="find_machine_name" class="machineBox" value='<c:out value="${searchMachineVO.find_machine_name}" />' autocomplete="off">
                    </div>
                    <div class="machineType">
                        <div class="searchMachine">설비유형</div>
                        <input type="search" name="find_machine_type" id="find_machine_type" class="machineBox" value='<c:out value="${searchMachineVO.find_machine_type}" />' autocomplete="off">
                    </div>
                    <div class="machinePosition">
                        <div class="searchMachine">상태</div>
                        <input type="search" name="find_machine_condition" id="find_machine_condition" class="machineBox" value='<c:out value="${searchMachineVO.find_machine_condition}" />' autocomplete="off">
                    </div>
                </div>
                <div class="searchbtn">
                    <button type="button" id="searchbtn" class="btn btn-block btn-primary" onClick="javascript: searchMachine();"><i class="fa-solid fa-magnifying-glass"></i>&nbsp;검색</button>
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
                      <th>No</th>
                      <th>설비번호</th>
                      <th>설비명</th>
                      <th>설비유형</th>
                      <th>설비위치</th>
                      <th>상태</th>
                      <th>비고</th>
                    </tr>
                  </thead>
                  <tbody class="tbl-content">
                    <c:forEach items="${mcManagementList}" var="list">
                        <tr>
                          <td><c:out value="${list.rownum}" /></td>
                          <td><c:out value="${list.mw_mi_id}" /></td>
                          <td><c:out value="${list.mi_name}" /></td>
                          <td><c:out value="${list.mi_type}" /></td>
                          <td><c:out value="${list.pi_seq}" /> <c:out value="${list.mi_position}" /></td>
                          <td><c:out value="${list.mw_condition}" /></td>
                          <td>
                            <button type="button" class="btn btn-block btn-Info repair-button" data-mw-mi-id="${list.mw_mi_id}"
                            style="${list.mw_condition == '수리요청' ? '' : 'display: none;'}">
                              수리
                            </button>
                            <button type="button" class="btn btn-block btn-Info repairCompleted" data-mw-mi-id="${list.mw_mi_id}"
                            style="${list.mw_condition == '수리중' ? '' : 'display: none;'}">
                              수리완료
                            </button>
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


  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->

<script>
    /* 수리 버튼 눌렀을 때 '수리중' 으로 바꾸기 */
    $(document).ready(function() {
        // 각 수리 버튼에 대한 클릭 이벤트 처리
        $('.repair-button').click(function() {
            // 해당 설비의 고유 식별자 가져오기
            var mwMiId = $(this).data('mw-mi-id');

            // 콘솔 확인
            console.log('수리 버튼이 클릭되었습니다. 설비 ID:', mwMiId);

            // 서버로 데이터를 전송하여 상태를 업데이트하는 코드
            $.ajax({
                type: "POST",
                url: "/M/machine/updateRepairStatus", // 서버의 업데이트 처리를 담당하는 URL
                data: JSON.stringify({ mw_mi_id: mwMiId }),
                contentType : "application/json; charset=utf-8",
                success: function(response) {
                    alert('수리중으로 되었습니다.');
                    console.log('수리 상태가 업데이트되었습니다.');
                    // 페이지 새로고침
                    window.location.reload();
                },
                error: function(xhr, status, error) {
                    // 오류 발생 시 처리하는 코드
                    console.error("상태 업데이트 중 오류 발생:", error);
                    alert('등록에 실패하였습니다.');
                }
            });
        });
    });

    /* 수리 완려 버튼 눌렀을 때 '수리 완료' 로 바꾸기  */
    $(document).ready(function() {
        // 각 수리 버튼에 대한 클릭 이벤트 처리
        $('.repairCompleted').click(function() {
            // 해당 설비의 고유 식별자 가져오기
            var mwMiId = $(this).data('mw-mi-id');

            // 콘솔 확인
            console.log('수리완료 버튼이 클릭되었습니다. 설비 ID:', mwMiId);

            // 서버로 데이터를 전송하여 상태를 업데이트하는 코드
            $.ajax({
                type: "POST",
                url: "/M/machine/mcRepairCompleted", // 서버의 업데이트 처리를 담당하는 URL
                data: JSON.stringify({ mw_mi_id: mwMiId }),
                contentType : "application/json; charset=utf-8",
                success: function(response) {
                    alert('수리완료 되었습니다.');
                    console.log('수리 상태가 업데이트되었습니다.');
                    // 페이지 새로고침
                    window.location.reload();
                },
                error: function(xhr, status, error) {
                    // 오류 발생 시 처리하는 코드
                    console.error("상태 업데이트 중 오류 발생:", error);
                    alert('등록에 실패하였습니다.');
                }
            });
        });
    });

    /* 검색 하기 */
    function searchMachine() {
       document.getElementById('searchForm').submit();
    }
</script>

<%@ include file="../includes/footer.jsp" %>
