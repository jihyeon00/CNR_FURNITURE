<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

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
            <div class="pro-btn">
              <button type="button" id="prosearchbtn" class="btn btn-primary">조희</button>
                <button type="button" id= proaddBtn class="btn btn-default" data-toggle="modal" data-target="#register-Process-Btn">등록</button>
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
                <input type="date" class="col-sm-12 sb-text1" id="" name=""/>
                <p class="textPro"> ~ </p>
                <input type="date" class="col-sm-12 sb-text1" id="" name=""/>
            </div>
            <div class="col-sm-1 prosb-name">제품번호</div>
              <select class="col-sm-2 prosb-text" aria-label=".form-select-sm example">
                    <option selected></option>
                    <option value="1">One</option>
                    <option value="2">Two</option>
                    <option value="3">Three</option>
              </select>
            </div>
          <div class="col-md-12">
            <!--제조지시 테이블 -->
            <div class="ETableName">
              <div class="icon"><i class="fa fa-list"></i></div>
              <div class="process">제조지시목록</div>
            </div>
            <div class="table ETable">
              <table cellpadding="0" cellspacing="0" border="0">
                <thead class="tbl-header">
                       <th>NO</th>
                       <th>제조LOT번호</th>
                       <th>공정번호</th>
                       <th>계약번호</th>
                       <th>계획착수일</th>
                       <th>계획완수일</th>
                       <th>제품번호</th>
                       <th>계획수량</th>
                </thead>
                <tbody class="tbl-content ETable">
                      <tr>
                        <td>1</td>
                        <td>2</td>
                        <td>3</td>
                        <td>4</td>
                        <td>5</td>
                        <td>6</td>
                        <td>7</td>
                        <td>7</td>
                      </tr>
                      <tr>
                        <td>1</td>
                            <td>2</td>
                            <td>3</td>
                            <td>4</td>
                            <td>5</td>
                            <td>6</td>
                            <td>7</td>
                            <td>7</td>
                      </tr>
                      <tr>
                        <td>1</td>
                            <td>2</td>
                            <td>3</td>
                            <td>4</td>
                            <td>5</td>
                            <td>6</td>
                            <td>7</td>
                            <td>7</td>
                      </tr>
                      <tr>
                        <td>1</td>
                            <td>2</td>
                            <td>3</td>
                            <td>4</td>
                            <td>5</td>
                            <td>6</td>
                            <td>7</td>
                            <td>7</td>
                      <tr>
                        <td>1</td>
                            <td>2</td>
                            <td>3</td>
                            <td>4</td>
                            <td>5</td>
                            <td>6</td>
                            <td>7</td>
                            <td>7</td>
                      </tr>
                      <tr>
                        <td>1</td>
                            <td>2</td>
                            <td>3</td>
                            <td>4</td>
                            <td>5</td>
                            <td>6</td>
                            <td>7</td>
                            <td>7</td>
                      </tr>
                      <tr>
                         <td>1</td>
                          <td>2</td>
                          <td>3</td>
                          <td>4</td>
                          <td>5</td>
                          <td>6</td>
                          <td>7</td>
                          <td>7</td>
                      </tr>
                      <tr>
                          <td>1</td>
                          <td>2</td>
                          <td>3</td>
                          <td>4</td>
                          <td>5</td>
                          <td>6</td>
                          <td>7</td>
                          <td>7</td>
                      </tr>
                      <tr>
                          <td>1</td>
                          <td>2</td>
                          <td>3</td>
                          <td>4</td>
                          <td>5</td>
                          <td>6</td>
                          <td>7</td>
                          <td>7</td>
                      </tr>
                      <tr>
                          <td>1</td>
                          <td>2</td>
                          <td>3</td>
                          <td>4</td>
                          <td>5</td>
                          <td>6</td>
                          <td>7</td>
                          <td>7</td>
                      </tr>
                      <tr>
                          <td>1</td>
                          <td>2</td>
                          <td>3</td>
                          <td>4</td>
                          <td>5</td>
                          <td>6</td>
                          <td>7</td>
                          <td>7</td>
                      </tr>
                      <tr>
                          <td>1</td>
                          <td>2</td>
                          <td>3</td>
                          <td>4</td>
                          <td>5</td>
                          <td>6</td>
                          <td>7</td>
                          <td>7</td>
                      </tr>
                      <tr>
                          <td>1</td>
                          <td>2</td>
                          <td>3</td>
                          <td>4</td>
                          <td>5</td>
                          <td>6</td>
                          <td>7</td>
                          <td>7</td>
                      </tr>
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
                            <div class="processModalBody">
                                <table class="processtablegubun">
                                    <tr>
                                        <th class ="proTh">담당사원번호</th>
                                        <td class ="proTd"><input type="text" class="processInput"></td>
                                        <th class ="proTh">제품번호</th>
                                        <td class ="proTd"><input type="text" class="processInput"></td>
                                        <th class ="proTh">제조LOT번호</th>
                                        <td class ="proTd"><input type="text" class="processInput"></td>
                                    <tr>
                                        <th class ="proTh">계약번호</th>
                                        <td class ="proTd"><input type="text" class="processInput"></td>
                                        <th class ="proTh">공정번호</th>
                                        <td class ="proTd"><input type="text" class="processInput"></td>
                                        <th class ="proTh">계획수량</th>
                                        <td class ="proTd"><input type="text" class="processInput"></td>
                                    </tr>
                                    <tr>
                                        <th class ="proTh">계획착수일</th>
                                        <td class ="proTd"><input type="date" class="processInput"></td>
                                        <th class ="proTh">계획완수일</th>
                                        <td class ="proTd"><input type="date" class="processInput"></td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>

                    <div class="InnputBody">
                        <div class="inputmedle"><input type="text" class="processSearchInput"></div>
                        <div class="inputmedle1"><button type="button" id="prosearchbtn" class="btn btn-primary sInput">조희</button></div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-7 maginPro">
                        <!-- 설비목록 테이블 -->
                        <div class="ETableTitle">
                            <div class="icon"><i class="fa fa-list"></i></div>
                            <div class="employee">공정목록</div>
                        </div>
                        <div class="table DTable">
                            <table cellpadding="0" cellspacing="0" border="0">
                                <colgroup>
                                    <col style="width: 5%" />
                                    <col style="width: 10%" />
                                    <col style="width: 10%" />
                                    <col style="width: 10%" />
                                    <col style="width: 10%" />
                                    <col style="width: 10%" />
                                    <col style="width: 10%" />
                                </colgroup>
                                <thead class="tbl-header">
                                <tr>
                                    <th></th>
                                    <th>공정번호</th>
                                    <th>공정명</th>
                                    <th>공정위치</th>
                                    <th>공정명</th>
                                    <th>공정위치</th>
                                    <th>공정위치</th>
                                </tr>
                                </thead>
                                <tbody class="tbl-content DTable">
                                <!-- 설비목록 데이터 -->
                                <tr>
                                    <td><input type="checkbox" name="check1"></td>
                                    <td>2</td>
                                    <td>3</td>
                                    <td>4</td>
                                    <td>2</td>
                                    <td>3</td>
                                    <td>4</td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" name="check1"></td>
                                    <td>2</td>
                                    <td>3</td>
                                    <td>4</td>
                                    <td>2</td>
                                    <td>3</td>
                                    <td>4</td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" name="check1"></td>
                                    <td>2</td>
                                    <td>3</td>
                                    <td>4</td>
                                    <td>2</td>
                                    <td>3</td>
                                    <td>4</td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" name="check1"></td>
                                    <td>2</td>
                                    <td>3</td>
                                    <td>4</td>
                                    <td>2</td>
                                    <td>3</td>
                                    <td>4</td>
                                <tr>
                                <tr>
                                    <td><input type="checkbox" name="check1"></td>
                                    <td>2</td>
                                    <td>3</td>
                                    <td>4</td>
                                    <td>2</td>
                                    <td>3</td>
                                    <td>4</td>
                                <tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div><!-- /.row -->
            </div><!-- /.modal-body -->
            <!-- 모달 바닥글 -->
            <div class="modal-footer" style="margin-right: 3%;">
                <button type="button" class="btn btn-primary">등록</button>
                <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
            </div>
        </div><!-- /.modal-content -->
    </div>
</div>




<!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->

<%@ include file="../includes/footer.jsp" %>