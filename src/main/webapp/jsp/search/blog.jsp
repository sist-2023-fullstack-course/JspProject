<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="page-title fix"><!--Start Title-->
	<div class="section" style="padding: 0px;">
		<div class="container">
			<div class="row">
					 <div class="sm_search">
						<div class="custom-select">
				  			<select onchange="categoryChange(this)" name="ar_code" id="ar_code">
								<option value="1" data-id="0">전국</option>
								<option value="2" data-id="1">서울</option>
								<option value="3" data-id="26">경기</option>
								<option value="4" data-id="57">인천</option>
								<option value="5" data-id="67">충북</option>
								<option value="6" data-id="79">충남</option>
								<option value="7" data-id="94">대전</option>
								<option value="8" data-id="99">경북</option>
								<option value="9" data-id="122">대구</option>
								<option value="10" data-id="130">경남</option>
								<option value="11" data-id="150">부산</option>
								<option value="12" data-id="166">울산</option>
								<option value="13" data-id="171">강원</option>
								<option value="14" data-id="189">전북</option>
								<option value="15" data-id="203">전남</option>
								<option value="16" data-id="225">광주</option>
								<option value="17" data-id="230">제주</option>
							</select>
							<select name="state" id="state">
								<option value="0">시군선택</option>
							</select>
				  			<input type="text" class="SearchInput" name="sch_text" id="sch_text" placeholder="검색할 업체명을 입력하세요" title=""> 
				  			<button type="button" class="search_button" onclick="Store.del('h_sch_text'); Store.del('ar_scroll');Store.set('ar_page',1);search_go()">검색하기</button>
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
					<ul class="text-center">
						<li><a href="#">전체</a></li>
						<li><a href="#">애견미용</a></li>
						<li><a href="#">동물병원</a></li>
						<li><a href="#">애견카페</a></li>
						<li><a href="#">애견숙소</a></li>
						<li><a href="#">반려동물용품</a></li>
						<li><a href="#">반려동물장례</a></li>
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
					<div class="col-md-4">
						<div class="single-blog">
							<div class="content fix">
								<a class="image fix" href="detail.do?id=${vo.id }"><img src="${vo.poster }" width="100%" height="200px"/></a>
								<h2><a class="title" href="detail.do?id=${vo.id }">${vo.com_name }</a></h2>
								<div class="meta">
									<a href=""><i class="fa fa-calendar"></i>${vo.time }</a>
									<a href="#" style="float: right;"><i class="fa fa-comments"></i>0개</a>
								</div>
								<p>${vo.address }</p>
							</div>
						</div>
					</div>
					</c:forEach>
				</div>
				<!-- Pagination -->
				<div class="pagination">
					<ul>
						<li><a href="#"><i class="fa fa-angle-left"></i></a></li>
						
						<c:forEach var="i" begin="${startpage }" end="${endpage }">
						<c:if test="${i==curpage }">
						<li class="active"><span>${i }</span></li>
						</c:if>
						<c:if test="${i!=curpage }">
						<li><a href="main.do?page=${i }">${i }</a></li>
						</c:if>
						</c:forEach>
						
						<li><a href="#"><i class="fa fa-angle-right"></i></a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</section>