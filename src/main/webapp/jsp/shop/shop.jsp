<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
	<meta charset="UTF-8">
	<title>Olongkar | Cart</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- Fav Icon -->
	<link id="favicon" rel="icon" type="image/png" href="../img/favicon.ico" />
	<!-- Google Font Raleway -->
	<link href='https://fonts.googleapis.com/css?family=Raleway:200,300,500,400,600,700,800' rel='stylesheet' type='text/css'>
	<!-- Google Font Dancing Script -->
	<link href='https://fonts.googleapis.com/css?family=Dancing+Script' rel='stylesheet' type='text/css'>
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" type="text/css" href="../../css/bootstrap.min.css" />
	<!-- Font Awesome CSS -->
	<link rel="stylesheet" type="text/css" href="../../css/font-awesome.min.css" />
	<!-- Owl Carousel CSS -->
	<link rel="stylesheet" type="text/css" href="../../css/owl.carousel.min.css" />
	<!-- Animate CSS -->
	<link rel="stylesheet" type="text/css" href="../../css/animate.min.css" />
	<!-- simpleLens CSS -->
	<link rel="stylesheet" type="text/css" href="../../css/jquery.simpleLens.css" />
	<!-- Price Slider CSS -->
	<link rel="stylesheet" type="text/css" href="../../css/jquery-price-slider.css" />
	<!-- MeanMenu CSS -->
	<link rel="stylesheet" type="text/css" href="../../css/meanmenu.min.css" />
	<!-- Magnific Popup CSS -->
	<link rel="stylesheet" type="text/css" href="../../css/magnific-popup.css" />
	<!-- Nivo Slider CSS -->
	<link rel="stylesheet" type="text/css" href="../../css/nivo-slider.css" />
	<!-- Stylesheet CSS -->
	<link rel="stylesheet" type="text/css" href="../../style.css" />
	<!-- Responsive Stylesheet -->
	<link rel="stylesheet" type="text/css" href="../../css/responsive.css" />
	<!--[if IE]><script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
</head>
<body>
<!--End Title-->
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
<!--Start Support Area-->
<!-- jQuery 2.1.4 -->
<script type="text/javascript" src="../../js/jquery-2.1.4.min.js"></script>
<!-- Bootstrap JS -->
<script type="text/javascript" src="../../js/bootstrap.min.js"></script>
<!-- Owl Carousel JS -->
<script type="text/javascript" src="../../js/owl.carousel.min.js"></script>
<!--countTo JS -->
<script type="text/javascript" src="../../js/jquery.countTo.js"></script>
<!-- mixitup JS -->
<script type="text/javascript" src="../../js/jquery.mixitup.min.js"></script>
<!-- magnific popup JS -->
<script type="text/javascript" src="../../js/jquery.magnific-popup.min.js"></script>
<!-- Appear JS -->
<script type="text/javascript" src="../../js/jquery.appear.js"></script>
<!-- MeanMenu JS -->
<script type="text/javascript" src="../../js/jquery.meanmenu.min.js"></script>
<!-- Nivo Slider JS -->
<script type="text/javascript" src="../../js/jquery.nivo.slider.pack.js"></script>
<!-- Scrollup JS -->
<script type="text/javascript" src="../../js/jquery.scrollup.min.js"></script>
<!-- simpleLens JS -->
<script type="text/javascript" src="../../js/jquery.simpleLens.min.js"></script>
<!-- Price Slider JS -->
<script type="text/javascript" src="../../js/jquery-price-slider.js"></script>
<!-- WOW JS -->
<script type="text/javascript" src="../../js/wow.min.js"></script>
<script>
	new WOW().init();
</script>	
<!-- Main JS -->
<script type="text/javascript" src="../../js/main.js"></script>

</body>

</html>