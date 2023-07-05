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
<jsp:include page="../header.jsp"></jsp:include>
<div class="page-title fix"><!--Start Title-->
	<div class="overlay section">
		<h2>Shop</h2>
	</div>
</div><!--End Title-->
<div class="shop-product-area section fix"><!--Start Shop Area-->
	<div class="container">
		<div class="row">
			<div class="shop-tool-bar col-sm-12 fix">
				<div class="view-mode">
					<a href="shop.html" class="active"><i class="fa fa-th"></i></a>
					<a href="shop-list.html"><i class="fa fa-th-list"></i></a>
				</div>
				<div class="sort-by">
					<span>Sort By</span>
					<select name="sort-by">
						<option selected="selected" value="mercede">price: Lower</option>
						<option value="saab">price(low&gt;high)</option>
						<option value="mercedes">price(high &gt; low)</option>
						<option value="audi">rating(highest)</option>
					</select>
				</div>
				<div class="show-product">
					<span>Show</span>
					<select name="sort-by">
						<option selected="selected" value="mercede">16</option>
						<option value="saab">20</option>
						<option value="mercedes">24</option>
					</select>
					<span>Per Page</span>
				</div>
				<div class="pro-Showing">
					<span>Showing 1 - 12 of 16 items</span>
				</div>
			</div>
			<div class="shop-products">
				<!-- Single Product Start -->
				<div class="col-sm-4 col-md-3 fix">
					<div class="product-item fix">
						<div class="product-img-hover">
							<!-- Product image -->
							<a href="product-details.html" class="pro-image fix"><img src="../../img/product/1.jpg" alt="product" /></a>
							<!-- Product action Btn -->
							<div class="product-action-btn">
								<a class="quick-view" href="#"><i class="fa fa-search"></i></a>
								<a class="favorite" href="#"><i class="fa fa-heart-o"></i></a>
								<a class="add-cart" href="#"><i class="fa fa-shopping-cart"></i></a>
							</div>
						</div>
						<div class="pro-name-price-ratting">
							<!-- Product Name -->
							<div class="pro-name">
								<a href="product-details.html">Product Name Demo</a>
							</div>
							<!-- Product Ratting -->
							<div class="pro-ratting">
								<i class="on fa fa-star"></i>
								<i class="on fa fa-star"></i>
								<i class="on fa fa-star"></i>
								<i class="on fa fa-star"></i>
								<i class="on fa fa-star-half-o"></i>
							</div>
							<!-- Product Price -->
							<div class="pro-price fix">
								<p><span class="old">$165</span><span class="new">$150</span></p>
							</div>
						</div>
					</div>
				</div><!-- Single Product End -->
				<!-- Single Product Start -->
				<div class="col-sm-4 col-md-3 fix">
					<div class="product-item fix">
						<div class="product-img-hover">
							<!-- Product image -->
							<a href="product-details.html" class="pro-image fix"><img src="../../img/product/2.jpg" alt="product" /></a>
							<!-- Product action Btn -->
							<div class="product-action-btn">
								<a class="quick-view" href="#"><i class="fa fa-search"></i></a>
								<a class="favorite" href="#"><i class="fa fa-heart-o"></i></a>
								<a class="add-cart" href="#"><i class="fa fa-shopping-cart"></i></a>
							</div>
						</div>
						<div class="pro-name-price-ratting">
							<!-- Product Name -->
							<div class="pro-name">
								<a href="product-details.html">Product Name Demo</a>
							</div>
							<!-- Product Ratting -->
							<div class="pro-ratting">
								<i class="on fa fa-star"></i>
								<i class="on fa fa-star"></i>
								<i class="on fa fa-star"></i>
								<i class="on fa fa-star"></i>
								<i class="on fa fa-star-half-o"></i>
							</div>
							<!-- Product Price -->
							<div class="pro-price fix">
								<p><span class="old">$165</span><span class="new">$150</span></p>
							</div>
						</div>
					</div>
				</div><!-- Single Product End -->
				<!-- Single Product Start -->
				<div class="col-sm-4 col-md-3 fix">
					<div class="product-item fix">
						<div class="product-img-hover">
							<!-- Product image -->
							<a href="product-details.html" class="pro-image fix"><img src="../../img/product/3.jpg" alt="product" /></a>
							<div class="hot-pro"><img src="../../img/hot.png" alt="" /></div>
							<!-- Product action Btn -->
							<div class="product-action-btn">
								<a class="quick-view" href="#"><i class="fa fa-search"></i></a>
								<a class="favorite" href="#"><i class="fa fa-heart-o"></i></a>
								<a class="add-cart" href="#"><i class="fa fa-shopping-cart"></i></a>
							</div>
						</div>
						<div class="pro-name-price-ratting">
							<!-- Product Name -->
							<div class="pro-name">
								<a href="product-details.html">Product Name Demo</a>
							</div>
							<!-- Product Ratting -->
							<div class="pro-ratting">
								<i class="on fa fa-star"></i>
								<i class="on fa fa-star"></i>
								<i class="on fa fa-star"></i>
								<i class="on fa fa-star"></i>
								<i class="on fa fa-star-half-o"></i>
							</div>
							<!-- Product Price -->
							<div class="pro-price fix">
								<p><span class="old">$165</span><span class="new">$150</span></p>
							</div>
						</div>
					</div>
				</div><!-- Single Product End -->
				<!-- Single Product Start -->
				<div class="col-sm-4 col-md-3 fix">
					<div class="product-item fix">
						<div class="product-img-hover">
							<!-- Product image -->
							<a href="product-details.html" class="pro-image fix"><img src="../../img/product/4.jpg" alt="product" /></a>
							<!-- Product action Btn -->
							<div class="product-action-btn">
								<a class="quick-view" href="#"><i class="fa fa-search"></i></a>
								<a class="favorite" href="#"><i class="fa fa-heart-o"></i></a>
								<a class="add-cart" href="#"><i class="fa fa-shopping-cart"></i></a>
							</div>
						</div>
						<div class="pro-name-price-ratting">
							<!-- Product Name -->
							<div class="pro-name">
								<a href="product-details.html">Product Name Demo</a>
							</div>
							<!-- Product Ratting -->
							<div class="pro-ratting">
								<i class="on fa fa-star"></i>
								<i class="on fa fa-star"></i>
								<i class="on fa fa-star"></i>
								<i class="on fa fa-star"></i>
								<i class="on fa fa-star-half-o"></i>
							</div>
							<!-- Product Price -->
							<div class="pro-price fix">
								<p><span class="old">$165</span><span class="new">$150</span></p>
							</div>
						</div>
					</div>
				</div><!-- Single Product End -->
				<!-- Single Product Start -->
				<div class="col-sm-4 col-md-3 fix">
					<div class="product-item fix">
						<div class="product-img-hover">
							<!-- Product image -->
							<a href="product-details.html" class="pro-image fix"><img src="../../img/product/5.jpg" alt="product" /></a>
							<!-- Product action Btn -->
							<div class="product-action-btn">
								<a class="quick-view" href="#"><i class="fa fa-search"></i></a>
								<a class="favorite" href="#"><i class="fa fa-heart-o"></i></a>
								<a class="add-cart" href="#"><i class="fa fa-shopping-cart"></i></a>
							</div>
						</div>
						<div class="pro-name-price-ratting">
							<!-- Product Name -->
							<div class="pro-name">
								<a href="product-details.html">Product Name Demo</a>
							</div>
							<!-- Product Ratting -->
							<div class="pro-ratting">
								<i class="on fa fa-star"></i>
								<i class="on fa fa-star"></i>
								<i class="on fa fa-star"></i>
								<i class="on fa fa-star"></i>
								<i class="on fa fa-star-half-o"></i>
							</div>
							<!-- Product Price -->
							<div class="pro-price fix">
								<p><span class="old">$165</span><span class="new">$150</span></p>
							</div>
						</div>
					</div>
				</div><!-- Single Product End -->
				<!-- Single Product Start -->
				<div class="col-sm-4 col-md-3 fix">
					<div class="product-item fix">
						<div class="product-img-hover">
							<!-- Product image -->
							<a href="product-details.html" class="pro-image fix"><img src="../../img/product/6.jpg" alt="product" /></a>
							<div class="new-pro"><img src="../../img/new.png" alt="" /></div>
							<!-- Product action Btn -->
							<div class="product-action-btn">
								<a class="quick-view" href="#"><i class="fa fa-search"></i></a>
								<a class="favorite" href="#"><i class="fa fa-heart-o"></i></a>
								<a class="add-cart" href="#"><i class="fa fa-shopping-cart"></i></a>
							</div>
						</div>
						<div class="pro-name-price-ratting">
							<!-- Product Name -->
							<div class="pro-name">
								<a href="product-details.html">Product Name Demo</a>
							</div>
							<!-- Product Ratting -->
							<div class="pro-ratting">
								<i class="on fa fa-star"></i>
								<i class="on fa fa-star"></i>
								<i class="on fa fa-star"></i>
								<i class="on fa fa-star"></i>
								<i class="on fa fa-star-half-o"></i>
							</div>
							<!-- Product Price -->
							<div class="pro-price fix">
								<p><span class="old">$165</span><span class="new">$150</span></p>
							</div>
						</div>
					</div>
				</div><!-- Single Product End -->
				<!-- Single Product Start -->
				<div class="col-sm-4 col-md-3 fix">
					<div class="product-item fix">
						<div class="product-img-hover">
							<!-- Product image -->
							<a href="product-details.html" class="pro-image fix"><img src="../../img/product/7.jpg" alt="product" /></a>
							<!-- Product action Btn -->
							<div class="product-action-btn">
								<a class="quick-view" href="#"><i class="fa fa-search"></i></a>
								<a class="favorite" href="#"><i class="fa fa-heart-o"></i></a>
								<a class="add-cart" href="#"><i class="fa fa-shopping-cart"></i></a>
							</div>
						</div>
						<div class="pro-name-price-ratting">
							<!-- Product Name -->
							<div class="pro-name">
								<a href="product-details.html">Product Name Demo</a>
							</div>
							<!-- Product Ratting -->
							<div class="pro-ratting">
								<i class="on fa fa-star"></i>
								<i class="on fa fa-star"></i>
								<i class="on fa fa-star"></i>
								<i class="on fa fa-star"></i>
								<i class="on fa fa-star-half-o"></i>
							</div>
							<!-- Product Price -->
							<div class="pro-price fix">
								<p><span class="old">$165</span><span class="new">$150</span></p>
							</div>
						</div>
					</div>
				</div><!-- Single Product End -->
				<!-- Single Product Start -->
				<div class="col-sm-4 col-md-3 fix">
					<div class="product-item fix">
						<div class="product-img-hover">
							<!-- Product image -->
							<a href="product-details.html" class="pro-image fix"><img src="../../img/product/8.jpg" alt="product" /></a>
							<!-- Product action Btn -->
							<div class="product-action-btn">
								<a class="quick-view" href="#"><i class="fa fa-search"></i></a>
								<a class="favorite" href="#"><i class="fa fa-heart-o"></i></a>
								<a class="add-cart" href="#"><i class="fa fa-shopping-cart"></i></a>
							</div>
						</div>
						<div class="pro-name-price-ratting">
							<!-- Product Name -->
							<div class="pro-name">
								<a href="product-details.html">Product Name Demo</a>
							</div>
							<!-- Product Ratting -->
							<div class="pro-ratting">
								<i class="on fa fa-star"></i>
								<i class="on fa fa-star"></i>
								<i class="on fa fa-star"></i>
								<i class="on fa fa-star"></i>
								<i class="on fa fa-star-half-o"></i>
							</div>
							<!-- Product Price -->
							<div class="pro-price fix">
								<p><span class="old">$165</span><span class="new">$150</span></p>
							</div>
						</div>
					</div>
				</div><!-- Single Product End -->
				<!-- Single Product Start -->
				<div class="col-sm-4 col-md-3 fix">
					<div class="product-item fix">
						<div class="product-img-hover">
							<!-- Product image -->
							<a href="product-details.html" class="pro-image fix"><img src="../../img/product/9.jpg" alt="product" /></a>
							<!-- Product action Btn -->
							<div class="product-action-btn">
								<a class="quick-view" href="#"><i class="fa fa-search"></i></a>
								<a class="favorite" href="#"><i class="fa fa-heart-o"></i></a>
								<a class="add-cart" href="#"><i class="fa fa-shopping-cart"></i></a>
							</div>
						</div>
						<div class="pro-name-price-ratting">
							<!-- Product Name -->
							<div class="pro-name">
								<a href="product-details.html">Product Name Demo</a>
							</div>
							<!-- Product Ratting -->
							<div class="pro-ratting">
								<i class="on fa fa-star"></i>
								<i class="on fa fa-star"></i>
								<i class="on fa fa-star"></i>
								<i class="on fa fa-star"></i>
								<i class="on fa fa-star-half-o"></i>
							</div>
							<!-- Product Price -->
							<div class="pro-price fix">
								<p><span class="old">$165</span><span class="new">$150</span></p>
							</div>
						</div>
					</div>
				</div><!-- Single Product End -->
				<!-- Single Product Start -->
				<div class="col-sm-4 col-md-3 fix">
					<div class="product-item fix">
						<div class="product-img-hover">
							<!-- Product image -->
							<a href="product-details.html" class="pro-image fix"><img src="../../img/product/10.jpg" alt="product" /></a>
							<!-- Product action Btn -->
							<div class="product-action-btn">
								<a class="quick-view" href="#"><i class="fa fa-search"></i></a>
								<a class="favorite" href="#"><i class="fa fa-heart-o"></i></a>
								<a class="add-cart" href="#"><i class="fa fa-shopping-cart"></i></a>
							</div>
						</div>
						<div class="pro-name-price-ratting">
							<!-- Product Name -->
							<div class="pro-name">
								<a href="product-details.html">Product Name Demo</a>
							</div>
							<!-- Product Ratting -->
							<div class="pro-ratting">
								<i class="on fa fa-star"></i>
								<i class="on fa fa-star"></i>
								<i class="on fa fa-star"></i>
								<i class="on fa fa-star"></i>
								<i class="on fa fa-star-half-o"></i>
							</div>
							<!-- Product Price -->
							<div class="pro-price fix">
								<p><span class="old">$165</span><span class="new">$150</span></p>
							</div>
						</div>
					</div>
				</div><!-- Single Product End -->
				<!-- Single Product Start -->
				<div class="col-sm-4 col-md-3 fix">
					<div class="product-item fix">
						<div class="product-img-hover">
							<!-- Product image -->
							<a href="product-details.html" class="pro-image fix"><img src="../../img/product/1.jpg" alt="product" /></a>
							<!-- Product action Btn -->
							<div class="product-action-btn">
								<a class="quick-view" href="#"><i class="fa fa-search"></i></a>
								<a class="favorite" href="#"><i class="fa fa-heart-o"></i></a>
								<a class="add-cart" href="#"><i class="fa fa-shopping-cart"></i></a>
							</div>
						</div>
						<div class="pro-name-price-ratting">
							<!-- Product Name -->
							<div class="pro-name">
								<a href="product-details.html">Product Name Demo</a>
							</div>
							<!-- Product Ratting -->
							<div class="pro-ratting">
								<i class="on fa fa-star"></i>
								<i class="on fa fa-star"></i>
								<i class="on fa fa-star"></i>
								<i class="on fa fa-star"></i>
								<i class="on fa fa-star-half-o"></i>
							</div>
							<!-- Product Price -->
							<div class="pro-price fix">
								<p><span class="old">$165</span><span class="new">$150</span></p>
							</div>
						</div>
					</div>
				</div><!-- Single Product End -->
				<!-- Single Product Start -->
				<div class="col-sm-4 col-md-3 fix">
					<div class="product-item fix">
						<div class="product-img-hover">
							<!-- Product image -->
							<a href="product-details.html" class="pro-image fix"><img src="../../img/product/2.jpg" alt="product" /></a>
							<!-- Product action Btn -->
							<div class="product-action-btn">
								<a class="quick-view" href="#"><i class="fa fa-search"></i></a>
								<a class="favorite" href="#"><i class="fa fa-heart-o"></i></a>
								<a class="add-cart" href="#"><i class="fa fa-shopping-cart"></i></a>
							</div>
						</div>
						<div class="pro-name-price-ratting">
							<!-- Product Name -->
							<div class="pro-name">
								<a href="product-details.html">Product Name Demo</a>
							</div>
							<!-- Product Ratting -->
							<div class="pro-ratting">
								<i class="on fa fa-star"></i>
								<i class="on fa fa-star"></i>
								<i class="on fa fa-star"></i>
								<i class="on fa fa-star"></i>
								<i class="on fa fa-star-half-o"></i>
							</div>
							<!-- Product Price -->
							<div class="pro-price fix">
								<p><span class="old">$165</span><span class="new">$150</span></p>
							</div>
						</div>
					</div>
				</div><!-- Single Product End -->
				<!-- Single Product Start -->
				<div class="col-sm-4 col-md-3 fix">
					<div class="product-item fix">
						<div class="product-img-hover">
							<!-- Product image -->
							<a href="product-details.html" class="pro-image fix"><img src="../../img/product/3.jpg" alt="product" /></a>
							<!-- Product action Btn -->
							<div class="product-action-btn">
								<a class="quick-view" href="#"><i class="fa fa-search"></i></a>
								<a class="favorite" href="#"><i class="fa fa-heart-o"></i></a>
								<a class="add-cart" href="#"><i class="fa fa-shopping-cart"></i></a>
							</div>
						</div>
						<div class="pro-name-price-ratting">
							<!-- Product Name -->
							<div class="pro-name">
								<a href="product-details.html">Product Name Demo</a>
							</div>
							<!-- Product Ratting -->
							<div class="pro-ratting">
								<i class="on fa fa-star"></i>
								<i class="on fa fa-star"></i>
								<i class="on fa fa-star"></i>
								<i class="on fa fa-star"></i>
								<i class="on fa fa-star-half-o"></i>
							</div>
							<!-- Product Price -->
							<div class="pro-price fix">
								<p><span class="old">$165</span><span class="new">$150</span></p>
							</div>
						</div>
					</div>
				</div><!-- Single Product End -->
				<!-- Single Product Start -->
				<div class="col-sm-4 col-md-3 fix">
					<div class="product-item fix">
						<div class="product-img-hover">
							<!-- Product image -->
							<a href="product-details.html" class="pro-image fix"><img src="../../img/product/4.jpg" alt="product" /></a>
							<!-- Product action Btn -->
							<div class="product-action-btn">
								<a class="quick-view" href="#"><i class="fa fa-search"></i></a>
								<a class="favorite" href="#"><i class="fa fa-heart-o"></i></a>
								<a class="add-cart" href="#"><i class="fa fa-shopping-cart"></i></a>
							</div>
						</div>
						<div class="pro-name-price-ratting">
							<!-- Product Name -->
							<div class="pro-name">
								<a href="product-details.html">Product Name Demo</a>
							</div>
							<!-- Product Ratting -->
							<div class="pro-ratting">
								<i class="on fa fa-star"></i>
								<i class="on fa fa-star"></i>
								<i class="on fa fa-star"></i>
								<i class="on fa fa-star"></i>
								<i class="on fa fa-star-half-o"></i>
							</div>
							<!-- Product Price -->
							<div class="pro-price fix">
								<p><span class="old">$165</span><span class="new">$150</span></p>
							</div>
						</div>
					</div>
				</div><!-- Single Product End -->
				<!-- Single Product Start -->
				<div class="col-sm-4 col-md-3 fix">
					<div class="product-item fix">
						<div class="product-img-hover">
							<!-- Product image -->
							<a href="product-details.html" class="pro-image fix"><img src="../../img/product/5.jpg" alt="product" /></a>
							<!-- Product action Btn -->
							<div class="product-action-btn">
								<a class="quick-view" href="#"><i class="fa fa-search"></i></a>
								<a class="favorite" href="#"><i class="fa fa-heart-o"></i></a>
								<a class="add-cart" href="#"><i class="fa fa-shopping-cart"></i></a>
							</div>
						</div>
						<div class="pro-name-price-ratting">
							<!-- Product Name -->
							<div class="pro-name">
								<a href="product-details.html">Product Name Demo</a>
							</div>
							<!-- Product Ratting -->
							<div class="pro-ratting">
								<i class="on fa fa-star"></i>
								<i class="on fa fa-star"></i>
								<i class="on fa fa-star"></i>
								<i class="on fa fa-star"></i>
								<i class="on fa fa-star-half-o"></i>
							</div>
							<!-- Product Price -->
							<div class="pro-price fix">
								<p><span class="old">$165</span><span class="new">$150</span></p>
							</div>
						</div>
					</div>
				</div><!-- Single Product End -->
				<!-- Single Product Start -->
				<div class="col-sm-4 col-md-3 fix">
					<div class="product-item fix">
						<div class="product-img-hover">
							<!-- Product image -->
							<a href="product-details.html" class="pro-image fix"><img src="../../img/product/6.jpg" alt="product" /></a>
							<!-- Product action Btn -->
							<div class="product-action-btn">
								<a class="quick-view" href="#"><i class="fa fa-search"></i></a>
								<a class="favorite" href="#"><i class="fa fa-heart-o"></i></a>
								<a class="add-cart" href="#"><i class="fa fa-shopping-cart"></i></a>
							</div>
						</div>
						<div class="pro-name-price-ratting">
							<!-- Product Name -->
							<div class="pro-name">
								<a href="product-details.html">Product Name Demo</a>
							</div>
							<!-- Product Ratting -->
							<div class="pro-ratting">
								<i class="on fa fa-star"></i>
								<i class="on fa fa-star"></i>
								<i class="on fa fa-star"></i>
								<i class="on fa fa-star"></i>
								<i class="on fa fa-star-half-o"></i>
							</div>
							<!-- Product Price -->
							<div class="pro-price fix">
								<p><span class="old">$165</span><span class="new">$150</span></p>
							</div>
						</div>
					</div><!-- Single Product End -->
				</div>
				<!-- Pagination -->
				<div class="pagination">
					<ul>
						<li><a href="#"><i class="fa fa-angle-left"></i></a></li>
						<li class="active"><span>1</span></li>
						<li><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">4</a></li>
						<li><a href="#">5</a></li>
						<li><a href="#">6</a></li>
						<li><a href="#">7</a></li>
						<li><a href="#">8</a></li>
						<li><a href="#">9</a></li>
						<li><a href="#"><i class="fa fa-angle-right"></i></a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div><!--Start Shop Area-->
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
</div><!--Start Support Area-->
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