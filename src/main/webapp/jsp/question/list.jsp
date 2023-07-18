<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="wrapper row3">
 	  <main class="container clear"> 
 	    <h2 class="sectiontitle">1:1 문의하기</h2>
 	    <div class="row">
 	      <table class="table">
 	        <tr>
 	          <td>
				<c:if test="${sessionScope.id!=null }">
				 <c:if test="${sessionScope.admin=='n' }">
 	             <a href="../question/insert.do" class="btn btn-sm btn-danger">문의하기</a>
 	          </c:if>
 	          </c:if>
 	          </td>
 	        </tr>
 	      </table>
 	      <table class="table">
 	        <tr>
 	          <th width=10% class="text-center">번호</th>
 	          <th width=45% class="text-center">제목</th>
 	          <th width=15% class="text-center">이름</th>
 	          <th width=20% class="text-center">작성일</th>
 	          <th width=10% class="text-center">조회수</th>
 	        </tr>
 	        <c:forEach var="vo" items="${list }"> 
 	        <tr>
 	          <td width=10% class="text-center">${vo.no }</td>
 	          <td width=45%>
 	           <c:if test="${vo.group_tab==1 }">
 	             &nbsp;&nbsp;
 	             <img src="../question/image/re_icon.png">
 	           </c:if>
 	          <a href="../question/detail.do?no=${vo.no }">${vo.subject }</a></td>
 	          <td width=15% class="text-center">${vo.name }</td>
 	          <td width=20% class="text-center">${vo.dbday }</td>
 	          <td width=10% class="text-center">${vo.hit }</td>
 	        </tr>
 	        </c:forEach>
 	        <tr>
 	          <td colspan="5" class="text-center">
 	            <a href="#" class="btn btn-sm btn-primary">이전</a>
 	            ${curpage} page / ${totalpage } pages
 	            <a href="#" class="btn btn-sm btn-primary">다음</a>
 	          </td>
 	        </tr>
 	      </table>
 	    </div>
 	  </main>
 	</div>
</body>
</html>