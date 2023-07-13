<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="page-title fix"><!--Start Title-->
	<div class="overlay section">
		<h2>${vo.com_name }</h2>
	</div>
</div><!--End Title-->
<section class="product-page page fix"><!--Start Product Details Area-->
	<div class="container">
		<div class="row">
			<div class="col-sm-6">
				<img src="${vo.poster }" style="width: 100%; height: 500px" alt="" class="simpleLens-big-image">
			</div>
			<div class="col-sm-6">
				<div class="shop-details">
					<div class="s21_detail_tbox">
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
                                    <dt>분류</dt>
                                    <dd>${vo.content }</dd>
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
                                    <dd>${vo.star }</dd>
                                </dl>
                            </li>
						</ul>
                    </div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-2"></div>
			<div class="col-sm-8">
				<div id="comments">
					<div class="comments-list">
						<h4 class="heading">Comments</h4>
						<ol class="commentlists">
							<li class="sin-comment">
								<div class="the-comment">
									<div class="avatar">
										<img alt="" src="../img/blog/comment-1.jpg">	
									</div>
									<div class="comment-box">
										<div class="comment-author">
											<p class="com-name"><strong>Tom Cruze</strong></p>3 day ago  <a href="#" class="repost-link"> Repost </a> <a href="#" class="comment-reply-link"> Reply </a>
										</div>
										<div class="comment-text">
											<p>Lorem ipsum dolor sit amet, consectetur adi ing elit, sed do eiusmo empor incididunt ut labore et dolore magna aliqua magna aliqua Lorem ipsum dolor sit amet, consectetur adi ing elit, sed do eiusmo empor incididunt ut labore et dolore magna aliqua magna aliqua Lorem ipsum dolor sit amet, </p>
										</div>
									</div>
								</div>
							</li><!-- #comment-## -->
							<li class="sin-comment">
								<div class="the-comment">
									<div class="avatar">
										<img alt="" src="../img/blog/comment-3.jpg">
									</div>
									<div class="comment-box">
										<div class="comment-author">
											<p class="com-name"><strong>TOMAS LEE</strong></p>3 day ago  <a href="#" class="repost-link"> Repost </a> <a href="#" class="comment-reply-link"> Reply </a>
										</div>
										<div class="comment-text">
											<p>Lorem ipsum dolor sit amet, consectetur adi ing elit, sed do eiusmo empor incididunt ut labore et dolore magna aliqua magna aliqua Lorem ipsum dolor sit amet, consectetur adi ing elit, sed do eiusmo empor incididunt ut labore et dolore magna aliqua magna aliqua Lorem ipsum dolor sit amet, </p>
										</div>
									</div>
								</div>
							</li><!-- #comment-## -->
						</ol>
					</div>
					<div class="commentform">
						<h4 class="heading">Leave a Comment</h4>
						<form class="comment-form" id="commentform" method="post" action="#">
							<div class="row">
								<div class="col-md-4">
									<div class="form-input">
										<label for="author">Your Name<span>*</span></label>
										<input type="text" aria-required="true" value="" id="author" name="author">
									</div>
								</div>
								<div class="col-md-4">
									<div class="form-input">
										<label for="email">Your Email<span>*</span></label>
										<input type="email" aria-required="true" value="" name="email" id="email">
									</div>
								</div>
								<div class="col-md-4">
									<div class="form-input">
										<label for="title">Title<span>*</span></label>
										<input type="text" aria-required="true" value="" name="title" id="title">
									</div>
								</div>
							</div>
							<div class="form-input">
								<label for="comment" class="field-label">Your Comment<span>*</span></label>
								<textarea aria-required="true" name="comment" id="comment" rows="4"></textarea>
							</div>
							<p class="form-submit">
								<input type="submit" value="submit" id="submit" name="submit">
							</p>
						</form>
					</div><!-- end commentform -->
				</div>
			</div>
			<div class="col-sm-2"></div>
		</div>
	</div>
</section><!--End Product Details Area-->
