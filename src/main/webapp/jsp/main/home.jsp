<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container">
	<!-- 카테고리 아이콘 -->
	<div class="row">
		<img src="../img/pet-main.png" style="padding: 0px 15px; display: block; margin: 0px auto;">
	</div>
	<div class="row">
		<div id="category-icons">
			<div class="icon-area">
				<a class="btn" href="../company/list.do?cate=애견미용"><img src="../img/icon/hair_icon.png"></a>
				<span>애견미용</span>
			</div>
			<div class="icon-area">
				<a href="../company/list.do?cate=동물병원"><img src="../img/icon/vet_icon.png"></a>
				<span>동물병원</span>
			</div>
			<div class="icon-area">
				<a href="../company/list.do?cate=애견카페"><img src="../img/icon/pet_cafe.png"></a>
				<span>애견카페</span>
			</div>
			<div class="icon-area">
				<a href="../company/list.do?cate=애견숙소"><img src="../img/icon/pet_hotel.png"></a>
				<span>애견숙소</span>
			</div>
			<div class="icon-area">
				<a href="../company/list.do?cate=반려동물용품"><img src="../img/icon/pet_shop.png"></a>
				<span>반려동물용품</span>
			</div>
			<div class="icon-area">
				<a href="../company/list.do?cate=반려동물장례"><img src="../img/icon/pet_rip.png"></a>
				<span>반려동물장례</span>
			</div>
		</div>
	</div>
	
	<!-- 업체 실시간 인기 -->
	<div class="row row_margin">
		<h2 class="sectiontitle">베스트 PETMILY 장소</h2>
		<div class="flexslider carousel basiccarousel">
	    	<div class="flex-viewport" style="overflow: hidden; position: relative;">
	    		<ul class="slides" style="width: 1000%; transition-duration: 0.6s; transform: translate3d(-665.333px, 0px, 0px);">
			        <li style="width: 312.667px; float: left; display: block;">
			          	<figure>
			          		<a href="../etc/categorylist.do?cate=애견미용"><img class="home_img radius-10 btmspace-10" src="../Images/hairshop.jpeg" alt="" draggable="false"></a>
			            	<figcaption>
			            		<a href="../etc/categorylist.do?cate=애견미용"><i class="fa fa-list-ul"></i>애견미용 탑 10</a>
			            	</figcaption>
			          	</figure>
			        </li>
			        <li style="width: 312.667px; float: left; display: block;">
			          	<figure>
			          		<a href="../etc/categorylist.do?cate=동물병원"><img class="home_img radius-10 btmspace-10" src="../Images/hospital.jpeg" alt="" draggable="false"></a>
			            	<figcaption>
			            		<a href="../etc/categorylist.do?cate=동물병원"><i class="fa fa-list-ul"></i>동물병원 탑 10</a>
			            	</figcaption>
			          	</figure>
			        </li>
			        <li style="width: 312.667px; float: left; display: block;">
			          	<figure>
			          		<a href="../etc/categorylist.do?cate=애견카페"><img class="home_img radius-10 btmspace-10" src="../Images/cafe.jpeg" alt="" draggable="false"></a>
			            	<figcaption>
			            		<a href="../etc/categorylist.do?cate=애견카페"><i class="fa fa-list-ul"></i>애견카페 탑 10</a>
			            	</figcaption>
			          	</figure>
			        </li>
			        <li style="width: 312.667px; float: left; display: block;">
			          	<figure>
			          		<a href="../etc/categorylist.do?cate=애견숙소"><img class="home_img radius-10 btmspace-10" src="../Images/hotel.jpeg" alt="" draggable="false"></a>
			            	<figcaption>
			            		<a href="../etc/categorylist.do?cate=애견숙소"><i class="fa fa-list-ul"></i>애견숙소 탑 10</a>
			            	</figcaption>
			          	</figure>
			        </li>
			        <li style="width: 312.667px; float: left; display: block;">
			          	<figure>
			          		<a href="../etc/categorylist.do?cate=반려동물용품"><img class="home_img radius-10 btmspace-10" src="../Images/toy.jpeg" alt="" draggable="false"></a>
			            	<figcaption>
			            		<a href="../etc/categorylist.do?cate=반려동물용품"><i class="fa fa-list-ul"></i>반려동물용품 탑 10</a>
			            	</figcaption>
			          	</figure>
			        </li>
			        <li style="width: 312.667px; float: left; display: block;">
			          	<figure>
			          		<a href="../etc/categorylist.do?cate=반려동물장례"><img class="home_img radius-10 btmspace-10" src="../Images/funeral.jpeg" alt="" draggable="false"></a>
			            	<figcaption>
			            		<a href="../etc/categorylist.do?cate=반려동물장례"><i class="fa fa-list-ul"></i>반려동물장례 탑 10</a>
			            	</figcaption>
			          	</figure>
			        </li>
		      	</ul>
	      	</div>
      	</div>
	</div>
	
	<!-- 카테고리 아이콘 -->
	<div class="row">
		<div id="category-icons">
			<div class="icon-area">
				<a href="../product/list.do?cate=사료"><img src="../img/icon/pet-feed.png"></a>
				<span>사료</span>
			</div>
			<div class="icon-area">
				<a href="../product/list.do?cate=간식"><img src="../img/icon/pet-snack.png"></a>
				<span>간식</span>
			</div>
			<div class="icon-area">
				<a href="../product/list.do?cate=배변/위생"><img src="../img/icon/pet-shit.png"></a>
				<span>배변/위생</span>
			</div>
			<div class="icon-area">
				<a href="../product/list.do?cate=산책/이동장"><img src="../img/icon/pet-walk.png"></a>
				<span>산책/이동장</span>
			</div>
			<div class="icon-area">
				<a href="../product/list.do?cate=건강관리"><img src="../img/icon/pet-medicine.png"></a>
				<span>건강관리</span>
			</div>
			<div class="icon-area">
				<a href="../product/list.do?cate=식기"><img src="../img/icon/pet-plate.png"></a>
				<span>식기</span>
			</div>
			<div class="icon-area">
				<a href="../product/list.do?cate=의류/악세서리"><img src="../img/icon/pet-cloth.png"></a>
				<span>의류/악세서리</span>
			</div>
			<div class="icon-area">
				<a href="../product/list.do?cate=장난감"><img src="../img/icon/pet-toy.png"></a>
				<span>장난감</span>
			</div>
			<div class="icon-area">
				<a href="../product/list.do?cate=목욕/미용"><img src="../img/icon/pet-wash.png"></a>
				<span>목욕/미용</span>
			</div>
			<div class="icon-area">
				<a href="../product/list.do?cate=하우스/울타리"><img src="../img/icon/pet-fence.png"></a>
				<span>하우스/울타리</span>
			</div>
			<div class="icon-area">
				<a href="../product/list.do?cate=훈련"><img src="../img/icon/pet-training.png"></a>
				<span>훈련</span>
			</div>
		</div>
	</div>
	
	<!-- 쇼핑 실시간 인기 -->
	<div class="row" style="margin-bottom:100px;">
		<h2 class="sectiontitle">베스트 PETMILY 상품</h2>
		<div class="flexslider carousel basiccarousel">
	    	<div class="flex-viewport" style="overflow: hidden; position: relative;">
	    		<ul class="slides" style="width: 1000%; transition-duration: 0.6s; transform: translate3d(-665.333px, 0px, 0px);">
			        <li style="width: 312.667px; float: left; display: block;">
			          	<figure>
			          		<a href="../etc/categoryShoplist.do?cate=사료"><img class="home_img radius-10 btmspace-10" src="../Images/food.jpeg" alt="" draggable="false"></a>
			            	<figcaption>
			            		<a href="../etc/categoryShoplist.do?cate=사료"><i class="fa fa-list-ul"></i>사료 탑 10</a>
			            	</figcaption>
			          	</figure>
			        </li>
			        <li style="width: 312.667px; float: left; display: block;">
			          	<figure>
			          		<a href="../etc/categoryShoplist.do?cate=간식"><img class="home_img radius-10 btmspace-10" src="../Images/snack.jpeg" alt="" draggable="false"></a>
			            	<figcaption>
			            		<a href="../etc/categoryShoplist.do?cate=간식"><i class="fa fa-list-ul"></i>간식 탑 10</a>
			            	</figcaption>
			          	</figure>
			        </li>
			        <li style="width: 312.667px; float: left; display: block;">
			          	<figure>
			          		<a href="../etc/categoryShoplist.do?cate=배변/위생"><img class="home_img radius-10 btmspace-10" src="../Images/clean.jpeg" alt="" draggable="false"></a>
			            	<figcaption>
			            		<a href="../etc/categoryShoplist.do?cate=배변/위생"><i class="fa fa-list-ul"></i>배변/위생 탑 10</a>
			            	</figcaption>
			          	</figure>
			        </li>
			        <li style="width: 312.667px; float: left; display: block;">
			          	<figure>
			          		<a href="../etc/categoryShoplist.do?cate=산책/이동장"><img class="home_img radius-10 btmspace-10" src="../Images/luggage.jpeg" alt="" draggable="false"></a>
			            	<figcaption>
			            		<a href="../etc/categoryShoplist.do?cate=산책/이동장"><i class="fa fa-list-ul"></i>산책/이동장 탑 10</a>
			            	</figcaption>
			          	</figure>
			        </li>
			        <li style="width: 312.667px; float: left; display: block;">
			          	<figure>
			          		<a href="../etc/categoryShoplist.do?cate=건강관리"><img class="home_img radius-10 btmspace-10" src="../Images/vitamin.jpeg" alt="" draggable="false"></a>
			            	<figcaption>
			            		<a href="../etc/categoryShoplist.do?cate=건강관리"><i class="fa fa-list-ul"></i>건강관리 탑 10</a>
			            	</figcaption>
			          	</figure>
			        </li>
			        <li style="width: 312.667px; float: left; display: block;">
			          	<figure>
			          		<a href="../etc/categoryShoplist.do?cate=식기"><img class="home_img radius-10 btmspace-10" src="../Images/plate.jpeg" alt="" draggable="false"></a>
			            	<figcaption>
			            		<a href="../etc/categoryShoplist.do?cate=식기"><i class="fa fa-list-ul"></i>식기 탑 10</a>
			            	</figcaption>
			          	</figure>
			        </li>
			        <li style="width: 312.667px; float: left; display: block;">
			          	<figure>
			          		<a href="../etc/categoryShoplist.do?cate=의류/악세서리"><img class="home_img radius-10 btmspace-10" src="../Images/acc.jpeg" alt="" draggable="false"></a>
			            	<figcaption>
			            		<a href="../etc/categoryShoplist.do?cate=의류/악세서리"><i class="fa fa-list-ul"></i>의류/악세서리 탑 10</a>
			            	</figcaption>
			          	</figure>
			        </li>
			        <li style="width: 312.667px; float: left; display: block;">
			          	<figure>
			          		<a href="../etc/categoryShoplist.do?cate=장난감"><img class="home_img radius-10 btmspace-10" src="../Images/toytoy.jpeg" alt="" draggable="false"></a>
			            	<figcaption>
			            		<a href="../etc/categoryShoplist.do?cate=장난감"><i class="fa fa-list-ul"></i>장난감 탑 10</a>
			            	</figcaption>
			          	</figure>
			        </li>
			        <li style="width: 312.667px; float: left; display: block;">
			          	<figure>
			          		<a href="../etc/categoryShoplist.do?cate=목욕/미용"><img class="home_img radius-10 btmspace-10" src="../Images/bath.jpeg" alt="" draggable="false"></a>
			            	<figcaption>
			            		<a href="../etc/categoryShoplist.do?cate=목욕/미용"><i class="fa fa-list-ul"></i>목욕/미용 탑 10</a>
			            	</figcaption>
			          	</figure>
			        </li>
			        <li style="width: 312.667px; float: left; display: block;">
			          	<figure>
			          		<a href="../etc/categoryShoplist.do?cate=하우스/울타리"><img class="home_img radius-10 btmspace-10" src="../Images/house.jpeg" alt="" draggable="false"></a>
			            	<figcaption>
			            		<a href="../etc/categoryShoplist.do?cate=하우스/울타리"><i class="fa fa-list-ul"></i>하우스/울타리 탑 10</a>
			            	</figcaption>
			          	</figure>
			        </li>
			        <li style="width: 312.667px; float: left; display: block;">
			          	<figure>
			          		<a href="../etc/categoryShoplist.do?cate=훈련"><img class="home_img radius-10 btmspace-10" src="../Images/play.jpeg" alt="" draggable="false"></a>
			            	<figcaption>
			            		<a href="../etc/categoryShoplist.do?cate=훈련"><i class="fa fa-list-ul"></i>훈련 탑 10</a>
			            	</figcaption>
			          	</figure>
			        </li>
		      	</ul>
	      	</div>
      	</div>
	</div>
	
	<!-- 게시판 미리보기 -->
	<div class="row row_margin">
			<div class="col-sm-6">
				<div class="main-board-row">
			    	<div class="main-board-col">
			        	<div class="board-box">
			          		<div class="board-box-title">
			          			"자유게시판"
			            		<a href="../board/board_list.do?cat=자유토크" class="board-box-more"> 더보기 + </a>
			          		</div>
					        <div class="board-box-list">
					        	<ul>
					        		<c:forEach var="vo" items="${freeList }">
					        		<li>
					        			<span class="user-area reply-css">${vo.user_name }</span>
					        			<a class="title-area" href="../board/board_detail.do?no=${vo.board_id }">${vo.title }</a>
					        			<span class="regdate-area">${vo.dbday }</span>
					        		</li>
					        		</c:forEach>
					            </ul>
					       </div>
			        	</div>
			      	</div>
			    </div>
			</div>
			<div class="col-sm-6">
				<div class="main-board-row">
			    	<div class="main-board-col">
			        	<div class="board-box">
			          		<div class="board-box-title">
			          			"자랑게시판"
			            		<a href="../board/board_list.do?cat=자랑하기" class="board-box-more"> 더보기 + </a>
			          		</div>
					        <div class="board-box-list">
					        	<ul>
					        		<c:forEach var="vo" items="${boastList }">
					        		<li>
					        			<span class="user-area reply-css">${vo.user_name }</span>
					        			<a class="title-area" href="../board/board_detail.do?no=${vo.board_id }">${vo.title }</a>
					        			<span class="regdate-area">${vo.dbday }</span>
					        		</li>
					        		</c:forEach>
					            </ul>
					       </div>
			        	</div>
			      	</div>
			    </div>
			</div>	
	</div>
</div>