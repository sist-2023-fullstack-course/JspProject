<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
// 사용자로부터 페이지 받기
String strPage=request.getParameter("page");
// 첫페이지 처리
if(strPage==null)
	strPage="1";
// 현재 페이지 지정 
int curpage=Integer.parseInt(strPage);
List<ReplyBoardVO> list=dao.boardListData(curpage);

// 총페이지 
int count=dao.boardRowCount();
int totalpage=(int)(Math.ceil(count/10.0));
count=count-((curpage*10)-(10));
// 1page => count (30)
// 1 => 30~21 2=> 20~11 3=> 10~1
// 2page => count-10

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
</head>
<body>
<!-- 참고페이지 final -->
<div class="section">
  <main class="container clear">
   <h2 class="section-title">자유게시판</h2>
   <div style="height: 450px">
   <table class="table">
    <tr>
     <td>
      <a href="../board/board_insert.do" class="btn btn-sm btn-danger">새글</a>
     </td>
    </tr>
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
  </main>
</div>
</body>
</html>