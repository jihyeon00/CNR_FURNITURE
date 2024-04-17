<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>


<!-- jQuery 연결 -->
<script defer src="/resources/js/materialMNG.js"></script>

<!-- 공통 header 연결 -->
<%@ include file="../includes/header.jsp" %>


  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
  
  
  <!-- 검색 Form -->
	<form action="/materialInventory" id="searchMatInventory" name="searchMatInventory" class="col-md-12" method="get">
	  <div class="content-header">
	    <div class="container-fluid">
	      <div class="row mb-2">
	        <div class="col-sm-12">
	          <ol class="breadcrumb float-sm-left">
	            <h1 class="m-0"><i class="far fa-clipboard"></i>&nbsp;자재재고조회</h1>
	          </ol>
	          <ol class="breadcrumb float-sm-right">
	            <div class="reset">
	            	<a href="/materialInventory">
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
	       <div class="materialMNG-searchBar">
	       	<!-- 자재번호 -->
	         <div class="col-sm-1 materialMNG-name">자재번호</div>
	         <div class="col-sm-3 materialMNG-text">
	         	<input type="search" list="matIDList" class="col-sm-12"  id="matID" name="matID" value="${cri.matID}">
	         	<datalist id="matIDList">
	         		<c:forEach items="${matIDList}" var="mat">
								<option value='${mat.matID}'
                	<c:if test="${cri.matID == mat.matID}">selected</c:if> >${mat.matID}
								</option>
							</c:forEach>
	         	</datalist>
	         </div><!-- /.자재번호 -->
	         <!-- 자재명 -->
	         <div class="col-sm-2 materialMNG-name">자재명</div>
	         <div class="col-sm-3 materialMNG-text">
	         	<input type="search" list="contractIDList" class="col-sm-12" id="matName" name="matName" value="${cri.matName}">
	         	<datalist id="contractIDList">
	         		<c:forEach items="${matNameList}" var="mat">
								<option value='${mat.matName}'
                	<c:if test="${cri.matName == mat.matName}">selected</c:if> >${mat.matName}
								</option>
							</c:forEach>
	         	</datalist>
	         </div><!-- /.자재명 -->
	       </div><!-- /.검색행1 -->
	    </div><!-- /.container-fluid -->
	  </div><!-- /.content-header -->
	</form><!-- 검색 Form -->
  
  

  <!-- Main content -->
  <div class="content">
    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-12 materialMNG-titleAndTable">
        	<!-- 테이블목록 title -->
        	<div class="row materialMNG-titleAndBtn">
	          <div class="col-sm-9 materialMNG-title">
	            <i class="fa fa-list"></i>
	            <span>자재재고조회</span>
	          </div><!-- /.테이블목록 title -->
          </div><!-- /.matInventory-titleAndBtn -->
          <!-- 제품테이블 -->
          <div class="row"></div>
          <div class="col-sm-12">
            <div class="materialMNG-table">
              <table cellpadding="0" cellspacing="0" border="0">
                <thead class="materialMNG-table-header">
                  <tr>
                    <th>No</th>
                    <th>자재번호</th>
                    <th>자재용도</th>
                    <th>자재명</th>
                    <th>단위</th>
                    <th>재고수량</th>
                  </tr>
                </thead>
                <tbody class="materialMNG-table-content">
                	<tr>
                		<td>1행</td>
                		<td>2행</td>
                		<td>3행</td>
                		<td>4행</td>
                		<td>5행</td>
                		<td>6행</td>
                	</tr>
                	
                	<tr>
                		<td>1행</td>
                		<td>2행</td>
                		<td>3행</td>
                		<td>4행</td>
                		<td>5행</td>
                		<td>6행</td>
                	</tr><tr>
                		<td>1행</td>
                		<td>2행</td>
                		<td>3행</td>
                		<td>4행</td>
                		<td>5행</td>
                		<td>6행</td>
                	</tr><tr>
                		<td>1행</td>
                		<td>2행</td>
                		<td>3행</td>
                		<td>4행</td>
                		<td>5행</td>
                		<td>6행</td>
                	</tr><tr>
                		<td>1행</td>
                		<td>2행</td>
                		<td>3행</td>
                		<td>4행</td>
                		<td>5행</td>
                		<td>6행</td>
                	</tr><tr>
                		<td>1행</td>
                		<td>2행</td>
                		<td>3행</td>
                		<td>4행</td>
                		<td>5행</td>
                		<td>6행</td>
                	</tr><tr>
                		<td>1행</td>
                		<td>2행</td>
                		<td>3행</td>
                		<td>4행</td>
                		<td>5행</td>
                		<td>6행</td>
                	</tr><tr>
                		<td>1행</td>
                		<td>2행</td>
                		<td>3행</td>
                		<td>4행</td>
                		<td>5행</td>
                		<td>6행</td>
                	</tr><tr>
                		<td>1행</td>
                		<td>2행</td>
                		<td>3행</td>
                		<td>4행</td>
                		<td>5행</td>
                		<td>6행</td>
                	</tr><tr>
                		<td>1행</td>
                		<td>2행</td>
                		<td>3행</td>
                		<td>4행</td>
                		<td>5행</td>
                		<td>6행</td>
                	</tr><tr>
                		<td>1행</td>
                		<td>2행</td>
                		<td>3행</td>
                		<td>4행</td>
                		<td>5행</td>
                		<td>6행</td>
                	</tr><tr>
                		<td>1행</td>
                		<td>2행</td>
                		<td>3행</td>
                		<td>4행</td>
                		<td>5행</td>
                		<td>6행</td>
                	</tr><tr>
                		<td>1행</td>
                		<td>2행</td>
                		<td>3행</td>
                		<td>4행</td>
                		<td>5행</td>
                		<td>6행</td>
                	</tr>
                	
                	
                	
                	
                	
                  <!-- 추가적인 행들 -->
                </tbody>
              </table>
            </div><!-- /.table -->
          </div><!-- /.col-sm-12 -->
        </div><!-- /.col-sm-12 -->
      </div><!-- /.row -->
    </div><!-- /.container-fluid -->
  </div><!-- /.content -->
 </div>
 <!-- /.content-wrapper -->

  
<!-- 공통 footer 연결 -->
<%@ include file="../includes/footer.jsp" %>

<script>

// 조회 쿼리문은 여기있습니다. ★★★★★★★★★★★★
/* 테이블 - 자재재고조회 */
/* -- NO
-- 자재번호
-- 자재용도
-- 자재명
-- 단위
-- 재고수량
SELECT
    i.INV_MATERIAL_ID AS "자재번호",
    m.M_USES AS "자재용도",
    m.M_NAME AS "자재명",
    c.CT_UNIT AS "단위",
    SUM(i.INV_QUANTITY) AS "재고수량"
FROM INVENTORY i
    JOIN MATERIAL m ON m.M_ID = i.INV_MATERIAL_ID
    JOIN CONTRACT c ON c.CT_MATERIAL_ID = i.INV_MATERIAL_ID
WHERE 
	1=1
GROUP BY 
    i.INV_MATERIAL_ID,  -- GROUP BY 절에 나머지 열도 포함
    m.M_USES,
    m.M_NAME,
    c.CT_UNIT
ORDER BY 
    i.INV_MATERIAL_ID
; */

/* 검색창 - 자재번호, 자재명 검색 시, 조회 코드에 where 조건절 추가할 것: xml 파일에서. */
/* -- 1. [자재번호] 검색 시, 아래의 코드를 [테이블] 조회의 조건절(where)에 붙여줄 것
-- AND i.INV_MATERIAL_ID = 20000022
-- 2. [자재명] 검색 시, 아래의 코드를
-- AND m.M_NAME = '소나무' */

/* 검색창 - 자재번호 option 조회 */
/* SELECT 
	DISTINCT i.INV_MATERIAL_ID
FROM 
	INVENTORY i
	JOIN CONTRACT c ON c.CT_Material_ID = i.INV_MATERIAL_ID
ORDER BY
	i.INV_MATERIAL_ID
; */

/* 검색창 - 자재명 option 조회 */
/* SELECT
	DISTINCT m.M_NAME 
FROM
	MATERIAL m
	JOIN INVENTORY i ON i.INV_MATERIAL_ID = m.M_ID
	JOIN CONTRACT c ON c.CT_Material_ID = i.INV_MATERIAL_ID 
ORDER BY
	m.M_NAME
; */


</script>

