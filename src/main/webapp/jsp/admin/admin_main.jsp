<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<section class="blog-page page fix "><!-- Start Blog Area-->
		<div class="container">
			<div class="row">
				<div class="col-sm-4 col-md-3">
					<div class="single-sidebar">
						<h2><a href="../admin/main.do" style="color:white;text-decoration:none;">관리자페이지 홈</a></h2>
						<ul class="text-center">
							<li><a href="#">회원 관리</a></li>
							<li><a href="../admin/booking.do">예약 관리</a></li>
							<li><a href="#">공지사항 관리</a></li>
							<li><a href="#">자유게시판 관리</a></li>
							<li><a href="../admin/question_list.do">묻고 답하기</a></li>
							<li><a href="#">업체 등록</a></li>
						</ul>
					</div>
				</div>
				<div class="col-sm-8 col-md-9 mypage-main" style="text-align: center">
				 <div class="row">
				    <jsp:include page="${admin_jsp }"></jsp:include>
			     </div>
			 	</div>
				</div>
			</div>
	</section>
