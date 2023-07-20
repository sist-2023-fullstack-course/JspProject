<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
	  <div class="row">
	    <table class="table">
	      <tr>
	        <th width=10% class="text-center">번호</th>
	        <th width=15% class="text-center"></th>
	        <th width=55% class="text-center">상품명</th>
	        <th width=10% class="text-center">수량</th>
	        <th width=20% class="text-center">총 금액</th>
	        <th width=10% class="text-center">비고</th>
	      </tr>
	      <tr>
	        <td width=10% class="text-center">1</td>
	        <td width=15% class="text-center">굴</td>
	        <td width=55% >강아지 사료</td>
	        <td width=10% class="text-center">2</td>
	        <td width=20% class="text-center">10000</td>
	        <td width=10% class="text-center">
	          <input type=button value="구매" class="btn btn-sm btn-danger" id=buyBtn>
	          <input type=button value="취소" class="btn btn-sm btn-warning" id=cancelBtn>
	        </td>
	      </tr>
	    </table>
	  </div>
	</div>
</body>
</html>