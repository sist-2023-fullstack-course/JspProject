<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="page-title">예약 관리</div>
    <div class="col-sm-1 col-md-1" ></div>
    <div class="col-sm-10 col-md-10">
    	<table class="cart-table table" id="book-table" style="margin-top:30px;">
    	  <tr>
		    <th width=15% class="text-center">예약자id</th>
		    <th width=15% class="text-center">예약자명</th>
		    <th width=25% class="text-center">업체명</th>
		    <th width=20% class="text-center">예약일</th>
		    <th width=15% class="text-center">예약상태</th>
		   </tr>
		   <c:forEach var="vo" items="${list}">
		     <tr onclick="myfunction(${vo.res_id})" style="cursor:pointer">
		        <td width=15% class="text-center">${vo.user_id } </td>
		        <td width=15% class="text-center">${vo.user_id } </td>
			    <td width=25% class="text-center">${vo.com_name }</td>
			    <td width=20% class="text-center">${vo.dbday }</td>
			    <c:if test="${vo.timeOver }">
			    <td width=15% class="text-center">종료</td>
			    </c:if>
			    <c:if test="${!vo.timeOver }">
			    <c:if test="${vo.res_state=='w' }">
			    <td width=15% class="text-center">대기중</td>
			    </c:if>
			    <c:if test="${vo.res_state=='y' }">
			    <td width=15% class="text-center" style="color: green">승인</td>
			    </c:if>
			    <c:if test="${vo.res_state=='n' }">
			    <td width=15% class="text-center" style="color: red;">거절</td>
			    </c:if>
			    </c:if>
		     </tr>
		     <tr class="detail" id="booking_detail${vo.res_id }" style="display:none">
		     	<td colspan="5">
		     	<h3>예약정보</h3>
		     	<table class="cart-table table">
				    <tr>
				      <th width=15% class="text-center">업체명</th>
				      <td width=40% class="text-left">${vo.com_name }</td>
				      <td width=45% rowspan="5">
				       <img src="${vo.poster }">
				      </td>
				  	</tr>
				    <tr>
				      <th width=15% class="text-center">예약번호</th>
				      <td width=40% class="text-left">${vo.res_id }</td>
				  	</tr>
				    <tr>
				      <th width=15% class="text-center">예약일</th>
				      <td width=40% class="text-left">${vo.dbday }</td>
				  	</tr>
				  	
				    <tr>
				      <th width=15% class="text-center">예약자명</th>
				      <td width=40% class="text-left">${vo.user_id}</td>
				  	</tr>
				    <tr>
				      <th width=15% class="text-center">반려동물명</th>
				      <td width=40% class="text-left">${vo.pet_id }</td>
				  	</tr>
				  	<tr>
				  	  <th width=15% class="text-center">예약 메시지</th>
				  	  <td width=40% class="text-left">${vo.res_msg }</td>
				  	</tr>
				  </table>
				  <div>
				  	<a href="booking_check.do?res_id=${vo.res_id }&state=y"><span class="span-btn">예약확정</span></a>
				  	<a href="booking_check.do?res_id=${vo.res_id }&state=n"><span class="span-btn">예약거절</span></a>
				  </div>
		     	</td>
		     </tr>
		   </c:forEach>
    	</table>
    </div>
    <div class="col-sm-1 col-md-1"></div>


<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
function myfunction(res_id){
	$('.detail').hide();
	if($('#booking_detail'+res_id).attr('class') == 'detail active'){
		$('.detail').attr('class', 'detail');
	}
	else{
		$('#booking_detail'+res_id).show();
		$('.detail').attr('class', 'detail');
		$('#booking_detail'+res_id).attr('class', 'detail active');
	}
}

function res_confirm(res_id){
	$.ajax({
		type:'post',
		url:'booking_confirm.do',
		data:{
			"res_id":res_id
		},
		
	})
}


</script>