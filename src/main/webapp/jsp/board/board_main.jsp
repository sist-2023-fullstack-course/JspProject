<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<section class="blog-page page fix mypage"><!-- Start Blog Area-->
		<div class="container">
			<div class="row">
				<div class="col-sm-4 col-md-3">
					<div class="single-sidebar">
						<h2><a href="../mypage/main.do" style="color:white;text-decoration:none;">마이페이지 홈</a></h2>
						<ul class="text-center">
							<li><a href="../mypage/myinfo.do">자유토크</a></li>
							<li><a href="../mypage/mypet.do">마이펫 자랑하기</a></li>
							<li><a href="#">Q&amp;A</a></li>
						</ul>
					</div>
				</div>
				<div class="col-sm-8 col-md-9 ">
				    <jsp:include page="${board_jsp }"></jsp:include>
				</div>
			</div>
		</div>
	</section>
	
