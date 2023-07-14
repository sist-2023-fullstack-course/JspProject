<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('#logoutBtn').click(function(){
		location.href="../member/logout.do";
	})
})	
</script>
	<div class="header-area"><!--Start Header Area-->
	<div class="container">
		<div class="row">
			<div class="col-sm-4 col-lg-4">
			</div>
			<div class="col-sm-4 col-lg-4">
				<div class="logo text-center">
					<a href="../main/main.do">
						<img src="../img/header/logo_pet.jpg" alt="" />
					</a>
				</div>
			</div>
			<div class="col-sm-4 col-lg-4">
				<div id="top-menu" class="float-right">
					<ul>
						<li><a href="#" class="inline">장바구니 <i class="fa fa-shopping-cart"></i></a></li>
						<li><a href="#">위시리스트 <i class="fa fa-shopping-cart"></i></a></li>
						<!-- 로그인 안 된 상태 -->
						<c:if test="${sessionScope.id==null }">
							<li>로그인 <i class="fa fa-angle-down"></i>
								<ul>
									<li><a href="../member/loginpage.do">로그인</a></li>
									<li><a href="../member/join.do">회원가입</a></li>
								</ul>
							</li>
						</c:if>
						<!-- 로그인 된 상태 -->
						<c:if test="${sessionScope.id!=null }">
							<li><a href="">"${nickname }" <i class="fa fa-angle-down"></i></a>
								<ul>
									<li><a href="../member/logout.do" id="logoutBtn">로그아웃</a></li>
									<li><a href="###">회원정보</a></li>
								</ul>
							</li>
						</c:if>
					</ul>
				</div>
		    </div>
		</div>
	</div>
</div><!--End Header Area-->
<div class="menu-area"><!--Start Main Menu Area-->
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="main-menu hidden-sm hidden-xs">
					<nav>
						<ul>
							<li><a href="../main/main.do" class="active">Home</a>
							</li>
							<li><a href="../company/list.do">업체</a>
								<ul class="sub-menu">
									<li><a href="../company/list.do?cate=애견미용">애견미용</a></li>
									<li><a href="../company/list.do?cate=동물병원">동물병원</a></li>
									<li><a href="../company/list.do?cate=애견카페">애견카페</a></li>
									<li><a href="../company/list.do?cate=애견숙소">애견숙소</a></li>
									<li><a href="../company/list.do?cate=반려동물용품">반려동물용품</a></li>
									<li><a href="../company/list.do?cate=반려동물장례">반려동물장례</a></li>
								</ul>
							</li>
							<li><a href="shop.html">쇼핑몰</a>
								<ul class="sub-menu">
									<li><a href="#">rings</a></li>
									<li><a href="#">diamond ring</a></li>
									<li><a href="#">gold ring</a></li>
									<li><a href="#">sliver ring</a></li>
									<li><a href="#">Platinum ring</a></li>
								</ul>
							</li>
							<li><a href="../board/board_list.do">커뮤니티</a>
								<div>
									<ul class="sub-menu">
										<li><a href="../board/board_list.do">자유토크</a></li>
										<li><a href="../board/board_list.do">마이펫 자랑하기</a></li>
									</ul>
								</div>
							</li>
							<li><a href="portfolio.html">공지사항</a>
								<ul class="sub-menu">
									<li><a href="#">Portfolio 3 column</a></li>
									<li><a href="#">Portfolio 4 column</a></li>
								</ul>
							</li>
							<li><a href="blog.html">문의하기</a>
								<ul class="sub-menu">
								</ul>
							</li>
							    <li><a href="../mypage/main.do">마이페이지</a></li>
							  <c:if test="${sessionScope.admin=='y' }">
							    <li><a href="../adminpage/main.do">관리자페이지</a></li>
							  </c:if>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</div>
</div><!--End Main Menu Area-->