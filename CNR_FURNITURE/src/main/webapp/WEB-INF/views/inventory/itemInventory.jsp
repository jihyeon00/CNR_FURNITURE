<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!-- 공통 header 연결 -->
<%@ include file="../includes/header.jsp" %>


<div class="content-wrapper">
	<form action="/inventory/itemInventory" id="searchItemInventory" name="searchItemInventory" class="col-md-12" method="get">
	  <div class="content-header">
	    <div class="container-fluid">
	      <div class="row mb-2">
	        <div class="col-sm-12">
	          <ol class="breadcrumb float-sm-left">
	            <h1 class="m-0"><i class="far fa-clipboard"></i>&nbsp;제품재고조회</h1>
	          </ol>
	          <ol class="breadcrumb float-sm-right">
	            <div class="reset">
	            	<a href="/inventory/itemInventory">
	              	<img class="resetPng" alt="reset" src="/resources/img/reset.png" >
	              </a>
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
	     	<!-- 검색행1 -->
	       <div class="inspection-searchBar">
	         <!-- 제품번호 -->
	         <div class="col-sm-1 inspection-name">제품번호</div>
	         <div class="col-sm-2 inspection-text">
	         	<input type="search" list="itemIDList" class="col-sm-12" id="itemID" name="itemID" value="${cri.itemID}">
	         	<datalist id="itemIDList">
	         		<c:forEach items="${itemIDList}" var="item">
								<option value='${item.itemID}'
                	<c:if test="${cri.itemID == item.itemID}">selected</c:if> >${item.itemID}
								</option>
							</c:forEach>
	         	</datalist>
	         </div><!-- /.제품번호 -->
	         <!-- 제품명 -->
	         <div class="col-sm-1 inspection-name">제품명</div>
	         <div class="col-sm-2 inspection-text">
	         	<input type="search" list="itemNameList" class="col-sm-12" id="itemName" name="itemName" value="${cri.itemName}">
	         	<datalist id="itemNameList">
	         		<c:forEach items="${itemNameList}" var="item">
								<option value='${item.itemName}'
                	<c:if test="${cri.itemName == item.itemName}">selected</c:if> >${item.itemName}
								</option>
							</c:forEach>
	         	</datalist>
	         </div><!-- /.제품명 -->
	         <!-- 제품용도 -->
	         <div class="col-sm-1 inspection-name">제품용도</div>
	         <div class="col-sm-2 inspection-text">
	         	<input type="search" list="itemUsesList" class="col-sm-12" id="itemUses" name="itemUses" value="${cri.itemUses}">
	         	<datalist id="itemUsesList">
	         		<c:forEach items="${itemUsesList}" var="item">
								<option value='${item.itemUses}'
                	<c:if test="${cri.itemUses == item.itemUses}">selected</c:if> >${item.itemUses}
								</option>
							</c:forEach>
	         	</datalist>
	         </div><!-- /.제품용도 -->
	       </div><!-- /.검색행1 -->
	    </div><!-- /.container-fluid -->
	  </div><!-- /.content-header -->
	</form><!-- 검색 Form -->

	<!-- Main content -->
  <div class="content">
    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-12 itemInventory-titleAndTable">
        	<!-- 테이블목록 title -->
        	<div class="row itemInventory-titleAndBtn">
	          <div class="col-sm-9 itemInventory-title">
	            <i class="fa fa-list"></i>
	            <span>제품재고목록</span>
	          </div><!-- /.테이블목록 title -->
          </div><!-- /.row -->
          <!-- 제품테이블 -->
          <div class="col-sm-12">
            <div class="itemInventory-table">
              <table cellpadding="0" cellspacing="0" border="0">
                <thead class="itemInventory-table-header">
                  <tr>
                    <th>No</th>
                    <th>제품번호</th>
                    <th>제품용도</th>
                    <th>제품규격</th>
                    <th>제품명</th>
                    <th>단위</th>
                    <th>재고수량</th>
                  </tr>
                </thead>
                <tbody class="itemInventory-table-content">
                	<c:forEach var="in" items="${itemInventoryList}">
                		<tr>
                			<td><fmt:formatNumber value="${in.listSeq}" pattern="#,##0" /></td>
                			<td><fmt:formatNumber value="${in.itemID}" pattern="#,##0" /></td>
                			<td><c:out value="${in.itemUses}" /></td>
                			<td><c:out value="${in.itemStandard}" /></td>
                			<td><c:out value="${in.itemName}" /></td>
                			<td><c:out value="${in.unit}" /></td>
                			<td><fmt:formatNumber value="${in.quantity}" pattern="#,##0" /></td>
                		</tr>
                	</c:forEach>
                </tbody>
              </table>
              <!-- /.table -->
            </div>
          </div><!-- /.col-sm-11 -->
        </div><!-- /.col-sm-12 -->
      </div><!-- /.row -->
    </div><!-- /.container-fluid -->
  </div><!-- /.content -->
</div><!-- /.content-wrapper -->


<!-- 공통 footer 연결 -->
<%@ include file="../includes/footer.jsp" %>


<script>
$(document).ready(function() {
	/* 검색기능 */
	$('#searchItemInventory').submit();
}
</script>