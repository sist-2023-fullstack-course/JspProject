<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<div class="mypage-main" style="text-align: center">
    <div class="col-sm-1"></div>
    <div class="col-sm-10">
    	<table class="cart-table table" style="margin-top:30px;">
    	  <tr>
		    <th width=15% class="text-center">예약자명</th>
		    <th width=30% class="text-center">업체명</th>
		    <th width=15% class="text-center">예약일</th>
		    <th width=15% class="text-center">예약상태</th>
		    <th width=15% class="text-center"></th>
		    
		   </tr>
		   <c:forEach var="vo" items="${list}">
		     <tr onclick="myfunction(${vo.res_id})" style="cursor:pointer">
		        <td width=15% class="text-center">${vo.user_id } </td>
			    <td width=30% class="text-center">${vo.com_name }</td>
			    <td width=15% class="text-center">${vo.res_date }</td>
			    <td width=15% class="text-center">
			     <c:if test="${vo.res_state=='y' }">
			        <span>예약확정</span>
			     </c:if>
			     <c:if test="${vo.res_state=='n' }">
			        <span onclick="res_confirm(${vo.res_id})" class="btn btn-sm btn-success">확정하기</span>
			     </c:if>
			    </td>
			    <td width=15% class="text-center">
			    <c:if test="${vo.res_state=='n' }">
			     <a href="#" class="btn btn-sm btn-danger">거절하기</a>
				</c:if>
				</td>
		     </tr>
		     <tr class="detail" id="booking_detail${vo.res_id }" style="display:none">
		     	<td colspan="5">
		     	<h3>예약정보</h3>
		     	<table class="cart-table table">
				    <tr>
				      <th width=15% class="text-center">업체명</th>
				      <td width=40% class="text-left">${vo.com_id }</td>
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
				      <td width=40% class="text-left">${vo.res_date }</td>
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
		     	</td>
		     </tr>
		   </c:forEach>
    	</table>
    </div>
    <div class="col-sm-1"></div>
</div>


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
	
}

</script>