<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!-- stickyOnTable.css 연결 -->
<link rel="stylesheet" href="/resources/css/quality/stickyOnTable.css">
<!-- jQuery 연결 -->
<script defer src="/resources/js/materialMNG.js"></script>
<script defer src="/resources/js//quality/stickyOnTable.js"></script>

<!-- 공통 header 연결 -->
<%@ include file="../includes/header.jsp" %>

<div class="content-wrapper">
  <div class="content-header">
    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-12">
          <ol class="breadcrumb float-sm-left">
            <h1 class="m-0"><i class="far fa-clipboard"></i>&nbsp;자재입고현황</h1>
          </ol>
          <ol class="breadcrumb float-sm-right">
            <div class="reset">
              <img class="resetPng" alt="reset" src="/resources/img/reset.png" >
            </div>
            <div class="col-sm-1 ml-auto">
              <button type="submit" class="btn btn-primary search-btn" id="" onClick="javascript: search();">
                <i class="fa-solid fa-magnifying-glass"></i>&nbsp;검색
              </button>
            </div>
          </ol>
        </div><!-- /.col -->
      </div><!-- /.row -->
      <!-- 검색창 -->
      <form action="" id="materialSearchForm" class="col-md-12" onSubmit="return false">
      	<!-- 검색행1 -->
        <div class="material-searchBar">
        	<!-- 거래처명 -->
          <div class="col-sm-1 material-name">거래처명</div>
          <div class="col-sm-2 material-text">
          	<input list="workCompanyNameList" class="col-sm-12"  id="workCompanyName" name="workCompanyName">
          </div><!-- /.거래처명 -->
          <!-- 계약번호 -->
          <div class="col-sm-1 material-name">계약번호</div>
          <div class="col-sm-2 material-text">
          	<input list="workCompanyNameList" class="col-sm-12"  id="workCompanyName" name="workCompanyName">
          </div><!-- /.계약번호 -->
          <!-- 입고일자 -->
          <div class="col-sm-1 material-name">입고일자</div>
          <div class="col-sm-2 material-text">
          	<input type="date" class="col-sm-12" id="" name="" />
          </div><!-- /.입고일자 -->
          <!-- 자재번호 -->
          <div class="col-sm-1 material-name">자재번호</div>
          <div class="col-sm-2 material-text">
          	<input list="workCompanyNameList" class="col-sm-12"  id="workCompanyName" name="workCompanyName">
          </div><!-- /.자재번호 -->
        </div><!-- /.검색행1 -->
      </form><!-- /.검색창 -->
    </div><!-- /.container-fluid -->
  </div><!-- /.content-header -->

  <div class="content">
    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-12 material-titleAndTable">
          <div class="material-title">
            <i class="fa fa-list"></i>
            <span>자재입고현황</span>
          </div>
         </div><!-- /.material-titleAndTable -->
         <div class="col-sm-12">
           <div class="sot material-table" data-sot-top="1">
             <table cellpadding="0" cellspacing="0" border="0">
               <thead class="material-table-header">
                 <tr>
                   <th>No</th>
                   <th>자재번호</th>
                   <th>자재명</th>
                   <th>자재용도</th>
                   <th>계약번호</th>
                   <th>거래처명</th>
                   <th>단위</th>
                   <th>계약입고수량</th>
                   <th>검사수량</th>
                   <th>불량유형1</th>
                   <th>불량유형2</th>
                   <th>불량수량</th>
                   <th>불량률(%)</th>
                   <th>양품수량<br>(입고수량)</th>
                   <th>검사일자<br>(입고일자)</th>
                   <th>비고</th>
                 </tr>
               </thead>
               <tbody class="material-table-content">
                 <!-- Table rows -->
                 <tr>
									<td>1열</td>
									<td>2열</td>
									<td>3열</td>
									<td>4열</td>
									<td>5열</td>
									<td>6열</td>
									<td>7열</td>
									<td>8열</td>
									<td>9열</td>
									<td>10열</td>
									<td>11열</td>
									<td>12열</td>
									<td>13열</td>
									<td>14열</td>
									<td>15열</td>
									<td>16열</td>
								</tr>
								
								<tr>
									<td>1열</td>
									<td>2열</td>
									<td>3열</td>
									<td>4열</td>
									<td>5열</td>
									<td>6열</td>
									<td>7열</td>
									<td>8열</td>
									<td>9열</td>
									<td>10열</td>
									<td>11열</td>
									<td>12열</td>
									<td>13열</td>
									<td>14열</td>
									<td>15열</td>
									<td>16열</td>
								</tr>
								
								<tr>
									<td>1열</td>
									<td>2열</td>
									<td>3열</td>
									<td>4열</td>
									<td>5열</td>
									<td>6열</td>
									<td>7열</td>
									<td>8열</td>
									<td>9열</td>
									<td>10열</td>
									<td>11열</td>
									<td>12열</td>
									<td>13열</td>
									<td>14열</td>
									<td>15열</td>
									<td>16열</td>
								</tr>
								
								<tr>
									<td>1열</td>
									<td>2열</td>
									<td>3열</td>
									<td>4열</td>
									<td>5열</td>
									<td>6열</td>
									<td>7열</td>
									<td>8열</td>
									<td>9열</td>
									<td>10열</td>
									<td>11열</td>
									<td>12열</td>
									<td>13열</td>
									<td>14열</td>
									<td>15열</td>
									<td>16열</td>
								</tr>
								
								<tr>
									<td>1열</td>
									<td>2열</td>
									<td>3열</td>
									<td>4열</td>
									<td>5열</td>
									<td>6열</td>
									<td>7열</td>
									<td>8열</td>
									<td>9열</td>
									<td>10열</td>
									<td>11열</td>
									<td>12열</td>
									<td>13열</td>
									<td>14열</td>
									<td>15열</td>
									<td>16열</td>
								</tr>
								
								<tr>
									<td>1열</td>
									<td>2열</td>
									<td>3열</td>
									<td>4열</td>
									<td>5열</td>
									<td>6열</td>
									<td>7열</td>
									<td>8열</td>
									<td>9열</td>
									<td>10열</td>
									<td>11열</td>
									<td>12열</td>
									<td>13열</td>
									<td>14열</td>
									<td>15열</td>
									<td>16열</td>
								</tr>
								
								<tr>
									<td>1열</td>
									<td>2열</td>
									<td>3열</td>
									<td>4열</td>
									<td>5열</td>
									<td>6열</td>
									<td>7열</td>
									<td>8열</td>
									<td>9열</td>
									<td>10열</td>
									<td>11열</td>
									<td>12열</td>
									<td>13열</td>
									<td>14열</td>
									<td>15열</td>
									<td>16열</td>
								</tr>
								
								<tr>
									<td>1열</td>
									<td>2열</td>
									<td>3열</td>
									<td>4열</td>
									<td>5열</td>
									<td>6열</td>
									<td>7열</td>
									<td>8열</td>
									<td>9열</td>
									<td>10열</td>
									<td>11열</td>
									<td>12열</td>
									<td>13열</td>
									<td>14열</td>
									<td>15열</td>
									<td>16열</td>
								</tr>
								
								<tr>
									<td>1열</td>
									<td>2열</td>
									<td>3열</td>
									<td>4열</td>
									<td>5열</td>
									<td>6열</td>
									<td>7열</td>
									<td>8열</td>
									<td>9열</td>
									<td>10열</td>
									<td>11열</td>
									<td>12열</td>
									<td>13열</td>
									<td>14열</td>
									<td>15열</td>
									<td>16열</td>
								</tr>
								
								<tr>
									<td>1열</td>
									<td>2열</td>
									<td>3열</td>
									<td>4열</td>
									<td>5열</td>
									<td>6열</td>
									<td>7열</td>
									<td>8열</td>
									<td>9열</td>
									<td>10열</td>
									<td>11열</td>
									<td>12열</td>
									<td>13열</td>
									<td>14열</td>
									<td>15열</td>
									<td>16열</td>
								</tr>
								
								<tr>
									<td>1열</td>
									<td>2열</td>
									<td>3열</td>
									<td>4열</td>
									<td>5열</td>
									<td>6열</td>
									<td>7열</td>
									<td>8열</td>
									<td>9열</td>
									<td>10열</td>
									<td>11열</td>
									<td>12열</td>
									<td>13열</td>
									<td>14열</td>
									<td>15열</td>
									<td>16열</td>
								</tr>
								
								<tr>
									<td>1열</td>
									<td>2열</td>
									<td>3열</td>
									<td>4열</td>
									<td>5열</td>
									<td>6열</td>
									<td>7열</td>
									<td>8열</td>
									<td>9열</td>
									<td>10열</td>
									<td>11열</td>
									<td>12열</td>
									<td>13열</td>
									<td>14열</td>
									<td>15열</td>
									<td>16열</td>
								</tr>
								
								<tr>
									<td>1열</td>
									<td>2열</td>
									<td>3열</td>
									<td>4열</td>
									<td>5열</td>
									<td>6열</td>
									<td>7열</td>
									<td>8열</td>
									<td>9열</td>
									<td>10열</td>
									<td>11열</td>
									<td>12열</td>
									<td>13열</td>
									<td>14열</td>
									<td>15열</td>
									<td>16열</td>
								</tr>
								
								<tr>
									<td>1열</td>
									<td>2열</td>
									<td>3열</td>
									<td>4열</td>
									<td>5열</td>
									<td>6열</td>
									<td>7열</td>
									<td>8열</td>
									<td>9열</td>
									<td>10열</td>
									<td>11열</td>
									<td>12열</td>
									<td>13열</td>
									<td>14열</td>
									<td>15열</td>
									<td>16열</td>
								</tr>
								
								<tr>
									<td>1열</td>
									<td>2열</td>
									<td>3열</td>
									<td>4열</td>
									<td>5열</td>
									<td>6열</td>
									<td>7열</td>
									<td>8열</td>
									<td>9열</td>
									<td>10열</td>
									<td>11열</td>
									<td>12열</td>
									<td>13열</td>
									<td>14열</td>
									<td>15열</td>
									<td>16열</td>
								</tr>
								
								<tr>
									<td>1열</td>
									<td>2열</td>
									<td>3열</td>
									<td>4열</td>
									<td>5열</td>
									<td>6열</td>
									<td>7열</td>
									<td>8열</td>
									<td>9열</td>
									<td>10열</td>
									<td>11열</td>
									<td>12열</td>
									<td>13열</td>
									<td>14열</td>
									<td>15열</td>
									<td>16열</td>
								</tr>
								
								<tr>
									<td>1열</td>
									<td>2열</td>
									<td>3열</td>
									<td>4열</td>
									<td>5열</td>
									<td>6열</td>
									<td>7열</td>
									<td>8열</td>
									<td>9열</td>
									<td>10열</td>
									<td>11열</td>
									<td>12열</td>
									<td>13열</td>
									<td>14열</td>
									<td>15열</td>
									<td>16열</td>
								</tr>
								
								<tr>
									<td>1열</td>
									<td>2열</td>
									<td>3열</td>
									<td>4열</td>
									<td>5열</td>
									<td>6열</td>
									<td>7열</td>
									<td>8열</td>
									<td>9열</td>
									<td>10열</td>
									<td>11열</td>
									<td>12열</td>
									<td>13열</td>
									<td>14열</td>
									<td>15열</td>
									<td>16열</td>
								</tr>
               </tbody>
             </table>
             <!-- /.table -->
           </div>
         </div><!-- /.col-sm-12 -->
        
      </div><!-- /.row -->
    </div><!-- /.container-fluid -->
  </div><!-- /.content -->
</div><!-- /.content-wrapper -->

<!-- 공통 footer 연결 -->
<%@ include file="../includes/footer.jsp" %>
