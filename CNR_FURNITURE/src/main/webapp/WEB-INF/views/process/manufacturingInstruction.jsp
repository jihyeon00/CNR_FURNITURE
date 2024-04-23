<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.3.1/jspdf.umd.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jspdf-autotable@3.5.23/dist/jspdf.plugin.autotable.min.js"></script>
<script type="text/javascript" src="/resources/js/fileFont/jspdf.js"></script>
<script type="text/javascript" src="/resources/js/fileFont/auto_table.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/babel-polyfill/7.12.1/polyfill.min.js" integrity="sha512-uzOpZ74myvXTYZ+mXUsPhDF+/iL/n32GDxdryI2SJronkEyKC8FBFRLiBQ7l7U/PTYebDbgTtbqTa6/vGtU23A==" crossorigin="anonymous"></script>
<script type="text/javascript" src="/resources/js/fileFont/gulim.js"></script>
<script src="/resources/js/process.js"></script>

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
                    <form action="/manufacturingInstruction" method="get" class ="formPro">

                        <div class="pro-btn">
                            <button type="button" class="btn btn-default" data-toggle="modal" data-target="#register-Process-Btn">등록</button>
                        </div>

            </div><!-- /.container-fluid -->
        </div>
        <!-- /.content-header -->

        <!-- Main content -->
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <!-- 검색창 -->
                    <div class="col-md-12 prosearchBer">
                        <div class="col-sm-2 prosb-name">계획일자</div>
                        <div class="col-sm-2 prosb-text">
                            <input type="date" class="col-sm-12 sb-text1" id="startDate" name="startDate" value='<c:out value="${processDate.startDate}"/>'/>
                            <p class="textPro"> ~ </p>
                            <input type="date" class="col-sm-12 sb-text1" id="endDate" name="endDate" value='<c:out value="${processDate.endDate}"/>' />
                        </div>
                        <div class="col-sm-2 prosb-name">제품번호</div>
                        <div class="col-sm-2 prosb-text">
                             <br><br><br>
                            <input list="itemProcessList" name="find_item_process" class="col-sm-12 textTest" aria-label=".form-select-sm example" value="${processDate.find_item_process}">
                            <datalist id="itemProcessList">
                                <option value="">--선택--</option>
                                <c:forEach items="${itemProList}" var="item">
                                    <option value="${item.i_id}">${item.i_id} ${item.i_name}</option>
                                </c:forEach>
                            </datalist>
                        </div>
                        <div class="col-md-1 ">
                            <div class="sb-buttons">
                             <button type="submit" class="btn btn-primary asb">조회</button>
                                <button type="button" class="btn btn-reset" id="" onClick="location.href='/manufacturingInstruction'">
                                    <img class="resetPng" alt="reset" id="btn-reset" src="/resources/img/reset.png">
                                  </button>
                            </div>
                             <!-- <div class="col-sm-12 proimage" >
                                  <div class="reset" onclick="resetFields()">
                                      <a href="./manufacturingInstruction"><img class="resetPng" alt="reset" src="/resources/img/reset.png" ></a>
                             </div> --><!-- /.col -->
                             <br>
                        </div>
                    </form>
                </div><!-- /.row -->

                <div class="row">
                    <div class="col-md-12">
                        <!--제조지시 테이블 -->
                        <div class="ProTableName">
                            <div class="icon"><i class="fa fa-list"></i></div>
                            <div class="process">제조지시목록</div>
                            <div class="processIcon2"><button onClick ="checkboxArrPro()" class="buttonAddCt" data-toggle="modal" data-target="#register-Process-Btn2" id="addCt">계약 내역서</button></div>
                        </div>
                        <div class="table ETable">
                            <table cellpadding="0" cellspacing="0" border="0">
                                <thead class="tbl-headerPro">
                                <th></th>
                                <th>제조LOT번호</th>
                                <th>계약번호</th>
                                <th>계획착수일</th>
                                <th>계획완수일</th>
                                <th>제품번호</th>
                                <th>계획수량</th>
                                </thead>
                                <form action="/manufacturingInstructionForm" id="searchContractInfo" method="get"  onSubmit="return false">
                                    <tbody class="tbl-content ProTable" id="proList">
                                    <c:forEach var="ProSearch" items="${proList}">
                                        <tr>
                                            <td><input type="checkbox" class ="cityPro" id="checkCt">
                                                <input type="hidden" id="formattedIds" name="formattedIds" value="">
                                            </td>
                                            <td><c:out value="${ProSearch.ins_lot_id}"/></td>
                                            <td><div id="ctProAjax"><c:out value="${ProSearch.ins_ct_id}"/></div></td>
                                            <td><c:out value="${ProSearch.ins_start_date}" /></td>
                                            <td><c:out value="${ProSearch.ins_end_date}"  /></td>
                                            <td><c:out value="${ProSearch.ins_item_id}"/></td>
                                            <td><c:out value="${ProSearch.ins_lot_size}"/></td>
                                        </tr>
                                    </c:forEach>
                                </form>
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
                                <table class="processtablegubun" id="inputTable">
                                    <tr>
                                        <th class ="proTh" >담당사원번호</th>
                                        <td class ="proTd"><input type="text" class="processInput" id="ins_emp_id" name="ins_emp_id"></td>
                                        <th class ="proTh">제품번호</th>
                                        <td class ="proTd"><input type="text" class="processInput" id="ins_item_id" name="ins_item_id" readonly> </td>
                                        <th class ="proTh">제조LOT번호</th>
                                        <td class ="proTd"><input type="text" class="processInput" id="ins_lot_id" name="ins_lot_id"></td>
                                    </tr>
                                        <th class ="proTh">계약번호</th>
                                        <td class ="proTd"><input type="text" class="processInput" id="ins_ct_id" name="ins_ct_id" readonly></td>
                                        <th class ="proTh">공정번호</th>
                                        <td class ="proTd">
                                            <input list="piProList" name="ins_pi_id" id="ins_pi_id" class="col-sm-12 processInput" aria-label=".form-select-sm example" placeholder="--선택--">
                                            <datalist id="piProList">
                                                <option value=""></option>
                                                <c:forEach items="${piProList}" var="pi">
                                                    <option value="${pi.pi_id}">${pi.pi_id}    ${pi.pi_name}  ( ${pi.pi_seq} )</option>
                                                </c:forEach>
                                            </datalist>
                                        </td>
                                        <th class ="proTh">계획수량</th>
                                        <td class ="proTd"><input type="text" class="processInput" id="ins_lot_size" name="ins_lot_size" readonly></td>
                                    </tr>
                                    <tr>
                                        <th class ="proTh">계획착수일</th>
                                        <td class ="proTd"><input type="date" class="processInput" id="ins_start_date" name ="ins_start_date"></td>
                                        <th class ="proTh">계획완수일</th>
                                        <td class ="proTd"><input type="date" class="processInput" id="ins_end_date" name="ins_end_date"></td>
                                    </tr>
                                </table>
                            </div>
                            <div class="addJejo">
                             <a href="#" class="btn btn-primary" onclick="addRow()">추가</a>
                             <a href="#" class="btn btn-default" onclick="submitInstructions()">등록</a>
                           </div>
                        </div>
                         </form>
                    </div>
                 </form>
            <div class="row">
                    <div class="col-md-11 maginPro">
                        <div class="table DOsetTable">
                          <form id="insertProForm">
                            <table cellpadding="0" cellspacing="0" border="0" id="instructionTable">
                                <colgroup>
                                    <col style="width: 12%" />
                                    <col style="width: 10%" />
                                    <col style="width: 12%" />
                                    <col style="width: 9%" />
                                    <col style="width: 9%" />
                                    <col style="width: 10%" />
                                    <col style="width: 12%" />
                                    <col style="width: 11%" />
                                    <col style="width: 8%" />
                                </colgroup>
                                <thead class="tbl-headerPro">
                                        <tr>
                                            <th>담당사원번호</th>
                                            <th>제품번호</th>
                                            <th>제조LOT번호</th>
                                            <th>계약번호</th>
                                            <th>공정번호</th>
                                            <th>계획수량</th>
                                            <th>계획착수일</th>
                                            <th>계획완수일</th>
                                            <th>삭제</th>
                                        </tr>
                                    </thead>
                                <tbody class="tbl-content" id="instructionBody">
                                <!-- 다중 insert -->

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div><!-- /.row -->

                        <form class ="formPro" id="modalSearchForm" action="/manufacturingInstruction" method="get" onsubmit="return sendFormWithAjax();">
                            <div class="InnputBody">
                                <div class="inputmedle">
                                    <input type="date" class="processSearchInput" id="ctStartDate" name="ctStartDate" value='<c:out value="${processDate.ctStartDate}"/>' />
                                </div>
                                <p class="textPro1"> ~ </p>
                                <div class="inputmedle">
                                    <input type="date" class="processSearchInput" id="ctEndDate" name="ctEndDate"  value='<c:out value="${processDate.ctEndDate}"/>'  />
                                </div>
                                <div class="inputmedle1">
                                    <button type="button" id="prosearchbtn" class="btn btn-primary sInput" <button type="submit" id="prosearchbtn" class="btn btn-primary sInput" onclick="sendFormWithAjax(event)">조회</button>
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
                            <div class="processIcon6"><button class="buttonSession" id="addText" ><i class="fa fa-fw fa-plus"></i></button></div>
                        </div>
                        <div class="table DOTable1">
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
                                <tbody class="tbl-content ProTable1" id="ctProList">
                                <!-- 계약 목록 데이터 -->
                                <c:forEach var="ct" items="${ctProList}">
                                    <tr>
                                        <td><input type="checkbox" name="checkAll3" id="checkAll3"></td>
                                        <td><c:out value="${ct.ct_id}"/></td>
                                        <td><c:out value="${ct.ct_item_id}"/></td>
                                        <td><c:out value="${ct.ct_quantity}"/></td>
                                        <td><c:out value="${ct.ct_date}" /></td>
                                        <td><c:out value="${ct.ct_ob_date}" /></td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                            </form>
                        </div>
                    </div>
                </div><!-- /.row -->
            </div><!-- /.modal-body -->
            <!-- 모달 바닥글 -->
            <div class="modal-footer" style="margin-right: 3%;">
                <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
            </div>
        </div><!-- /.modal-content -->
    </div>
</div>


<!-- Modal -->
<!--계약 모달 -->
<div class="modal fade" id="register-Process-Btn2" tabindex="-1" role="dialog" aria-labelledby="registerProcessGridSystemModalLabel">
    <div class="modal-dialog register-Process-Modal-Dialog" role="document">
        <div class="modal-content">
            <div class="modal-header modalCtPr">
                <div class="processModalTitle" id="registerProcessGridSystemModalLabel" style="font-size: 150%; font-weight:800;"></div>
            </div>
                <div class="modal-body1">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="processModal">
                                <h1 class="cth1">제품 공급 계약 내역서</h1>
                                        <p class= "ctP1"></p>
                                    <section>
                                        <table class="tablectP" id="resultsTable">
                                            <thead  class="tablectcP">
                                                <tr>
                                                    <th>계약번호</th>
                                                    <th>거래처</th>
                                                    <th>제품명</th>
                                                    <th>계약금</th>
                                                    <th>계약수량</th>
                                                    <th>계약수량단위</th>
                                                    <th>계약체결일</th>
                                                    <th>계약출고일</th>
                                                </tr>
                                            </thead>
                                            <tbody class="tbl-content ProTable15" id="ctProLis">
                                            </table>
                                     </section>
                                        <p class= "ctP1">계약 당사자 서명:  <strong>C&R Furniture</strong></p>
                                        <p class= "ctP" onclick="updateDateDisplay()">날짜:</p>
                                  </div>
                              </div>
                          </div><!-- /.row -->
                      </div><!-- /.modal-body -->
                      <!-- 모달 바닥글 -->
                      <div class="modal-footer" style="margin-right: 3%;">
                          <button type="button" class="btn btn-success" onclick="generatePDF()">PDF로 보기</button>
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
    <script src="/resources/js/process.js"></script>
    <script>
        window.onload = function() {
            var selectedItem = "<c:out value='${processDate.find_item_process}'/>";
            if (selectedItem) {
                var selectElement = document.querySelector('select[name="find_item_process"]');
                selectElement.value = selectedItem;
            }
        };
    </script>
