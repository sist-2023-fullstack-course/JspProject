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
	                            <c:if test="${sessionScope.id!=null }">
	                            <dl class="reserve_button">
	                                <dt>
	                                    <img src="../img/reserve.png">
	                                <dd>예약하기</dd>
	                            </dl>
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
						<c:if test="${rlist.size() > 0 }">
						<h4 class="detail_heading">리뷰</h4>
						</c:if>
						<c:if test="${rlist.size() == 0 }">
						<h4 class="detail_heading">아직 등록된 리뷰가 없습니다</h4>
						</c:if>
						<ol class="commentlists">
							<c:forEach var="vo" items="${rlist }">
							<li class="sin-comment" data-id="${vo.id }">
								<div class="the-comment">
									<div class="comment-box">
										<div class="comment-author">
											<p class="com-name"><strong>${vo.user_name }</strong></p>${vo.dbday } 
										</div>
										<div class="comment-text">
											<p>${vo.content }</p>
										</div>
									</div>
								</div>
								<c:if test="${vo.user_id==sessionScope.id }">
								<span style="right: 50px;" onclick="updateReview(this)">수정</span>
								</c:if>
								<c:if test="${vo.user_id==sessionScope.id || sessionScope.id=='admin'}">
								<span style="right: 0px;" onclick="deleteReview()">삭제</span>
								</c:if>
							</li>
							</c:forEach>
						</ol>
					</div>
					
					<c:if test="${sessionScope.id!=null }">
					<div class="commentform">
						<h4 class="detail_heading">리뷰쓰기</h4>
						<form class="comment-form" id="commentform" method="post" action="write_review.do">
							<div class="form-input">
								<input type="hidden" name="cid" value="${vo.id }">
								<textarea aria-required="true" name="comment" id="comment" rows="4"></textarea>
							</div>
							<p class="form-submit" style="float: right;">
								<span class="review-submit" id="submit" style="cursor: pointer;">등록</span>
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
<div id="reserve-dialog" style="display: none">
	<h1>예약하기</h1>
</div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1139269c033f918e1755e459b1b17604"></script>
<script type="text/javascript" src="../js/kakaomap.js"></script>