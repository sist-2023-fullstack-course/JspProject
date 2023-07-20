<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="col-sm-8 col-md-12">
	<div class="page-title">${sessionScope.name }님의 마이펫</div>
	<div class="row" style="padding:0px 30px;">
		<div style="height: 40px"></div>
		<c:forEach var="vo" items="${list }">
			<div class="col-md-2">
				<div class="single-blog pet-poster-size">
					<div class="content fix">
						<c:if test="${vo.category=='강아지' }">
							<a class="image fix"><img src="../Images/mypage/dog.png" style="height: 150px" /></a>
							<span>${vo.name } / ${vo.gender } / 만 ${vo.age }세</span>
						</c:if>
						<c:if test="${vo.category=='고양이' }">
							<a class="image fix"><img src="../Images/mypage/cat.png" style="height: 150px" /></a>
							<span>${vo.name } / ${vo.gender } / 만 ${vo.age }세</span>
						</c:if>
					</div>
					<button type="button" class="btn btn-xs btn-danger petDeleteBtn" onclick="deletePet(this)" data-id=${vo.pid }>삭제</button>
				</div>
			</div>
		</c:forEach>
		<div class="col-md-2">
			<div class="single-blog">
				<div class="content fix">
					<a href="../mypage/addpet.do" class="image fix"><img src="../Images/mypage/addmypet.jpg" style="height: 150px" /></a>
					<span>펫 등록</span>
				</div>
			</div>
		</div>
	</div>
</div>
