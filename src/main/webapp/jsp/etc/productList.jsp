<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="blog-page page fix" style="">
	<div class="container">
		<div class="row">
			<div class="category-list-header">
				<div>${date }</div>
				<h1>${cate } TOP 10</h1>
			</div>
		</div>
		<hr>
		<c:forEach var="vo" items="${list}" varStatus="i">
		<div class="row category-list-main" onclick="javascript:location.href='/JspProject/product/detail.do?id=${vo.id}'">
			<div class="col-sm-4"
				style="text-align: center; margin-bottom: 20px;">
				<img alt="" src="${vo.poster}" style="height: 300px; width:100%">
			</div>
			<div class="col-sm-8" style="height: 300px;">
				<div class="cate-list-title">
					${vo.name} <span style="color: orange"> ${ String.format("%.1f", vo.star) }</span>
				</div>
				<div class="cate-list-content"> 가격 : ${String.format("%,15d", vo.price)  }원 
				&nbsp;&nbsp; <span style="color: red;font-size: 25px;font-weight: 900;">할인가 </span>
				 ${String.format("%,15d", vo.discount_price) }원</div>
				<div class="cate-list-content">배송정보 : ${vo.delivery  }</div>
				<div class="the-comment" style="margin-top:20px">
					<div class="comment-box">
					  <c:if test="${rlist.get(i.index).user_id != null}">
						<div class="comment-author">
							<p class="com-name">
								<strong>${rlist.get(i.index).user_id }</strong>
							</p>${rlist.get(i.index).regdate }
						</div>
						<div class="comment-text">
							<p>${rlist.get(i.index).content }</p>
						</div>
					  </c:if>
					  <c:if test="${rlist.get(i.index).user_id == null}">
						<div class="comment-author">
							<p></p>아직 입력된 댓글이 없습니다.
						</div>
					  </c:if>
					</div>
				</div>
			</div>
		</div>
		</c:forEach>
	</div>
</div>

