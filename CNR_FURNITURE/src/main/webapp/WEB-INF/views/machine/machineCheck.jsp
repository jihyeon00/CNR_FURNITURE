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
                <h1 class="m-0"><i class="far fa-clipboard"></i>설비 체크리스트 작성</h1>
              </ol>
              <ol class="breadcrumb float-sm-right">
                <div class="reset">
                  <a href="./machineCheck"><img class="resetPng" alt="reset" src="/resources/img/reset.png"></a>
                </div>
              </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
        <div class="headerBar">
            <form action="machineCheck" method="get" id="searchForm">
                <div class="machineSearch">
                    <div class="machineName">
                        <div class="searchMachine">설비명</div>
                        <select class="onchangeMachineName"  id="find_machine_id" name="find_machine_id">
                          <option value="설비선택" disabled selected>설비선택</option>
                          <c:forEach var="list" items = "${getMachineInfo}">
                            <option value='${list.mi_id}'  ${searchMachineVO.find_machine_id == (list.mi_id) ? 'selected="selected"' : ''}>${list.mi_name}
                            </option>
                          </c:forEach>
                        </select>
                    </div>
                    <div class="machineCheckWriter">
                        <div class="searchMachine">작성자</div>
                        <input type="search" name="machineCheckWriterBox" class="machineCheckWriterBox" id="machineCheckWriterBox" placeholder="사원번호를 입력해주세요" class="machineBox" value="${param.machineCheckWriterBox}" autocomplete="off">
                    </div>
                    <div class="machineCheckDate">
                        <div class="searchMachine">작성일</div>
                        <input type="date" name="machineCheckDateBox" class="machineCheckDateBox" id="machineCheckDateBox" class="machineBox" value="${param.machineCheckDateBox}" autocomplete="off">
                    </div>
                    <div class="machineCheckSave">
                        <button type="submit" id="searchbtn" class="btn btn-block btn-primary" onClick="search();"><i class="fa-solid fa-magnifying-glass"></i>&nbsp;검색</button>
                    </div>
                </div>
            </form>
        </div>
        <!-- /.content-header -->

        <!-- Main content -->
            <!-- Main content -->
            <form action="./machineCheck" id="machineCheck" method="post" onSubmit="return false">
                <div class="content">
                  <div class="container-fluid">
                    <div class="row">
                    <input type="hidden" name="mcr_mi_id" id="mcr_mi_id" value="${param.find_machine_id}">
                    <input type="hidden" name="mcr_emp_id" id="mcr_emp_id" value="${param.machineCheckWriterBox}">
                    <input type="hidden" name="mcr_date" id="mcr_date" value="${param.machineCheckDateBox}">
                      <div class="table" style="height:550px; overflow-y: auto;">
                        <table cellpadding="0" cellspacing="0" border="0">
                          <thead class="tbl-header">
                            <tr>
                              <th>No</th>
                              <th>설비관리유형</th>
                              <th>점검방법</th>
                              <th>체크리스트 조건</th>
                              <th>Y / N</th>
                              <th>비고</th>
                              <th>저장</th>
                            </tr>
                          </thead>
                          <tbody class="tbl-content">
                            <input type="hidden" name="mcr_mci_id" id="mcr_mci_id" value="">
                            <input type="hidden" name="mcr_answer" id="mcr_answer" value="">
                            <input type="hidden" name="mcr_note" id="mcr_note" value="">
                            <c:forEach items="${getMachineCheckAll}" var="getMachineCheckAll" varStatus="status">
                                <tr>
                                  <input type="hidden" name="mcr_mci_id<c:out value='${status.index}' />" id="mcr_mci_id<c:out value='${status.index}' />" value="<c:out value='${getMachineCheckAll.mci_id}' />">
                                  <td id="rownum<c:out value='${status.index}' />"><c:out value="${getMachineCheckAll.rownum}" /></td>
                                  <td id="mci_div<c:out value='${status.index}' />"><c:out value="${getMachineCheckAll.mci_div}" /></td>
                                  <td id="mci_method<c:out value='${status.index}' />"><c:out value="${getMachineCheckAll.mci_method}" /></td>
                                  <td id="mci_condition<c:out value='${status.index}' />"><c:out value="${getMachineCheckAll.mci_condition}" /></td>
                                  <td>
                                      <div class="">
                                        <input type="radio" id="Y<c:out value='${status.index}' />" name="mcr_answer<c:out value='${status.index}' />" value="Y">/
                                        <input type="radio" id="N<c:out value='${status.index}' />" name="mcr_answer<c:out value='${status.index}' />" value="N">
                                      </div>
                                  </td>
                                  <td><input type="text" id="mcr_note<c:out value='${status.index}' />" name="mcr_note<c:out value='${status.index}' />" class="machineCheckText" autocomplete="off"></td>
                                  <td button type="submit" id="machineCheckSave" class="btn btn-block btn-Secondary" onClick="javascript: machineCheckSave(<c:out value='${getMachineCheckAll.mci_id}' />, <c:out value='${status.index}' />);">저장</button></td>
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
            </form>
        <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->


  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->

<script>
    // 설비선택 value 값 '' 주기
    $(document).ready(function() {
        $("#find_machine_id option[value='설비선택']").val('');
    });

    // 검색 버튼
    function search() {
        document.getElementById('searchForm').submit();
    }

    // 저장하기
    function machineCheckSave(mcr_mci_id, index){
       // mcr_mci_id 값 넣어주기
       $("#mcr_mci_id").val(mcr_mci_id);

       // mcr_answer, mcr_note 값 넣어주기
       var mcr_answer = $("input:radio[name='mcr_answer"+index+"']:checked").val();
       var mcr_note = $("#mcr_note"+ index).val();

        $("#mcr_answer").val(mcr_answer);
        $("#mcr_note").val(mcr_note);

        // 첫 번째 폼에서 가져온 값들
        var mcr_mi_id = $("#find_machine_id").val();
        var mcr_emp_id = $("#machineCheckWriterBox").val();
        var mcr_date = $("#machineCheckDateBox").val();

        // hidden input에 설정
        $("#mcr_mi_id").val(mcr_mi_id);
        $("#mcr_emp_id").val(mcr_emp_id);
        $("#mcr_date").val(mcr_date);

        // ajax 사용해서 값 넘기기
        data = JSON.stringify({
                mcr_mci_id: mcr_mci_id,
                mcr_mi_id: mcr_mi_id,
                mcr_emp_id: mcr_emp_id,
                mcr_date: mcr_date,
                mcr_answer : mcr_answer,
                mcr_note: mcr_note
        });

        // ajax 로 데이터 전송
        $.ajax({
            type: "POST",
            url: "./machineCheckAdd",
            data: data,
            contentType : "application/json; charset=utf-8",
            success: function(result, status, xhr) {
                // 성공적으로 저장되면 알림 메시지 표시
                alert('체크리스트가 작성되었습니다.');
            },
            error: function(xhr, status, error) {
                // 에러 발생 시 에러 메시지 표시
                console.error(xhr.responseText);
                alert('오류가 발생했습니다. 다시 시도해주세요.');
            }
        });
    }

// 실제 form의 action의 값으로 전송 (reload 돼서 사용하면 안됨)
//        document.getElementById('machineCheck').submit();
//        alert('체크리스트가 작성되었습니다.');

</script>

<%@ include file="../includes/footer.jsp" %>
