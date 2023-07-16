<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="page-title fix"><!--Start Title-->
	<h2>업체별 검색</h2>
	<div class="section">
		<div class="container">
			<div class="row">
					 <div class="sm_search">
						<div class="custom-select">
				  			<input type="text" class="SearchInput" name="sch_text" id="sch_text" placeholder="업체명을 입력하세요" title=""> 
				  			<button type="button" class="search_button">검색하기</button>
						</div>
					</div>
			</div>
		</div>
	</div>
</div><!--End Title-->
<section class="blog-page page fix"><!-- Start Blog Area-->
	<div class="container">
		<div class="row">
			<div class="col-sm-4 col-md-3">
				<div class="single-sidebar">
					<h2>카테고리</h2>
					<ul class="text-center category">
						<li><a>전체</a></li>
						<li><a>사료</a></li>
						<li><a>간식</a></li>
						<li><a>배변/위생</a></li>
						<li><a>산책/이동장</a></li>
						<li><a>건강관리</a></li>
						<li><a>식기</a></li>
						<li><a>의류/악세서리</a></li>
						<li><a>장난감</a></li>
						<li><a>목욕/미용</a></li>
						<li><a>하우스/울타리</a></li>
						<li><a>훈련</a></li>
					</ul>
				</div>
				<div class="single-sidebar">
					<h2>Recent Post</h2>
					<ul class="resent-post">
						<li><!-- SINGLE POST -->
							<div class="image">
								<a href="#"><img alt="" src="../img/blog/recent-1.jpg"></a>
							</div>
							<div class="content fix">
								<h5><a href="#">Lorem ipsum</a></h5>
								<span><i class="fa fa-clock-o"></i>20-2-2015</span>
							</div>
						</li>
					</ul>
				</div>
			</div>
			<div class="col-sm-8 col-md-9">
				<div class="row">
					<c:forEach var="vo" items="${list }">
					<div class="col-md-4 poster">
						<div class="single-blog">
							<div class="content fix">
								<a class="image fix" href="#"><img src="${vo.poster }" width="100%" height="220px"/></a>
								<h2><a class="title" href="#">${vo.name }</a></h2>
								<div class="meta">
									<a href="" class="time"><i class="fa fa-calendar"></i>${vo.price }</a>
									<a href="#" style="float: right;"><i class="fa fa-comments"></i>0개</a>
								</div>
								<p>추가정보</p>
							</div>
						</div>
					</div>
					</c:forEach>
				</div>
				<!-- Pagination -->
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
			</div>
		</div>
	</div>
</section>