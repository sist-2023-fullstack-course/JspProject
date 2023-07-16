<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
</style>
<style type="text/css">
.board{
width:800px;

}

</style>

</head>
<body>
<!-- 참고페이지 final -->
<div class="mypage-main">
  <main style="width:800px;">
   <h2 class="section-title">자유게시판</h2>
   <div style="height: 450px;">
   <table class="table">
    <tr>
    <c:if test="${sessionScope.id != null }">
     <td>
      <a href="../board/board_insert.do" class="btn btn-sm btn-danger">새글</a>
     </td>
    </tr>
    </c:if>
   </table>
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
   <!-- Pagination -->
   <nav class="pagination">
	<ul>
         <%-- startPage : 1 , 11 , 21 , 31... --%>
         <c:if test="${startPage>1 }">
          <li><a href="../board/board_list.do?page=${startPage-1 }">&laquo; Previous</a></li>
         </c:if>
         
         <c:forEach var="i" begin="${startPage }" end="${endPage }">
            <li ${curpage==i?"class=current":"" }><a href="../board/board_list.do?page=${i }">${i }</a></li>
         </c:forEach>
         
          
         <c:if test="${endPage<totalpage }">
          <li><a href="../board/board_list.do?page=${endPage+1 }">Next &raquo;</a></li>
         </c:if>
        </ul>
    </nav>
  </main>
</div>
</body>
</html>