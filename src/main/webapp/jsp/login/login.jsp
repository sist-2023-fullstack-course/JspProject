<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
	<meta charset="UTF-8">
	<title>Olongkar | Login & Reg</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- Fav Icon -->
	<link id="favicon" rel="icon" type="image/png" href="../../img/favicon.ico" />
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
<jsp:include page="../header.jsp"></jsp:include>
<div class="page-title fix"><!--Start Title-->
	<div class="overlay section">
		<h2>login / Register</h2>
	</div>
</div><!--End Title-->
<div class="login-page page fix"><!--start login Area-->
	<div class="container">
		<div class="row">
			<div class="col-sm-6 col-md-5">
				<div class="login">
					<form id="login-form" action="#">
						<h2>Login</h2>
						<p>Welcome to your account</p>
						<div class="social-login">
							<a id="facebook" href="#"><i class="fa fa-facebook"></i>Sign In with Facebook</a>
							<a id="twitter" href="#"><i class="fa fa-twitter"></i>Sign In with Twitter</a>
						</div>
						<label>E-mail Address<span>*</span></label>
						<input type="text" />
						<label>Password<span>*</span></label>
						<input type="password" />
						<div class="remember">
							<input type="checkbox" />
							<p>Remember me!</p>
							<a href="#">Forgot Your Password ?</a>
						</div>
						<input type="submit" value="login" />
					</form>
				</div>
			</div>
			<div class="col-md-2"></div>
			<div class="col-sm-6 col-md-5">
				<div class="login">
					<form id="signup-form" action="#">
						<h2>Create A new Account</h2>
						<p>Create your own account</p>
						<label>E-mail Address<span>*</span></label>
						<input type="text" />
						<label>Password<span>*</span></label>
						<input type="password" />
						<label>Confirm Password<span>*</span></label>
						<input type="password" />
						<input type="submit" value="Sign up" />
					</form>
				</div>
			</div>
		</div>
	</div>
</div><!--End login Area-->
<div class="brand-area section fix"><!--Start Brand Area-->
	<div class="container">
		<div class="row">
			<div class="section-title">
				<h2>Our Brands</h2>
				<div class="underline"></div>
			</div>
			<div class="brand-slider owl-carousel">
				<div class="brand-item"><img src="../../img/brand/brand-1.png" alt="" /></div>
				<div class="brand-item"><img src="../../img/brand/brand-2.png" alt="" /></div>
				<div class="brand-item"><img src="../../img/brand/brand-3.png" alt="" /></div>
				<div class="brand-item"><img src="../../img/brand/brand-4.png" alt="" /></div>
				<div class="brand-item"><img src="../../img/brand/brand-5.png" alt="" /></div>
				<div class="brand-item"><img src="../../img/brand/brand-1.png" alt="" /></div>
				<div class="brand-item"><img src="../../img/brand/brand-2.png" alt="" /></div>
				<div class="brand-item"><img src="../../img/brand/brand-3.png" alt="" /></div>
				<div class="brand-item"><img src="../../img/brand/brand-4.png" alt="" /></div>
				<div class="brand-item"><img src="../../img/brand/brand-5.png" alt="" /></div>
			</div>
		</div>
	</div>
</div><!--End Brand Area-->
<div class="support-area section fix"><!--Start Support Area-->
	<div class="container">
		<div class="row">
			<div class="support col-sm-3">
				<i class="fa fa-thumbs-up"></i>
				<h3>High quality</h3>
				<p>Lorem ipsum dolor sit amet, conseetur adipiscing elit, consectetur</p>
			</div>
			<div class="support col-sm-3">
				<i class="fa fa-bus"></i>
				<h3>Fast Delivery</h3>
				<p>Lorem ipsum dolor sit amet, conseetur adipiscing elit, consectetur</p>
			</div>
			<div class="support col-sm-3">
				<i class="fa fa-phone"></i>
				<h3>24/7 support</h3>
				<p>Lorem ipsum dolor sit amet, conseetur adipiscing elit, consectetur</p>
			</div>
			<div class="support col-sm-3">
				<i class="fa fa-random"></i>
				<h3>14 - Day Returns</h3>
				<p>Lorem ipsum dolor sit amet, conseetur adipiscing elit, consectetur</p>
			</div>
		</div>
	</div>
</div>
<jsp:include page="../footer.jsp"></jsp:include>
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