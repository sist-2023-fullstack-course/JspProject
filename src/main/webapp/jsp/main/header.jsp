<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
						<li><a href="">로그인 <i class="fa fa-angle-down"></i></a>
							<ul>
								<li><a href="../login/login.do">로그인</a></li>
								<li><a href="../login/join.do">회원가입</a></li>
							</ul>
						</li>
					</ul>
				</div>
		    </div>
				 
				  		  
					<%--
					 <div class="cart-hover">
						<ul class="header-cart-pro">
							<li>
								<div class="image"><a href="#"><img alt="cart item" src="../img/cart-1.jpg"></a></div>
								<div class="content fix"><a href="#">Product Name</a><span class="price">Price: $130</span><span class="quantity">Quantity: 1</span></div>
								<i class="fa fa-trash delete"></i>
							</li>
							<li>
								<div class="image"><a href="#"><img alt="cart item" src="../img/cart-2.jpg"></a></div>
								<div class="content fix"><a href="#">Product Name</a><span class="price">Price: $130</span><span class="quantity">Quantity: 2</span></div>
								<i class="fa fa-trash delete"></i>
							</li>
						</ul>
						<div class="header-button-price">
							<a href="checkout.html"><i class="fa fa-sign-out"></i><span>Check Out</span></a>
							<div class="total-price"><h3>Total Price : <span>$390</span></h3></div>
						</div>
					</div> 
					--%>
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
							<li><a href="../company/main.do">업체</a>
								<ul class="sub-menu">
									<li><a href="../company/main.do">애견미용</a></li>
									<li><a href="../company/main.do">동물병원</a></li>
									<li><a href="../company/main.do">애견카페</a></li>
									<li><a href="../company/main.do">애견숙소</a></li>
									<li><a href="../company/main.do">반려동물용품</a></li>
									<li><a href="../company/main.do">반려동물장례</a></li>
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
							<li><a href="shop.html">커뮤니티</a>
								<div>
									<ul class="sub-menu">
										<li><a href="#">자유토크</a></li>
										<li><a href="#">마이펫 자랑하기</a></li>
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
							<c:if test="${sessionScope.id!=null }">
							  <c:if test="${sessionScope.admin=='n' }">
							    <li><a href="about-us.html">마이페이지</a></li>
							  </c:if>
							  <c:if test="${sessionScope.admin=='y' }">
							    <li><a href="contact.html">관리자페이지</a></li>
							  </c:if>
							</c:if>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</div>
</div><!--End Main Menu Area-->