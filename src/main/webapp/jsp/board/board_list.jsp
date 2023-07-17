<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="mypage-main board-main">
	<div class="board-title"> 
		자유게시판 
	</div>
	<div class="board-search">
		<div class='board-search-title'> 
			게시글 검색
		</div>
		<div class='board-search-combo'> 
			<select name=search class="form-select border-select" >
			  <option selected> 제목 </option>
			  <option value="1">제목</option>
			  <option value="2">내용</option>
			  <option value="3">작성자</option>
			</select>
		</div>
		<div class='board-search-search'>
			<input type="text" class="form-control" style="height: 30px;" id="id">
		</div>
		<div class='board-search-btn'>
			<button type="button" class="btn  btn-sm btn-secondary board-btn"> 조회 </button>
		</div>
		<c:if test="${sessionScope.id!=null }">
		<div class="board-search-insert">
			<button id="newIn" type="button" class="btn btn-sm btn-secondary board-btn"> 새글 </button>
			<!-- <a href="../board/board_insert.do" class="btn btn-sm board-btn">새글</a>  -->
		</div>
		</c:if>
	</div>
	<div class="board-table">  
		<table class="table">
		     <tr>
		      <th width=10% class="text-center">번호</th>
		      <th width=40% class="text-center">제목</th>
		      <th width=10% class="text-center">카테고리</th>
		      <th width=10% class="text-center">이름</th>
		      <th width=20% class="text-center">작성일</th>
		      <th width=10% class="text-center">조회수</th>
		     </tr>
	     
		     <c:forEach var="vo" items="${list }">
		       <tr>
		         <td width=10% class="text-center">${vo.board_id }</td>
		         <td width=40% class="text-center"><a href="../board/board_detail.do?no=${vo.board_id }">${vo.title }</a></td>
		         <td width=10% class="text-center">${vo.board_category }</td>
		         <td width=10% class="text-center">${vo.user_id }</td>
		         <td width=20% class="text-center">${vo.dbday }</td>
		         <td width=10% class="text-center">${vo.hit }</td>
		       </tr>
		     </c:forEach>
	   </table>
	</div>
	<div class="board-page"> 
	   <nav class="pagination" >
		<ul>
	         <c:if test="${startPage>1 }">
	          <li><a href="../board/board_list.do?page=${startPage-1 }">&laquo; 이전페이지</a></li>
	         </c:if>
	         
	         <c:if test="${curpage>1 }">
	         <li> <a href="../board/board_list.do?page=${curpage-1 }">&lt;</a> </li>
	         </c:if>
	         <c:forEach var="i" begin="${startPage }" end="${endPage }">
	            <li ${curpage==i?"class=current":"" }><a href="../board/board_list.do?page=${i }">${i }</a></li>
	         </c:forEach>
	         <c:if test="${curpage < totalpage }">
	         <li><a href="../board/board_list.do?page=${curpage+1 }">&gt;</a></li>
	         </c:if>
	         
	         
	         <c:if test="${endPage<totalpage }">
	          <li><a href="../board/board_list.do?page=${endPage+1 }">다음페이지 &raquo;</a></li>
	         </c:if>
	        </ul>
	    </nav>
	</div>
</div>
 
