<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<script src="/resources/js/process.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

<!--날짜 포맷팅-->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<link rel="stylesheet" href="/resources/css/process.css">
<%@ include file="../includes/header.jsp" %>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-md-6">
                    <h1 class="m-0"><i class="far fa-clipboard"></i> 제조지시</h1>
                </div><!-- /.col -->
                <div class="col-md-6 ml-auto">
                    <form action="/manufacturingInstruction" method="get">
                        <div class="pro-btn">
                            <button type="submit" class="btn btn-primary">조회</button>
                            <button type="button" class="btn btn-default" data-toggle="modal" data-target="#register-Process-Btn">등록</button>
                        </div>

                </div><!-- /.col -->
            </div><!-- /.container-fluid -->
        </div>
        <!-- /.content-header -->

        <!-- Main content -->
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <!-- 검색창 -->
                    <div class="col-md-12 prosearchBer">
                        <div class="col-sm-1 prosb-name">계획일자</div>
                        <div class="col-sm-2 prosb-text">
                            <input type="date" class="col-sm-12 sb-text1" id="startDate" name="startDate" value='<c:out value="${processDate.startDate}"/>'/>
                            <p class="textPro"> ~ </p>
                            <input type="date" class="col-sm-12 sb-text1" id="endDate" name="endDate" value='<c:out value="${processDate.endDate}"/>' />
                        </div>

                        <div class="col-sm-1 prosb-name">제품번호</div>
                        <select class="col-sm-2 prosb-text" aria-label=".form-select-sm example" name="find_item_process">
                            <option value="">--선택--</option>
                            <c:forEach items="${itemProList}" var="item">
                                <option value="${item.i_id}" ${item.i_id == processDate.find_item_process ? 'selected' : ''}>${item.i_id} ${item.i_name}</option>
                            </c:forEach>
                        </select>
                    </div>
                    </form>
                </div><!-- /.row -->

                <div class="row">
                    <div class="col-md-12">
                        <!--제조지시 테이블 -->
                        <div class="ProTableName">
                            <div class="icon"><i class="fa fa-list"></i></div>
                            <div class="process">제조지시목록</div>
                        </div>
                        <div class="table ProTable">
                            <table cellpadding="0" cellspacing="0" border="0">
                                <thead class="tbl-headerPro">
                                <th>NO</th>
                                <th>제조LOT번호</th>
                                <th>공정번호</th>
                                <th>계약번호</th>
                                <th>계획착수일</th>
                                <th>계획완수일</th>
                                <th>제품번호</th>
                                <th>계획수량</th>
                                </thead>
                                <tbody class="tbl-content ProTable">
                                <c:forEach var="ProSearch" items="${proList}">
                                    <tr>
                                        <td><c:out value="${ProSearch.rn}"/></td>
                                        <td><c:out value="${ProSearch.ins_lot_id}"/></td>
                                        <td><c:out value="${ProSearch.ins_pi_id}"/></td>
                                        <td><c:out value="${ProSearch.ins_ct_id}"/></td>
                                        <td><c:out value="${ProSearch.ins_start_date}" /></td>
                                        <td><c:out value="${ProSearch.ins_end_date}"  /></td>
                                        <td><c:out value="${ProSearch.ins_item_id}"/></td>
                                        <td><c:out value="${ProSearch.ins_lot_size}"/></td>
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


<!-- Modal -->
<!-- 등록 모달 -->
<div class="modal fade" id="register-Process-Btn" tabindex="-1" role="dialog" aria-labelledby="registerProcessGridSystemModalLabel">
    <div class="modal-dialog register-Process-Modal-Dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <div class="processModalTitle" id="registerProcessGridSystemModalLabel" style="font-size: 150%; font-weight:800;">제조지시등록</div>
            </div>
            <div class="modal-body1">
                <div class="row">
                    <div class="col-md-12">
                        <div class="processModal">
                          <form action="./manufacturingInstructionInsert" method="post" id="insertProForm">
                            <div class="processModalBody">
                                <table class="processtablegubun">
                                    <tr>
                                        <th class ="proTh" >담당사원번호</th>
                                        <td class ="proTd"><input type="text" class="processInput" id="ins_emp_id" name="ins_emp_id"></td>
                                        <th class ="proTh">제품번호</th>
                                        <td class ="proTd"><input type="text" class="processInput" id="ins_item_id" name="ins_item_id"> </td>
                                        <th class ="proTh">제조LOT번호</th>
                                        <td class ="proTd"><input type="text" class="processInput" id="ins_lot_id" name="ins_lot_id"></td>
                                    </tr>
                                        <th class ="proTh">계약번호</th>
                                        <td class ="proTd"><input type="text" class="processInput" id="ins_ct_id" name="ins_ct_id"></td>
                                        <th class ="proTh">공정번호</th>
                                        <td class ="proTd">
                                            <select class="col-sm-12 processInput" aria-label=".form-select-sm example" id="ins_pi_id"  name="ins_pi_id">
                                                <option value="">--선택--</option>
                                                <c:forEach items="${piProList}" var="pi">
                                                    <option value="${pi.pi_id}" >
                                                            ${pi.pi_id}    ${pi.pi_name}  ( ${pi.pi_seq} )
                                                    </option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                        <th class ="proTh">계획수량</th>
                                        <td class ="proTd"><input type="text" class="processInput" id="ins_lot_size" name="ins_lot_size"></td>
                                    </tr>
                                    <tr>
                                        <th class ="proTh">계획착수일</th>
                                        <td class ="proTd"><input type="date" class="processInput" id="ins_start_date" name ="ins_start_date"></td>
                                        <th class ="proTh">계획완수일</th>
                                        <td class ="proTd"><input type="date" class="processInput" id="ins_end_date" name="ins_end_date"></td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                 </form>
                        <form id="modalSearchForm" action="/manufacturingInstruction" method="get" onsubmit="return sendFormWithAjax();">
                            <div class="InnputBody">
                                <div class="inputmedle">
                                    <input type="date" class="processSearchInput" id="ctStartDate" name="ctStartDate" value='<c:out value="${processDate.ctStartDate}"/>' />
                                </div>
                                <p class="textPro1"> ~ </p>
                                <div class="inputmedle">
                                    <input type="date" class="processSearchInput" id="ctEndDate" name="ctEndDate"  value='<c:out value="${processDate.ctEndDate}"/>'  />
                                </div>
                                <div class="inputmedle1">
                                    <button type="submit" id="prosearchbtn" class="btn btn-primary sInput">조회</button>
                                </div>
                            </div>
                        </form>
                   </div>
                <div class="row">
                    <div class="col-md-8 maginPro">
                        <!-- 계약목록 테이블 -->
                        <div class="ETableTitle">
                            <div class="icon"><i class="fa fa-list"></i></div>
                            <div class="employee">계약목록</div>
                        </div>
                        <div class="table DTable">
                            <table cellpadding="0" cellspacing="0" border="0" id="contractListTable">
                                <colgroup>
                                    <col style="width: 5%" />
                                    <col style="width: 10%" />
                                    <col style="width: 10%" />
                                    <col style="width: 10%" />
                                    <col style="width: 10%" />
                                    <col style="width: 10%" />
                                </colgroup>
                                <thead class="tbl-headerPro">
                                <tr>
                                    <th>NO</th>
                                    <th>계약번호</th>
                                    <th>제품번호</th>
                                    <th>계약수량</th>
                                    <th>계약체결일</th>
                                    <th>계약출고일</th>
                                </tr>
                                </thead>
                                <tbody class="tbl-content ProTable1">
                                <!-- 계약 목록 데이터 -->
                                <c:forEach var="ct" items="${ctProList}">
                                    <tr>
                                        <td><c:out value="${ct.rn}"/></td>
                                        <td><c:out value="${ct.ct_id}"/></td>
                                        <td><c:out value="${ct.ct_item_id}"/></td>
                                        <td><c:out value="${ct.ct_quantity}"/></td>
                                        <td><c:out value="${ct.ct_date}" /></td>
                                        <td><c:out value="${ct.ct_ob_date}" /></td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div><!-- /.row -->
            </div><!-- /.modal-body -->
            <!-- 모달 바닥글 -->
            <div class="modal-footer" style="margin-right: 3%;">
                <button type="submit" class="btn btn-primary" onClick ="insertProBox()">등록</button>
                <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
            </div>
        </div><!-- /.modal-content -->
    </div>
</div>

<!-- Control Sidebar -->
<aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
</aside>

<%@ include file="../includes/footer.jsp" %>

<script>
    window.onload = function() {
        var selectedItem = "<c:out value='${processDate.find_item_process}'/>";
        if (selectedItem) {
            var selectElement = document.querySelector('select[name="find_item_process"]');
            selectElement.value = selectedItem;
        }
    };
</script>
