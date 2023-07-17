<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<section class="blog-page page fix mypage"><!-- Start Blog Area-->
		<div class="container">
				<div class="col-md-3">
					<div class="single-sidebar">
						<ul class="text-center">
							<li><a href="../board/board_list.do?cat=공지사항">공지사항</a></li>
							<li><a href="../board/board_list.do?cat=자유토크">자유토크</a></li>
							<li><a href="../board/board_list.do?cat=자랑하기">마이펫 자랑하기</a></li>
							<li><a href="#">Q&amp;A</a></li>
						</ul>
					</div>
				</div>
				<div class="col-sm-8 col-md-9 ">
				    <jsp:include page="${board_jsp }"></jsp:include>
				</div>
		</div>
	</section>
	
