<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="page-title">${sessionScope.name } 님의 위시리스트</div>
<div class="col-sm-8 col-md-12">
		<div class="row">
		<c:forEach var="vo" items="${list }">
			<div class="col-md-4">
				<div class="single-blog">
					<div class="content fix">
						<a class="image fix" href="../company/detail.do?id=${vo.com_id }"><img src="${vo.poster }" width="100%" height="220px"/></a>
						<div class="metammm" style="position:relative">
						  <div style="display:inline-block">
							<h2><a style="text-decoration:none" href="../company/detail.do?id=${vo.com_id }">${vo.category }</a></h2>
							<a class="title" href="../company/detail.do?id=${vo.com_id }">${vo.com_name }</a>
						  </div>
							<span style="right:0px;position:absolute;color:red" class="heart_button clicked" onclick="clickHeart(${vo.com_id })"><i class="fa fa-heart" style="cursor:pointer;"></i></span>
				        </div>
					</div>
				</div>
			</div>
	    </c:forEach>
		</div>
</div>		

	<%-- 	
	
	 --%>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
function clickHeart(cid){
	let isInsert;
	if($('.heart_button').attr('class').includes('clicked')){
		isInsert = false;
	}
	else{
		isInsert = true;
	}
	
	$.ajax({
		type:'post',
		url:'../mypage/wishlist.ajax.do',
		data:{
			'isInsert':isInsert,
			'cid' : cid
		},
		success : function(result){
			if(result=='success'){
				if(isInsert){
					$('.heart_button').attr('class', 'heart_button clicked');
					$('.heart_button > dt > img').attr('style', 'right:0px; position:absolute;color:red');
				}
				else{
					$('.heart_button').attr('class', 'heart_button');
					$('.heart_button > dt > img').attr('style', 'right:0px; position:absolute;');
				}
			}
		}
	})
}

</script>
