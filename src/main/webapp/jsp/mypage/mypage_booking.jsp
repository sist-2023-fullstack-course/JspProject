<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="page-title">${sessionScope.name } 님의 예약내역</div>
    <div class="col-sm-1 col-md-1" ></div>
    <div class="col-sm-10 col-md-10">
      <div class="row">
    	<table class="cart-table table">
    	  <tr>
		    <th width=15% class="text-center">예약번호</th>
		    <th width=30% class="text-center">업체명</th>
		    <th width=20% class="text-center">예약일</th>
		    <th width=20% class="text-center">예약상태</th>
		    <th width=15% class="text-center"></th>
		    
		   </tr>
		   <c:forEach var="vo" items="${list}">
		     <tr >
		        <td width=15% class="text-center">${vo.res_id }</td>
			    <td width=30% class="text-center">${vo.com_name }</td>
			    <td width=20% class="text-center">${vo.res_date }</td>
			    <td width=20% class="text-center">
			     <c:if test="${vo.res_state=='y' }">
			        <span class="btn btn-sm btn-success">예약완료</span>
			     </c:if>
			     <c:if test="${vo.res_state=='n' }">
			        <span>대기중</span>
			     </c:if>
			    </td>
			    <td width=15% class="text-center">
				 <span class="btn btn-sm btn-primary checks" data-com_id="${vo.com_id }" data-res_id="${vo.res_id }">상세보기</span>
				</td>
		     </tr>
		   </c:forEach>
    	</table>
      </div>
    	<div style="height:10px"></div>
		      <div id="booking_detail" class="mypage-sub"></div>
    </div>
    <div class="col-sm-1 col-md-1"></div>


<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
let i=0; //전역변수 
$('.checks').click(function(){
	let com_id=$(this).attr("data-com_id");
	let res_id=$(this).attr("data-res_id");
	if(i===0)
	{
		$(this).text("닫기");
		$('#booking_detail').show();
		i=1;
		$.ajax({
			type:'post',
			url:'booking_detail.do',
			data:{"com_id":com_id,"res_id":res_id},
			success:function(result)
			{
				$('#booking_detail').html(result)
			}
		})
	}
	else 
	{
		$(this).text("상세보기");
		$('#booking_detail').hide();
		i=0;
	}
	
})
</script>