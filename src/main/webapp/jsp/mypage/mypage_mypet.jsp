<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="col-sm-8 col-md-12">
<div class="page-title">${sessionScope.name } 님의 마이펫</div>
		<div class="row">
		<div style="height:40px"></div>
		 <c:forEach var="vo" items="${list }">
			<div class="col-md-2 poster">
				<div class="single-blog">
					<div class="content fix">
					 <c:if test="${vo.count=='1' }">
						  <c:if test="${vo.category=='강아지' }">
							<a class="image fix"><img src="../Images/mypage/dog.png" style="height:150px"/></a>
							<span>${vo.name } / ${vo.gender } / 만 ${vo.age }세</span>
	
						  </c:if>
						  <c:if test="${vo.category=='고양이' }">
							<a class="image fix"><img src="../Images/mypage/cat.png" style="height:150px"/></a>
							<span>${vo.name } / ${vo.gender } / 만 ${vo.age }세</span>
						  </c:if>
					 </c:if>
					 <c:if test="${vo.count=='0' }">
					   <a class="image fix"><img src="../Images/mypage/addmypet.jpg" style="height:120px"/></a>
					   <span>등록된 마이펫이 없습니다! CLICK</span>
					 </c:if>
					  <%-- a href="../mypage/addpet.do" --%>					  
					</div>
				</div>
			</div>
		 </c:forEach>
		</div>
</div>		