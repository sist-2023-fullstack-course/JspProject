<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div style="padding-top: 40px;"></div>
    <div class="col-sm-1 col-md-1" ></div>
    <div class="col-sm-10 col-md-10">
      <div class="row">
    	<table id="cart-table" class="cart-table table">
    	  <tr>
		    <th width=10% class="text-center">번호</th>
		    <th width=10% class="text-center"></th>
		    <th width=40% class="text-center">상품명</th>
		    <th width=10% class="text-center">단가</th>
		    <th width=10% class="text-center">수량</th>
		    <th width=10% class="text-center">총 가격</th>
		    <th width=10% class="text-center">비고</th>
		   </tr>
		   <c:forEach var="vo" varStatus="i" items="${list}">
		     <tr>
		        <td class="text-center">${i.index+1 }</td>
			    <td class="text-center">
			      <img src="${vo.product_poster }" style="width:50px; height: 50px;">	
			    </td>
			    <td id="pname" class="text-center">${vo.product_name }</td>
			    <td class="text-center"><fmt:formatNumber value="${vo.product_price }" />원</td>
			    <td class="text-center">${vo.amount }개</td>
			    <td id="totalprice" class="text-center"><fmt:formatNumber value="${vo.product_price*vo.amount }" />원</td>
			    <td class="text-center">
	        	  <input type=button class="btn btn-sm btn-danger" value="구매" onclick="requestPay(this)" data-no="${vo.cart_no }">
	        	  <a href="../mypage/cart_cancel.do?no=${vo.cart_no }" class="btn btn-sm btn-default">취소</a>
			    </td>
		     </tr>
		   </c:forEach>
    	</table>
      </div>
    </div>
  <div class="col-sm-1 col-md-1"></div>
