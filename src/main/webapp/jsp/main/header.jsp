<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
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
						<!-- 로그인 안 된 상태 -->
						<c:if test="${sessionScope.id==null }">
							<li>
								<p class="text-center"><a href="../member/join.do"><i class="fa fa-user-plus" style="color:#034D7E"></i></a></p>
								<p class="text-center"><a href="../member/join.do">회원가입</a></p>
							</li>
							<li>
								<p class="text-center"><a href="../member/loginpage.do"><i class="fa fa-sign-in" style="color:#034D7E"></i></a></p>
								<p class="text-center"><a href="../member/loginpage.do">로그인</a></p>
							</li>
						</c:if>
						<!-- 로그인 된 상태 -->
						<c:if test="${sessionScope.id!=null }">
						<li>
							<p class="text-center"><a href="../mypage/wishlist.do"><i class="fa fa-heart" style="color:red"></i></a></p>
							<p class="text-center"><a href="../mypage/wishlist.do" style="text-decoration:none">위시리스트</a></p>
						</li>
						<li>
							<p class="text-center"><a href="../mypage/mypage_cart.do"><i class="fa fa-shopping-cart" style="color:#034D7E"></i></a></p>
							<p class="text-center"><a href="../mypage/mypage_cart.do" style="text-decoration:none">장바구니</a></p>
						</li>
						<li>
							<p class="text-center"><a href="/JspProject/member/logout.do"><i class="fa fa-sign-out" style="color:#034D7E"></i></a></p>
							<p class="text-center"><a href="/JspProject/member/logout.do" style="text-decoration:none">로그아웃</a></p>
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
							<li><a href="../product/list.do">쇼핑몰</a>
								<ul class="sub-menu">
									<li><a href="../product/list.do?cate=사료">사료</a></li>
									<li><a href="../product/list.do?cate=간식">간식</a></li>
									<li><a href="../product/list.do?cate=배변/위생">배변/위생</a></li>
									<li><a href="../product/list.do?cate=산책/이동장">산책/이동장</a></li>
									<li><a href="../product/list.do?cate=건강관리">건강관리</a></li>
									<li><a href="../product/list.do?cate=식기">식기</a></li>
									<li><a href="../product/list.do?cate=의류/악세서리">의류/악세서리</a></li>
									<li><a href="../product/list.do?cate=장난감">장난감</a></li>
									<li><a href="../product/list.do?cate=목욕/미용">목욕/미용</a></li>
									<li><a href="../product/list.do?cate=하우스/울타리">하우스/울타리</a></li>
									<li><a href="../product/list.do?cate=훈련">훈련</a></li>
								</ul>
							</li>
							<li><a href="../board/board_list.do?cat=전체">커뮤니티</a>
								<div>
									<ul class="sub-menu">
										<li><a href="../board/board_list.do?cat=전체">전체</a></li>
										<li><a href="../board/board_list.do?cat=자유토크">자유토크</a></li>
										<li><a href="../board/board_list.do?cat=자랑하기">마이펫 자랑하기</a></li>
										<li><a href="../board/board_list.do?cat=QNA">Q&amp;A</a></li>
									</ul>
								</div>
							</li>
							<li><a href="../board/board_list.do?cat=공지사항">공지사항</a>
							</li>
							<li><a href="../question/list.do">1:1 문의</a>
								
							</li>
							<c:if test="${sessionScope.id!=null }">
							  <c:if test="${sessionScope.admin=='n' }">
							    <li><a href="../mypage/main.do">마이페이지</a></li>
							  </c:if>
							  <c:if test="${sessionScope.admin=='y' }">
							    <li><a href="../admin/main.do">관리자페이지</a></li>
							  </c:if>
							 </c:if>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</div>
</div><!--End Main Menu Area-->