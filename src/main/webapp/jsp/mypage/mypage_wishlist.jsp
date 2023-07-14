<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="col-sm-8 col-md-9">
		<div class="row">
			<div class="col-md-4 poster">
				<div class="single-blog">
					<div class="content fix">
						<a class="image fix" href="#"><img src="../jsp/mypage/noimage.jpeg" width="100%" height="200px"/></a>
						<h2><a class="title" href="#">업체명</a></h2>
					</div>
				</div>
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
</div>