<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
section{
  margin: 0px auto;
  height: 800px;
}
</style>
</head>
<body>
	<section class="blog-page page fix"><!-- Start Blog Area-->
		<div class="container">
			<div class="row">
				<div class="col-sm-4 col-md-3">
					<div class="single-sidebar">
						<h2><a href="../mypage/main.do" style="color:white;text-decoration:none;">마이페이지 홈</a></h2>
						<ul class="text-center">
							<li><a href="../mypage/mypage_info.do">개인정보 확인/수정</a></li>
							<li><a href="#">마이펫 관리</a></li>
							<li><a href="#">예약 내역</a></li>
							<li><a href="#">구매 내역</a></li>
							<li><a href="#">후기 관리</a></li>
							<li><a href="#">장바구니</a></li>
							<li><a href="../mypage/mypage_wishlist.do">위시리스트</a></li>
						</ul>
						<ul class="text-center" >
						 <li ><a href="#" style="color:#ea0000">회원탈퇴</a></li>
						</ul>
					</div>
				</div>
				
		    <jsp:include page="${mypage_jsp }"></jsp:include>
				</div>
			</div>
	</section>
</body>
</html>