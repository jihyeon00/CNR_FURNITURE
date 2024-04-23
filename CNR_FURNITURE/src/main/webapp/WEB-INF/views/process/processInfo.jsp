<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="/resources/css/process.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script src="/resources/js/process.js"></script>
<%@ include file="../includes/header.jsp" %>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-md-6">
                    <h1 class="m-0"><i class="far fa-clipboard"></i> 공정정보</h1>
                </div><!-- /.col -->
                <div class="col-md-6 ml-auto">
                <form action="/D/process/processInfo" method="get">

                <div class="pro-btn">
                    <button type="submit" id="prosearchbtn" class="btn btn-primary">조희</button>
                    <button type="button" id=proaddBtn class="btn btn-default" data-toggle="modal" data-target="#register-Process-Btn">등록</button>
                </div>
            </div><!-- /.container-fluid -->
        </div>
        <div class="proheaderBar">
            <div class="process1Search">
                <div class="proName">
                    <div class="searchProbar">공정번호</div>
                    <input list="processList" id="processIdInput3" name="piId" class="processBox" value="${param.piId}">
                    <datalist id="processList">
                        <option value="">--선택--</option>
                        <c:forEach items="${processList}" var="finalP">
                            <option value="${finalP.pi_id}" ${finalP.pi_id == param.piId ? 'selected' : ''}>${finalP.pi_id} ${finalP.pi_name}</option>
                        </c:forEach>
                    </datalist>
                </div>
            </div>
              <div class="reset" onclick="resetFields()" style ="margin-top: 6px; margin-left: 70%;">
                  <a href="./processInfo"><img class="resetPng" alt="reset" src="/resources/img/reset.png" ></a>
              </div>
        </div>
        </form>
        <!-- /.content-header -->

        <!-- Main content -->
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <!-- 공정정보테이블 -->
                        <div class="ProTableName">
                            <div class="icon"><i class="fa fa-list"></i></div>
                            <div class="employee">공정정보목록</div>
                        </div>
                        <div class="table ETable">
                            <table cellpadding="0" cellspacing="0" border="0">
                                <thead class="tbl-headerPro">
                                    <th>NO</th>
                                    <th>공정번호</th>
                                    <th>공정명</th>
                                    <th>공정위치번호</th>
                                    <th>설비번호</th>

                                </thead>
                                <tbody class="tbl-content ProTable">
                                    <c:forEach items="${findPromotion}" var="findPromotion">
                                        <tr>
                                            <td>
                                                <c:out value="${findPromotion.rn}" />
                                            </td>
                                            <td>
                                                <c:out value="${findPromotion.pi_id}" />
                                            </td>
                                            <td>
                                                <c:out value="${findPromotion.pi_name}" />
                                            </td>
                                            <td>
                                                <c:out value="${findPromotion.pi_seq}" />
                                            </td>
                                            <td>
                                                <c:out value="${findPromotion.pi_machine_id}" />
                                            </td>
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

<%@ include file="../includes/footer.jsp" %>

<!-- 등록 모달 -->
<div class="modal fade" id="register-Process-Btn" tabindex="-1" role="dialog" aria-labelledby="registerProcessGridSystemModalLabel">
    <div class="modal-dialog register-Process-Modal-Dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">

                <div class="processModalTitle" id="registerProcessGridSystemModalLabel" style="font-size: 150%; font-weight:800;">공정정보등록</div>
            </div>
            <div class="modal-body1">
                <div class="row">
                    <div class="col-md-12">
                        <div class="processModal">
                            <div class="processModalBody">
                                <c:if test="${!empty message}">
                                    <div class="alert alert-info">
                                        ${message}
                                    </div>
                                </c:if>

                                <table class="processtablegubun">
                                    <tr>
                                        <th class="proTh">공정번호</th>
                                        <td class="proTd"><input type="text" class="processInput" name="pi_id" id="pi_id" placeholder="공정번호"></td>
                                        <th class="proTh">설비번호</th>
                                        <td class="proTd"> <input type="text" name="pi_machine_id" id="pi_machine_id" value="" class="processInput" placeholder="설비번호"></td>
                                        <th class="proTh">공정명</th>
                                        <td class="proTd"> <input type="text" class="processInput" name="pi_name" id="pi_name"  placeholder="공정명"/></td>
                                        <th class="proTh">공정위치</th>
                                        <td class="proTd"><input type="text" class="processInput" name="pi_seq" id="pi_seq" placeholder="공정위치"></td>

                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>


                    <div class="InnputBody1">
                        <div class="inputmedle">
                            <input list="managementVOList" name="miId" id="miId" class="processSearchInput" aria-label=".form-select-sm example" value="${managementVO.miId}"  placeholder="설비번호(설비명) 입력">
                            <datalist id="managementVOList">
                                <option value="">--선택--</option>
                                <c:forEach items="${managementVOList}" var="managementVOList">
                                    <option value="${managementVOList.miId}">${managementVOList.miId} ${managementVOList.miName}</option>
                                </c:forEach>
                            </datalist>
                        </div>
                        <div class="inputmedle1">
                            <button type="button" id="prosearchbtnpVO" class="btn btn-primary" onclick="searchManagementVO()">조회</button>
                            <button type="button" id="resetBtn" class="btn btn-default">리셋</button>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-5 maginPro">
                            <!-- 설비목록 테이블 -->
                            <div class="ETableTitle ">
                                <div class="icon"><i class="fa fa-list"></i></div>
                                <div class="employee">설비목록</div>
                                <div class="procexxIcon"><button class="buttonSession" id="addSelected" style="border-style: gray;"><i class="fa fa-fw fa-plus"></i></button></div>
                            </div>
                            <div class="table ProTable5">
                                <table cellpadding="0" cellspacing="0" border="0">
                                    <colgroup>
                                        <col style="width: 5%" />
                                        <col style="width: 10%" />
                                        <col style="width: 20%" />
                                        <col style="width: 10%" />
                                    </colgroup>
                                    <thead class="tbl-headerPro">
                                        <tr>
                                            <th><input type="checkbox" name="checkAll1" id="checkAll1"></th>
                                            <th>설비번호</th>
                                            <th>설비명</th>
                                            <th>설비유형</th>
                                        </tr>
                                    </thead>
                                    <tbody class="tbl-content ProTable3" id="mng">
                                        <!-- 설비목록 데이터 -->
                                        <c:forEach items="${managementVOList}" var="mng">
                                            <tr>
                                                <td><input type="checkbox"></td>
                                                <td class="miId">
                                                    <c:out value="${mng.miId}" />
                                                </td>
                                                <td>
                                                    <c:out value="${mng.miName}" />
                                                </td>
                                                <td>
                                                    <c:out value="${mng.miType}" />
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <div class="col-sm-1">
                        </div>
                        <div class="col-md-5 Promargin">
                            <!-- 추가된 설비목록 테이블 -->
                            <div class="ETableTitle">
                                <div class="icon"><i class="fa fa-list"></i></div>
                                <div class="employee">추가된 설비목록</div>
                                <div class="processIcon"><button class="buttonSession" id="addSelected2"><i class="fa fa-fw fa-plus"></i></button></div>
                                <div class="processIcon1"><button class="buttonSession" id="removeSelected"><i class="fa fa-fw fa-minus"></i></button></div>
                            </div>
                            <div class="table ProTable5">
                                <table cellpadding="0" cellspacing="0" border="0">
                                    <colgroup>
                                        <col style="width: 5%" />
                                        <col style="width: 10%" />
                                        <col style="width: 20%" />
                                        <col style="width: 10%" />
                                    </colgroup>
                                    <thead class="tbl-headerPro">
                                        <tr>
                                            <th><input type="checkbox" name="checkAll2" id="checkAll2"></th>
                                            <th>설비번호</th>
                                            <th>설비명</th>
                                            <th>설비유형</th>
                                        </tr>
                                    </thead>
                                    <tbody class="tbl-content ProTableAdd" id="addedMng">
                                        <!-- 추가된 설비목록 데이터 -->
                                        <c:forEach items="${addedMng}" var="machine">
                                            <input type="hidden" name="selectedMachineIds" value="${machine.miId}" />
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div><!-- /.row -->
                </div><!-- /.modal-body -->
                <!-- 모달 바닥글 -->
                <div class="modal-footer" style="margin-right: 3%;">
                    <button type="submit" class="btn btn-primary" onClick="insertProjectBox()">공정등록</button>
                    <button type="button" id="prosearchbtn" class="btn btn-info"> <a href="http://localhost:8085/machine/machineInfo" style="color: fff;">설비수정</a></button>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
                </div>
            </div><!-- /.modal-content -->
            </form>
        </div>
    </div>


    <script src="/resources/js/process.js"></script>

    <script>
        /*공정정보 등록시 사용하는 메소드 */
        function insertProject() {
            console.log('설비번호:', $('#pi_machine_id').val()); // 설비번호 로그 출력
            console.log('공정명:', $('#pi_name').val()); // 공정명 로그 출력
            console.log('공정위치:', $('#pi_seq').val()); // 공정위치 로그 출력
            console.log('공정번호:', $('#pi_id').val()); // 공정번호 로그 출력

            return (
                $('#pi_machine_id').val() && $('#pi_seq').val() && $('#pi_name').val() && $('#pi_id').val()

            );
        }

        /*공정정보 등록시 사용하는 메소드 */
        $(document).ready(function() {
            window.insertProjectBox = function() {
                console.log('insertProjectBox:', $('#pi_id').val());

                if (!insertProject()) {
                    Swal.fire({
                        title: '입력 오류',
                        text: '모든 정보를 입력하세요.',
                        icon: 'error',
                        confirmButtonColor: '#48088A'
                    });
                    return;
                }

                Swal.fire({
                    title: '정말 게시하겠습니까?',
                    text: '게시 후 삭제할 수 없습니다.',
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: '확인',
                    cancelButtonText: '취소',
                    reverseButtons: true
                }).then(result => {
                    if (result.isConfirmed) {
                        var formData = {
                            pi_id: $('#pi_id').val(),
                            pi_machine_id: $('#pi_machine_id').val(),
                            pi_name: $('#pi_name').val(),
                            pi_seq: $('#pi_seq').val()

                        };

                        $.ajax({
                            type: "POST",
                            url: '/processInfoInsert',
                            data: formData,
                            success: function(response) {
                                Swal.fire('게시가 완료되었습니다. 설비를 수정해 주세요', '', 'success');
                                Swal.fire('설비를 수정해 주세요', '', 'info');
                            },
                            error: function(xhr, status, error) {
                                Swal.fire('게시 실패', '서버 에러: ' + error, 'error');
                            }
                        });
                    } else if (result.isDismissed) {
                        Swal.fire('게시가 취소되었습니다.', '', 'info');
                    }
                });
            };
        });
    </script>