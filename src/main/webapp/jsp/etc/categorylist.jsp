<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="blog-page page fix" style="">
	<div class="container">
		<div class="row">
			<div class="category-list-header">
				<div>오늘 날짜 : ${date }</div>
				<h1>${cate } TOP 10</h1>
			</div>
		</div>
		<hr>
		<c:forEach var="vo" items="${list}" varStatus="i">
		<div class="row category-list-main"  onclick="javascript:location.href='/JspProject/company/detail.do?id=${vo.id}'">
			<div class="col-sm-4"
				style="text-align: center; margin-bottom: 20px;">
				<img alt="" src="${vo.poster}" style="height: 300px; width:100%">
			</div>
			<div class="col-sm-8" style="height: 300px;">
				<div class="cate-list-title">
					${vo.com_name } <span style="color: orange"> ${String.format("%.1f", vo.star) }</span>
				</div>
				<div class="cate-list-content">
					<dl>
						<dt>주소</dt>
						<dd>${vo.address }</dd>
					</dl>
				</div>
				<div class="cate-list-content">전화번호 ${vo.phone  }</div>
				<div class="the-comment" style="margin-top:20px">
					<div class="comment-box">
					  <c:if test="${rlist.get(i.index).user_name != null}">
						<div class="comment-author">
							<p class="com-name">
								<strong>${rlist.get(i.index).user_name }</strong>
							</p>${rlist.get(i.index).dbday }
						</div>
						<div class="comment-text">
							<p>${rlist.get(i.index).content }</p>
						</div>
					  </c:if>
					  <c:if test="${rlist.get(i.index).user_name == null}">
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

