<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="page-title fix"><!--Start Title-->
	<h2>상품별 검색</h2>
	<div class="section">
		<div class="container">
			<div class="row">
					 <div class="sm_search">
						<div class="custom-select">
				  			<input type="text" class="SearchInput" id="product_sch_text" placeholder="상품명을 입력하세요" title=""> 
				  			<button type="button" class="search_button" id="product_sch_btn">검색하기</button>
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
					<ul class="text-center product-category">
						<li><a ${cate=='전체' ? 'class=selected' : '' }>전체</a></li>
						<li><a ${cate=='사료' ? 'class=selected' : '' }>사료</a></li>
						<li><a ${cate=='간식' ? 'class=selected' : '' }>간식</a></li>
						<li><a ${cate=='배변/위생' ? 'class=selected' : '' }>배변/위생</a></li>
						<li><a ${cate=='산책/이동장' ? 'class=selected' : '' }>산책/이동장</a></li>
						<li><a ${cate=='건강관리' ? 'class=selected' : '' }>건강관리</a></li>
						<li><a ${cate=='식기' ? 'class=selected' : '' }>식기</a></li>
						<li><a ${cate=='의류/악세서리' ? 'class=selected' : '' }>의류/악세서리</a></li>
						<li><a ${cate=='장난감' ? 'class=selected' : '' }>장난감</a></li>
						<li><a ${cate=='목욕/미용' ? 'class=selected' : '' }>목욕/미용</a></li>
						<li><a ${cate=='하우스/울타리' ? 'class=selected' : '' }>하우스/울타리</a></li>
						<li><a ${cate=='훈련' ? 'class=selected' : '' }>훈련</a></li>
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
					<div class="col-md-3 poster poster_margin product">
						<div class="single-blog">
							<div class="content fix">
								<a class="image fix before" href="detail.do?id=${vo.id }">
									<img src="${vo.poster }" width="100%" height="220px"/>
									<div class="thumb_gray"></div>
								</a>
								<h2><a class="title" href="detail.do?id=${vo.id }">${vo.name }</a></h2>
								<div class="meta">
									<c:if test="${vo.discount_rate==0 }">
									<p>
										<i class="fa fa-krw"><fmt:formatNumber value="${vo.price }" />원</i>
									</p>
									<p>
										<i class="fa fa-star">${vo.star }</i>
									</p>
									</c:if>
									<c:if test="${vo.discount_rate!=0 }">
									<p>
										<i class="fa fa-krw">
											<fmt:formatNumber value="${vo.discount_price }" />원
											(<del><fmt:formatNumber value="${vo.price }" />원</del>)
										</i>
									</p>
									<p>
										<i style="color: red">${vo.discount_rate }%</i>
									</p>
									<p>
										<i class="fa fa-star">${vo.star }</i>
									</p>
									</c:if>
								</div>
							</div>
						</div>
					</div>
					</c:forEach>
				</div>
				<!-- Pagination -->
				<div class="pagination">
					<ul class="product">
						<li><a class="leftPage"><i class="fa fa-angle-left"></i></a></li>
						
						<c:forEach var="i" begin="${1 }" end="${10 }">
						<c:if test="${i==curpage }">
						<li class="active"><span>${i }</span></li>
						</c:if>
						<c:if test="${i<=totalpage && i!=curpage }">
						<li><a class="numPage">${i }</a></li>
						</c:if>
						<c:if test="${i>totalpage && i!=curpage }">
						<li><a class="numPage" style="display: none;">${i }</a></li>
						</c:if>
						</c:forEach>
						
						<li><a class="rightPage"><i class="fa fa-angle-right"></i></a></li>
					</ul>
					<input type="hidden" value="${totalpage }" id="product-totalPage">
				</div>
			</div>
		</div>
	</div>
</section>