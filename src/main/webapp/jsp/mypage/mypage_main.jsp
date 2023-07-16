<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<section class="blog-page page fix adminpage"><!-- Start Blog Area-->
		<div class="container">
			<div class="row">
				<div class="col-sm-4 col-md-3">
					<div class="single-sidebar">
						<h2><a href="../mypage/main.do" style="color:white;text-decoration:none;">마이페이지 홈</a></h2>
						<ul class="text-center">
							<li><a href="../mypage/myinfo.do">개인정보 확인/수정</a></li>
							<li><a href="../mypage/mypet.do">마이펫 관리</a></li>
							<li><a href="../mypage/booking.do">예약 내역</a></li>
							<li><a href="#">구매 내역</a></li>
							<li><a href="#">후기 관리</a></li>
							<li><a href="#">장바구니</a></li>
							<li><a href="../mypage/wishlist.do">위시리스트</a></li>
						</ul>
						<ul class="text-center" >
						 <li ><a href="#" style="color:#ea0000">회원탈퇴</a></li>
						</ul>
					</div>
				</div>
				<div class="col-sm-8 col-md-9 ">
				    <jsp:include page="${mypage_jsp }"></jsp:include>
				</div>
				</div>
			</div>
	</section>
