<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<section class="product-page fix"><!--Start Product Details Area-->
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<!-- sub m top -->
	            <div class="s21_tour_de_top">
	                <h3 class="area">${vo.com_name } <span>${vo.content }</span>
	                </h3>
	                <div class="s21_detail_box">
	                    <div class="s21_detail_img">
	                        <img src="${vo.poster }">
	                    </div>
	                    <div class="s21_detail_tbox">
	                        <!-- 우측 정보 s -->
	                        <ul class="s21_detail_twrap">
	                            <li>
	                                <dl>
	                                    <dt>주소</dt>
	                                    <dd>${vo.address }</dd>
	                                </dl>
	                            </li>
	                            <li>
	                                <dl>
	                                    <dt>연락처</dt>
	                                    <dd>${vo.phone }</dd>
	                                </dl>
	                            </li>
	                            <li>
	                                <dl>
	                                    <dt>홈페이지</dt>
	                                    <dd><a href="${vo.homepage }" target="_blank">${vo.homepage }</a></dd>
	                                </dl>
	                            </li>
	                            <li>
	                                <dl>
	                                    <dt>영업시간</dt>
	                                    <dd>${vo.time }</dd>
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
	                            <dl class="reserve_button">
	                                <dt>
	                                    <img src="../img/reserve.png">
	                                <dd>예약하기</dd>
	                            </dl>
	                            <c:if test="${sessionScope.id!=null }">
	                            <c:if test="${like }">
	                            <dl class="heart_button clicked" onclick="clickHeartBtn('${sessionScope.id}', ${vo.id })">
	                                <dt>
	                                    <img src="../img/afterheart.png">
	                                <dd>좋아요</dd>
	                            </dl>
	                            </c:if>
	                            <c:if test="${!like }">
	                            <dl class="heart_button" onclick="clickHeartBtn('${sessionScope.id}', ${vo.id })">
	                                <dt>
	                                    <img src="../img/beforeheart.png">
	                                <dd>좋아요</dd>
	                            </dl>
	                            </c:if>
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
				<div id="map_area">
					<h4 class="detail_heading">지도정보</h4>
					<div id="map" data-title="${vo.com_name }" data-x="${vo.map_x }" data-y="${vo.map_y }" style="width:100%;height:350px;"></div>
				</div>
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
	</div>
</section><!--End Product Details Area-->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1139269c033f918e1755e459b1b17604"></script>
<script type="text/javascript" src="../js/kakaomap.js"></script>