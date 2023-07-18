<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="col-sm-8 col-md-12">
		<div class="row">
		<c:forEach var="vo" items="${list }">
			<div class="col-md-4 poster">
				<div class="single-blog">
					<div class="content fix">
						<a class="image fix" href="../company/detail.do?id=${vo.com_id }"><img src="${vo.poster }" width="100%" height="220px"/></a>
						<div class="meta">
							<a class="text-left" href="../company/detail.do?id=${vo.com_id }">${vo.category }</a>
						<h2><a class="title" href="../company/detail.do?id=${vo.com_id }">${vo.com_name }</a></h2>
						<a href="#" >취소</a>
						</div>
					</div>
				</div>
			</div>
	    </c:forEach>
		</div>
</div>		


	<%-- 	
		<!-- START Pagination -->
		<div class="pagination">
			<ul>
				<li><a class="leftPage"><i class="fa fa-angle-left"></i></a></li>
				
				<c:forEach var="i" begin="${startpage }" end="${startpage + 9 }">
				<c:if test="${i==curpage }">
				<li class="active"><span>${i }</span></li>
				</c:if>
				<c:if test="${i!=curpage }">
				<li><a class="numPage">${i }</a></li>
				</c:if>
				</c:forEach>
				
				<li><a class="rightPage"><i class="fa fa-angle-right"></i></a></li>
			</ul>
			<input type="hidden" value="${totalpage }" class="totalPage">
		</div>
	    <!-- END Pagination -->
	 --%>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
function clickHeart(uid, cid){

}
</script>
