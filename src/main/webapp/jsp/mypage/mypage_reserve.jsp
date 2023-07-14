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
 <h2 class="section-title">마이페이지_예약목록</h2>
 <table class="table">
   <tr>
    <th class="text-center">예약번호</th>
    <th class="text-center">업체명</th>
    <th class="text-center">예약일</th>
    <th class="text-center">예약메세지</th>
    <th class="text-center">예약상태</th>
    <th class="text-center"></th>
    
   </tr>
   <c:forEach var="vo" items="${list}">
     <tr>
        <td class="text-center">${vo.res_id }</td>
	    <td class="text-center">${vo.com_id }</td>
	    <td class="text-center">${vo.res_date }</td>
	    <td class="text-center">${vo.res_msg }</td>
	    <td class="text-center">${vo.res_state }</td>
	    <td class="text-center">
	        <span class="btn btn-sm btn-success">예약완료</span>
	        <span class="btn btn-sm btn-default">예약대기</span>
	    </td>
     </tr>
   </c:forEach>
  </table>
  <table>
    <tr>
     <td>
       <div id="reserve_info"></div>
     </td>
    </tr>
  </table>
</body>
</html>