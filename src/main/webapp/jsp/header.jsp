<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="header-top"><!--Start Header Top Area-->
	<div class="container">
		<div class="row">
			<div class="col-sm-12 col-md-4">
				<div class="info">
					<div class="phn-num float-left">
						<i class="fa fa-phone float-left"></i>
						<p>(000)  123  288  456 </p>
					</div>
					<div class="mail-id float-left">
						<i class="fa fa-envelope-o float-left"></i>
						<p><a href="#">info@olongker.com</a></p>
					</div>
				</div>
			</div>
			<div class="col-sm-12 col-md-4">
				<div class="socials text-center">
					<a href="#"><i class="fa fa-facebook"></i></a>
					<a href="#"><i class="fa fa-twitter"></i></a>
					<a href="#"><i class="fa fa-linkedin"></i></a>
					<a href="#"><i class="fa fa-google-plus"></i></a>
				</div>
			</div>
			<div class="col-sm-12 col-md-4">
				<div id="top-menu" class="float-right">
					<ul>
						<li><a href="">My Account</a></li>
						<li><a href="">$USD <i class="fa fa-angle-down"></i></a>
							<ul>
								<li><a href="">Pound</a></li>
								<li><a href="">BDT</a></li>
							</ul>
						</li>
						<li><a href="">English(UK) <i class="fa fa-angle-down"></i></a>
							<ul>
								<li><a href="">English(USA)</a></li>
								<li><a href="">Bangla</a></li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div><!--End Header Top Area-->
<div class="header-area"><!--Start Header Area-->
	<div class="container">
		<div class="row">
			<div class="col-sm-4 col-lg-3">
				<div class="log-link">
					<p>Well come visitor you can</p>
					<h5><a href="jsp/login/login.jsp">Login</a> or <a href="jsp/login/login.jsp">Create an account</a></h5>
				</div>
			</div>
			<div class="col-sm-4 col-lg-6">
				<div class="logo text-center">
					<a href="index.jsp">
						<img src="img/header/logo.png" alt="" />
						<h4>online jewelry store</h4>
					</a>
				</div>
			</div>
			<div class="col-sm-4 col-lg-3">
				<div class="cart-info float-right">
					<a href="jsp/shop/cart.jsp">
						<h5>My cart <span>2</span> items - <span>$390</span></h5>
						<i class="fa fa-shopping-cart"></i>
					</a>
					<div class="cart-hover">
						<ul class="header-cart-pro">
							<li>
								<div class="image"><a href="#"><img alt="cart item" src="img/cart-1.jpg"></a></div>
								<div class="content fix"><a href="#">Product Name</a><span class="price">Price: $130</span><span class="quantity">Quantity: 1</span></div>
								<i class="fa fa-trash delete"></i>
							</li>
							<li>
								<div class="image"><a href="#"><img alt="cart item" src="img/cart-2.jpg"></a></div>
								<div class="content fix"><a href="#">Product Name</a><span class="price">Price: $130</span><span class="quantity">Quantity: 2</span></div>
								<i class="fa fa-trash delete"></i>
							</li>
						</ul>
						<div class="header-button-price">
							<a href="jsp/etc/checkout.jsp"><i class="fa fa-sign-out"></i><span>Check Out</span></a>
							<div class="total-price"><h3>Total Price : <span>$390</span></h3></div>
						</div>
					</div>
				</div>
				<div class="search float-right">
					<input type="text" value="" placeholder="Search Here...." />
					<button class="submit"><i class="fa fa-search"></i></button>
				</div>
			</div>
		</div>
	</div>
</div><!--End Header Area-->
<div class="menu-area"><!--Start Main Menu Area-->
	<div class="container">
		<div class="row">
			<div class="clo-md-12">
				<div class="main-menu hidden-sm hidden-xs">
					<nav>
						<ul>
							<li><a href="index.jsp" class="active">Home</a>
								<ul class="sub-menu">
									<li><a href="index.jsp">Home 1</a></li>
									<li><a href="index-2.jsp">Home 2</a></li>
									<li><a href="index-3.jsp">Home 3</a></li>
								</ul>
							</li>
							<li><a href="#">Pages</a>
								<div class="mega-menu mega-menu-page">
									<div class="column-1 column">
										<ul>
											<li><a href="jsp/etc/about-us.jsp">About US</a></li>
											<li><a href="jsp/search/blog.jsp">Blog</a></li>
											<li><a href="jsp/search/blog-left-sidebar.jsp">Blog left sidebar</a></li>
											<li><a href="jsp/search/blog-right-sidebar.jsp">Blog right sidebar</a></li>
											<li><a href="jsp/search/blog-details.jsp">Blog details</a></li>
										</ul>
									</div>
									<div class="column-2 column">
										<ul>
											<li><a href="jsp/shop/cart.jsp">Cart</a></li>
											<li><a href="jsp/etc/checkout.jsp">Checkout</a></li>
											<li><a href="jsp/etc/coming-soon.jsp">Coming soon</a></li>
											<li><a href="jsp/etc/contact.jsp">Contact</a></li>
											<li><a href="jsp/etc/contact-2.jsp">Contact 2</a></li>
										</ul>
									</div>
									<div class="column-3 column">
										<ul>
											<li><a href="jsp/etc/faq.jsp">FAQ</a></li>
											<li><a href="jsp/login/login.jsp">Login</a></li>
											<li><a href="jsp/search/portfolio.jsp">Portfolio 3 column</a></li>
											<li><a href="jsp/search/portfolio-2.jsp">Portfolio 4 column</a></li>
											<li><a href="jsp/etc/404.jsp">404</a></li>
										</ul>
									</div>
									<div class="column-4 column">
										<ul>
											<li><a href="jsp/shop/shop.jsp">Shop</a></li>
											<li><a href="jsp/shop/shop-list.jsp">Shop list</a></li>
											<li><a href="jsp/shop/shop-left-sidebar.jsp">Shop left sidebar</a></li>
											<li><a href="jsp/shop/shop-right-sidebar.jsp">Shop right sidebar</a></li>
											<li><a href="jsp/shop/product-details.jsp">Product details</a></li>
										</ul>
									</div>
								</div>
							</li>
							<li><a href="jsp/shop/shop.jsp">Shop</a>
								<div class="mega-menu mega-menu-1">
									<div class="column-1 column">
										<ul>
											<li><a href="jsp/shop/shop-list.jsp">rings</a></li>
											<li><a href="jsp/shop/shop-left-sidebar.jsp">diamond ring</a></li>
											<li><a href="jsp/shop/shop-right-sidebar.jsp">gold ring</a></li>
											<li><a href="jsp/shop/shop-list.jsp">sliver ring</a></li>
											<li><a href="jsp/shop/shop-left-sidebar.jsp">Platinum ring</a></li>
										</ul>
									</div>
									<div class="column-2 column">
										<ul>
											<li><a href="jsp/shop/shop-list.jsp">Bracelets</a></li>
											<li><a href="jsp/shop/shop-left-sidebar.jsp">diamond Bracelets</a></li>
											<li><a href="jsp/shop/shop-right-sidebar.jsp">gold Bracelets</a></li>
											<li><a href="jsp/shop/shop-left-sidebar.jsp">sliver Bracelets</a></li>
											<li><a href="jsp/shop/shop-right-sidebar.jsp">Platinum Bracelets</a></li>
										</ul>
									</div>
									<div class="column-3 column">
										<ul>
											<li><a href="jsp/shop/shop-list.jsp">lecklaces</a></li>
											<li><a href="jsp/shop/shop-right-sidebar.jsp">diamond lecklaces</a></li>
											<li><a href="jsp/shop/shop-left-sidebar.jsp">gold lecklaces</a></li>
											<li><a href="jsp/shop/shop-right-sidebar.jsp">sliver lecklaces</a></li>
											<li><a href="jsp/shop/shop-left-sidebar.jsp">Platinum lecklaces</a></li>
										</ul>
									</div>
									<div class="column-4 column">
										<a href="#"><img src="img/product/10.jpg" alt="" /></a>
									</div>
								</div>
							</li>
							<li><a href="jsp/shop/shop.jsp">New Arrivals</a>
								<div class="mega-menu mega-menu-1">
									<div class="column-1 column">
										<ul>
											<li><a href="jsp/shop/shop-list.jsp">rings</a></li>
											<li><a href="jsp/shop/shop-left-sidebar.jsp">diamond ring</a></li>
											<li><a href="jsp/shop/shop-right-sidebar.jsp">gold ring</a></li>
											<li><a href="jsp/shop/shop-list.jsp">sliver ring</a></li>
											<li><a href="jsp/shop/shop-left-sidebar.jsp">Platinum ring</a></li>
										</ul>
									</div>
									<div class="column-2 column">
										<ul>
											<li><a href="jsp/shop/shop-list.jsp">Bracelets</a></li>
											<li><a href="jsp/shop/shop-left-sidebar.jsp">diamond Bracelets</a></li>
											<li><a href="jsp/shop/shop-right-sidebar.jsp">gold Bracelets</a></li>
											<li><a href="jsp/shop/shop-left-sidebar.jsp">sliver Bracelets</a></li>
											<li><a href="jsp/shop/shop-right-sidebar.jsp">Platinum Bracelets</a></li>
										</ul>
									</div>
									<div class="column-3 column">
										<ul>
											<li><a href="jsp/shop/shop-list.jsp">lecklaces</a></li>
											<li><a href="jsp/shop/shop-right-sidebar.jsp">diamond lecklaces</a></li>
											<li><a href="jsp/shop/shop-left-sidebar.jsp">gold lecklaces</a></li>
											<li><a href="jsp/shop/shop-right-sidebar.jsp">sliver lecklaces</a></li>
											<li><a href="jsp/shop/shop-left-sidebar.jsp">Platinum lecklaces</a></li>
										</ul>
									</div>
									<div class="column-4 column">
										<ul>
											<li><a href="jsp/shop/shop-right-sidebar.jsp">earrings</a></li>
											<li><a href="jsp/shop/shop-list.jsp">diamond earrings</a></li>
											<li><a href="jsp/shop/shop-left-sidebar.jsp">gold earrings</a></li>
											<li><a href="jsp/shop/shop-list.jsp">sliver earrings</a></li>
											<li><a href="jsp/shop/shop-left-sidebar.jsp">Platinum earrings</a></li>
										</ul>
									</div>
								</div>
							</li>
							<li><a href="jsp/search/portfolio.jsp">Portfolio</a>
								<ul class="sub-menu">
									<li><a href="jsp/search/portfolio.jsp">Portfolio 3 column</a></li>
									<li><a href="jsp/search/portfolio-2.jsp">Portfolio 4 column</a></li>
								</ul>
							</li>
							<li><a href="jsp/search/blog.jsp">Blog</a>
								<ul class="sub-menu">
									<li><a href="jsp/search/blog.jsp">Blog Page</a></li>
									<li><a href="jsp/search/blog-left-sidebar.jsp">Blog left sidebar</a></li>
									<li><a href="jsp/search/blog-right-sidebar.jsp">Blog right sidebar</a></li>
								</ul>
							</li>
							<li><a href="jsp/etc/about-us.jsp">About Us</a></li>
							<li><a href="jsp/etc/contact.jsp">Contact</a>
								<ul class="sub-menu">
									<li><a href="jsp/etc/contact.jsp">Contact 1</a></li>
									<li><a href="jsp/etc/contact-2.jsp">Contact 2</a></li>
								</ul>
							</li>
						</ul>
					</nav>
				</div>
				<div class="mobile-menu hidden-md hidden-lg">
					<nav>
						<ul>
							<li><a href="index.jsp" class="active">Home</a>
								<ul>
									<li><a href="index.jsp">Home 1</a></li>
									<li><a href="index-2.jsp">Home 2</a></li>
									<li><a href="index-3.jsp">Home 3</a></li>
								</ul>
							</li>
							<li><a href="#">Pages</a>
								<ul>
									<li><a href="jsp/etc/about-us.jsp">About US</a></li>
									<li><a href="jsp/search/blog.jsp">Blog</a></li>
									<li><a href="jsp/search/blog-left-sidebar.jsp">Blog left sidebar</a></li>
									<li><a href="jsp/search/blog-right-sidebar.jsp">Blog right sidebar</a></li>
									<li><a href="jsp/search/blog-details.jsp">Blog details</a></li>
									<li><a href="jsp/shop/cart.jsp">Cart</a></li>
									<li><a href="jsp/etc/checkout.jsp">Checkout</a></li>
									<li><a href="jsp/etc/coming-soon.jsp">Coming soon</a></li>
									<li><a href="jsp/etc/contact.jsp">Contact</a></li>
									<li><a href="jsp/etc/contact-2.jsp">Contact 2</a></li>
									<li><a href="jsp/etc/faq.jsp">FAQ</a></li>
									<li><a href="jsp/login/login.jsp">Login</a></li>
									<li><a href="jsp/search/portfolio.jsp">Portfolio 3 column</a></li>
									<li><a href="jsp/search/portfolio-2.jsp">Portfolio 4 column</a></li>
									<li><a href="jsp/etc/404.jsp">404</a></li>
									<li><a href="jsp/shop/shop.jsp">Shop</a></li>
									<li><a href="jsp/shop/shop-list.jsp">Shop list</a></li>
									<li><a href="jsp/shop/shop-left-sidebar.jsp">Shop left sidebar</a></li>
									<li><a href="jsp/shop/shop-right-sidebar.jsp">Shop right sidebar</a></li>
									<li><a href="jsp/shop/product-details.jsp">Product details</a></li>
								</ul>
							</li>
							<li><a href="jsp/shop/shop.jsp">Shop</a>
								<ul>
									<li><a href="jsp/shop/shop-list.jsp">rings</a>
									<ul>
										<li><a href="jsp/shop/shop-left-sidebar.jsp">diamond ring</a></li>
										<li><a href="jsp/shop/shop-right-sidebar.jsp">gold ring</a></li>
										<li><a href="jsp/shop/shop-list.jsp">sliver ring</a></li>
										<li><a href="jsp/shop/shop-left-sidebar.jsp">Platinum ring</a></li>
									</ul>
									</li>
									<li><a href="jsp/shop/shop-list.jsp">Bracelets</a>
									<ul>
										<li><a href="jsp/shop/shop-left-sidebar.jsp">diamond Bracelets</a></li>
										<li><a href="jsp/shop/shop-right-sidebar.jsp">gold Bracelets</a></li>
										<li><a href="jsp/shop/shop-left-sidebar.jsp">sliver Bracelets</a></li>
										<li><a href="jsp/shop/shop-right-sidebar.jsp">Platinum Bracelets</a></li>
									</ul>
									</li>
									<li><a href="jsp/shop/shop-list.jsp">lecklaces</a>
									<ul>
										<li><a href="jsp/shop/shop-right-sidebar.jsp">diamond lecklaces</a></li>
										<li><a href="jsp/shop/shop-left-sidebar.jsp">gold lecklaces</a></li>
										<li><a href="jsp/shop/shop-right-sidebar.jsp">sliver lecklaces</a></li>
										<li><a href="jsp/shop/shop-left-sidebar.jsp">Platinum lecklaces</a></li>
									</ul>
									</li>
								</ul>
							</li>
							<li><a href="jsp/shop/shop.jsp">New Arrivals</a>
								<ul>
									<li><a href="jsp/shop/shop-list.jsp">rings</a>
									<ul>
										<li><a href="jsp/shop/shop-left-sidebar.jsp">diamond ring</a></li>
										<li><a href="jsp/shop/shop-right-sidebar.jsp">gold ring</a></li>
										<li><a href="jsp/shop/shop-list.jsp">sliver ring</a></li>
										<li><a href="jsp/shop/shop-left-sidebar.jsp">Platinum ring</a></li>
									</ul>
									</li>
									<li><a href="jsp/shop/shop-list.jsp">Bracelets</a>
									<ul>
										<li><a href="jsp/shop/shop-left-sidebar.jsp">diamond Bracelets</a></li>
										<li><a href="jsp/shop/shop-right-sidebar.jsp">gold Bracelets</a></li>
										<li><a href="jsp/shop/shop-left-sidebar.jsp">sliver Bracelets</a></li>
										<li><a href="jsp/shop/shop-right-sidebar.jsp">Platinum Bracelets</a></li>
									</ul>
									</li>
									<li><a href="jsp/shop/shop-list.jsp">lecklaces</a>
									<ul>
										<li><a href="jsp/shop/shop-right-sidebar.jsp">diamond lecklaces</a></li>
										<li><a href="jsp/shop/shop-left-sidebar.jsp">gold lecklaces</a></li>
										<li><a href="jsp/shop/shop-right-sidebar.jsp">sliver lecklaces</a></li>
										<li><a href="jsp/shop/shop-left-sidebar.jsp">Platinum lecklaces</a></li>
									</ul>
									</li>
									<li><a href="jsp/shop/shop-right-sidebar.jsp">earrings</a>
									<ul>
										<li><a href="jsp/shop/shop-right-sidebar.jsp">diamond lecklaces</a></li>
										<li><a href="jsp/shop/shop-left-sidebar.jsp">gold earrings</a></li>
										<li><a href="jsp/shop/shop-list.jsp">sliver earrings</a></li>
										<li><a href="jsp/shop/shop-left-sidebar.jsp">Platinum earrings</a></li>
									</ul>
									</li>
								</ul>
							</li>
							<li><a href="jsp/search/portfolio.jsp">Portfolio</a>
								<ul>
									<li><a href="jsp/search/portfolio.jsp">Portfolio 3 column</a></li>
									<li><a href="jsp/search/portfolio-2.jsp">Portfolio 4 column</a></li>
								</ul>
							</li>
							<li><a href="jsp/search/blog.jsp">Blog</a>
								<ul>
									<li><a href="jsp/search/blog.jsp">Blog 1</a></li>
									<li><a href="jsp/search/blog-left-sidebar.jsp">Blog 2</a></li>
									<li><a href="jsp/search/blog-right-sidebar.jsp">Blog 3</a></li>
								</ul>
							</li>
							<li><a href="jsp/etc/about-us.jsp">About Us</a></li>
							<li><a href="jsp/etc/contact.jsp">Contact</a>
								<ul>
									<li><a href="jsp/etc/contact.jsp">Contact 1</a></li>
									<li><a href="jsp/etc/contact-2.jsp">Contact 2</a></li>
								</ul>
							</li>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</div>
</div><!--End Main Menu Area-->