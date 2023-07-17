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
				  			<select onchange="categoryChange(this.value)" name="addr1" id="addr1">
								<option>전국</option>
								<option>서울</option>
								<option>경기</option>
								<option>인천</option>
								<option>충북</option>
								<option>충남</option>
								<option>대전</option>
								<option>경북</option>
								<option>대구</option>
								<option>경남</option>
								<option>부산</option>
								<option>울산</option>
								<option>강원</option>
								<option>전북</option>
								<option>전남</option>
								<option>광주</option>
								<option>제주</option>
							</select>
							<select name="state" id="state">
								<option>시군선택</option>
							</select>
				  			<input type="text" class="SearchInput" id="sch_text" placeholder="업체명을 입력하세요"> 
				  			<button type="button" class="search_button" onclick="requestData(1, 'none')">검색하기</button>
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
					<ul class="text-center com-category">
						<li><a ${cate=='전체' ? 'class=selected' : '' }>전체</a></li>
						<li><a ${cate=='애견미용' ? 'class=selected' : '' }>애견미용</a></li>
						<li><a ${cate=='동물병원' ? 'class=selected' : '' }>동물병원</a></li>
						<li><a ${cate=='애견카페' ? 'class=selected' : '' }>애견카페</a></li>
						<li><a ${cate=='애견숙소' ? 'class=selected' : '' }>애견숙소</a></li>
						<li><a ${cate=='반려동물용품' ? 'class=selected' : '' }>반려동물용품</a></li>
						<li><a ${cate=='반려동물장례' ? 'class=selected' : '' }>반려동물장례</a></li>
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
								<a class="image fix" href="detail.do?id=${vo.id }"><img src="${vo.poster }" width="100%" height="220px"/></a>
								<h2><a class="title" href="detail.do?id=${vo.id }">${vo.com_name }</a></h2>
								<div class="meta">
									<p>
										<i class="fa fa-calendar">${vo.time }</i>
									</p>
									<p>
										<i class="fa fa-map-marker">${vo.address }</i>
									</p>
									<p>
										<i class="fa fa-comments" style="font-size: 14px;">0개</i>
										<i class="fa fa-star" style="font-size: 14px;">${vo.star }</i>
									</p>
								</div>
							</div>
						</div>
					</div>
					</c:forEach>
				</div>
				<!-- Pagination -->
				<div class="pagination">
					<ul class="company">
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
					<input type="hidden" value="${totalpage }" id="com-totalPage">
				</div>
			</div>
		</div>
	</div>
</section>