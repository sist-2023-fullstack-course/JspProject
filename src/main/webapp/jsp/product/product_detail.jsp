<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<section class="product-page fix"><!--Start Product Details Area-->
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<!-- sub m top -->
	            <div class="s21_tour_de_top">
	                <div class="s21_detail_box">
	                    <div class="s21_detail_img" style="width: 40%">
	                    	<div class="thumb_gray">
		                        <img src="${vo.poster }">
	                    	</div>
	                    </div>
	                    <div class="s21_detail_tbox" style="width: 50%">
	                        <!-- 우측 정보 s -->
	                        <ul class="s21_detail_twrap">
	                            <li>
	                                <dl>
	                                    <dt>상품명</dt>
	                                    <dd>${vo.name }</dd>
	                                </dl>
	                            </li>
	                            <li>
	                                <dl>
	                                    <dt>상품 종류</dt>
	                                    <dd>${vo.category }</dd>
	                                </dl>
	                            </li>
	                            <li>
	                                <dl>
	                                    <dt>판매가</dt>
	                                    <dd>
	                                    <c:if test="${vo.discount_rate==0 }">
		                                    <fmt:formatNumber value="${vo.price }" />원
	                                    </c:if>
	                                    <c:if test="${vo.discount_rate!=0 }">
		                                    <del><fmt:formatNumber value="${vo.price }" />원</del>
	                                    </c:if>
		                                </dd>
	                                </dl>
	                            </li>
	                            
	                            <c:if test="${vo.discount_rate!=0 }">
	                            <li>
	                            	<dl>
	                            		<dt>할인가</dt>
	                            		<dd>
		                                    <fmt:formatNumber value="${vo.discount_price }" />원
		                                    <span style="color: red; font-size: 22px; margin-left: 10px;">${vo.discount_rate }%</span>
	                            		</dd>
	                            	</dl>
	                            </li>
	                            </c:if>
	                            <li>
	                                <dl>
	                                    <dt>배송</dt>
	                                    <dd>${vo.delivery }</dd>
	                                </dl>
	                            </li>
	                            <li>
	                                <dl>
	                                    <dt>별점</dt>
	                                    <dd style="color: red">${vo.star }</dd>
	                                </dl>
	                            </li>
	
	                        </ul>
	                        <!-- //우측 정보 e -->
	                        <!-- 하단 분류 s -->
	                        <div class="s21_detail_top_btm">
	                            <c:if test="${sessionScope.id!=null }">
	                            <dl class="purchase_button">
	                                <dt>
	                                    <img src="../img/payment.png">
	                                <dd>구매하기</dd>
	                            </dl>
	                            <dl class="cart_button">
	                                <dt>
	                                    <img src="../img/cart.png">
	                                <dd>장바구니</dd>
	                            </dl>
	                            </c:if>
	                        </div>
	                        <!--// 하단 분류 e -->
	                    </div>
	                </div>
	            </div>
	            <!--// sub m top -->
			</div>
		</div>
		<div class="row row_margin">
			<div class="col-sm-12">
				<div style="border-top: 3px solid #77D6C9;"></div>
			</div>
			<div class="col-sm-6">
				<h4 class="detail_heading">상품 정보</h4>
				<table class="table">
					<c:forEach var="entry" items="${info }">
						<tr>
							<th width="27%">${entry.key }</th>
							<td>${entry.value }</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div class="col-sm-6">
				<div id="comments">
					<div class="comments-list">
						<h4 class="detail_heading">댓글</h4>
						<ol class="commentlists">
							<li class="sin-comment">
								<div class="the-comment">
									<div class="comment-box">
										<div class="comment-author">
											<p class="com-name"><strong>댓글 작성자</strong></p>3 day ago  
										</div>
										<div class="comment-text">
											<p>Lorem ipsum dolor sit amet, consectetur adi ing elit, sed do eiusmo empor incididunt ut labore et dolore magna aliqua magna aliqua Lorem ipsum dolor sit amet, consectetur adi ing elit, sed do eiusmo empor incididunt ut labore et dolore magna aliqua magna aliqua Lorem ipsum dolor sit amet, </p>
										</div>
									</div>
								</div>
							</li><!-- #comment-## -->
							<li class="sin-comment">
								<div class="the-comment">
									<div class="comment-box">
										<div class="comment-author">
											<p class="com-name"><strong>댓글 작성자</strong></p>3 day ago  
										</div>
										<div class="comment-text">
											<p>Lorem ipsum dolor sit amet, consectetur adi ing elit, sed do eiusmo empor incididunt ut labore et dolore magna aliqua magna aliqua Lorem ipsum dolor sit amet, consectetur adi ing elit, sed do eiusmo empor incididunt ut labore et dolore magna aliqua magna aliqua Lorem ipsum dolor sit amet, </p>
										</div>
									</div>
								</div>
							</li><!-- #comment-## -->
						</ol>
					</div>
					
					<c:if test="${sessionScope.id!=null }">
					<div class="commentform">
						<h4 class="detail_heading">댓글쓰기</h4>
						<form class="comment-form" id="commentform" method="post" action="#">
							<div class="form-input">
								<textarea aria-required="true" name="comment" id="comment" rows="4"></textarea>
							</div>
							<p class="form-submit" style="float: right;">
								<input type="submit" value="등록" id="submit" name="submit">
							</p>
						</form>
					</div><!-- end commentform -->
					</c:if>
				</div>
			</div>
		</div>
		<span id="back_to_list" onclick="javascript:history.back();">목록</span>
	</div>
</section><!--End Product Details Area-->