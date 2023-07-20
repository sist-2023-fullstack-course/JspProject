<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="page-title">${sessionScope.name }님의 위시리스트</div>
<div class="col-sm-8 col-md-12">
	<div class="row">
		<c:forEach var="vo" items="${list }">
			<div class="col-md-4">
				<div class="single-blog">
					<div class="content fix">
						<a class="image fix" href="../company/detail.do?id=${vo.com_id }"><img
							src="${vo.poster }" width="100%" height="220px" /></a>
						<div class="metammm" style="position: relative">
							<div style="display: inline-block">
								<h2>
									<a style="text-decoration: none"
										href="../company/detail.do?id=${vo.com_id }">${vo.category }</a>
								</h2>
								<a class="title" href="../company/detail.do?id=${vo.com_id }">${vo.com_name }</a>
							</div>
							<div style="display: inline-block; float: right; margin-top: 22px; cursor: pointer;" onclick="removeWishlist(${vo.com_id})">
								<img src="../img/afterheart.png" style="width: 30px;">
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
</div>
<script type="text/javascript">
function removeWishlist(id) {
	$.ajax({
		type:'get',
		url:'../wishlist/update_ajax.do',
		data : {
			'cid':id,
			'isInsert':false
		},
		success : function () {
			location.href = '/JspProject/mypage/wishlist.do';
		}
	})
}
</script>