<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<body>
	<c:if test="${count==0 }">
	<table class="table">
	  <tr>
	    <td class="text-center">검색 결과가 없습니다.</td>
	  </tr>
	</table>
	</c:if>
	<c:if test="${count!=0 }">
	<table class="table">
	  <tr>
	    <th class="text-center">우편번호</th>
	    <th class="text-center">주소</th>
	  </tr>
	  <c:forEach var="vo" items="${list }">
		<tr onclick="findok('${vo.zipcode }','${vo.address }')">
		  <td class="text-center">${vo.zipcode }</td>
		  <td>${vo.address }</td>
		</tr>	  
	  </c:forEach>
	</table>
	</c:if>
</body>