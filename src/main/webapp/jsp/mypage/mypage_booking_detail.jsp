<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <h3> 예약 정보</h3>
  <table class="cart-table table">
    <tr>
      <th width=15% class="text-center">업체명</th>
      <td width=40% class="text-left">${cvo.com_name }</td>
      <td width=45% rowspan="6">
       <img src="${cvo.poster }">
      </td>
  	</tr>
    <tr>
      <th width=15% class="text-center">예약일</th>
      <td width=40% class="text-left">${rvo.res_date }</td>
  	</tr>
    <tr>
      <th width=15% class="text-center">업체주소</th>
      <td width=40% class="text-left">${cvo.address }</td>
  	</tr>
    <tr>
      <th width=15% class="text-center">연락처</th>
      <td width=40% class="text-left">${cvo.phone }</td>
  	</tr>
    <tr>
      <th width=15% class="text-center">반려동물명</th>
      <td width=40% class="text-left">${rvo.pet_id }</td>
  	</tr>
    <tr>
      <th width=15% class="text-center">빈칸</th>
      <td width=40% class="text-left">블라블라</td>
  	</tr>
  	<tr>
  	  <th width=15% class="text-center">예약 메시지</th>
  	  <td width=40% class="text-left">${rvo.res_msg }</td>
  	</tr>
  	
  </table> 



</body>
</html>