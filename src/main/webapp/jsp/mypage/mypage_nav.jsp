<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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
			<jsp:include page="${mypage_jsp }"></jsp:include>
			</div>
		</div>
	</div>
</section>
</body>
</html>