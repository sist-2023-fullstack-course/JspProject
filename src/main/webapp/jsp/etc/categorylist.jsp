<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

col
<div class="blog-page page fix" style="">
	<div class="container">
		<div class="row">
			<div class="category-list-header">
				<div>클릭수, 날짜</div>
				<h1>카테고리 정보 (회사, 상품)</h1>
				<h2>부제목</h2>
			</div>
		</div>
		<hr>
		<c:forEach var="vo" items="${list}" varStatus="i">
		<div class="row category-list-main">
			<div class="col-sm-4"
				style="text-align: center; margin-bottom: 20px;">
				<img alt="" src="${vo.poster}" style="height: 350px;">
			</div>
			<div class="col-sm-8" style="height: 350px;">
				<div class="cate-list-title">
					${vo.com_name } <span style="color: orange"> - ${vo.star }</span>
				</div>
				<div class="cate-list-content">2. ${vo.address  } / 가격</div>
				<div class="cate-list-content">3. ${vo.phone  } / 상품설명</div>
				<div class="the-comment" style="margin-top:20px">
					<div class="comment-box">
						<div class="comment-author">
							<p class="com-name">
								<strong>${rlist.get(i.index).user_name }</strong>
							</p>${rlist.get(i.index).dbday }
						</div>
						<div class="comment-text">
							<p>${rlist.get(i.index).content }</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		</c:forEach>
	</div>
</div>

