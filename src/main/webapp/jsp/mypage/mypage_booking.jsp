<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="page-title">${sessionScope.name }님의예약내역</div>
<div class="col-sm-1 col-md-1"></div>
<div class="col-sm-10 col-md-10" id="book-table">
	<div class="row">
		<table class="cart-table table">
			<tr>
				<th width=15% class="text-center">예약번호</th>
				<th width=30% class="text-center">업체명</th>
				<th width=20% class="text-center">예약일</th>
				<th width=20% class="text-center">예약상태</th>
				<th width=15% class="text-center"></th>
			</tr>
			<c:forEach var="vo" items="${list}">
				<tr>
					<td width=15% class="text-center">${vo.res_id }</td>
					<td width=30% class="text-center">${vo.com_name }</td>
					<td width=20% class="text-center">${vo.dbday }</td>
					<td width=20% class="text-center">
						<c:if test="${!vo.timeOver }">
						<c:if test="${vo.res_state=='y' }">
							<span style="color: green;">승인</span>
						</c:if> 
						<c:if test="${vo.res_state=='w' }">
							<span style="color: blue;">대기중</span>
						</c:if>
						<c:if test="${vo.res_state=='n' }">
							<span style="color: red;">거절</span>
						</c:if>
						</c:if>
						<c:if test="${vo.timeOver }">
							<span>종료</span>
						</c:if>
					</td>
					<td width=15% class="text-center">
						<span class="btn btn-xs btn-primary" onclick="reservationListDetailOpen(this)">상세보기</span> 
						<span class="btn btn-xs btn-primary" onclick="cancleReservation(this)" data-id="${vo.res_id }">취소</span>
					</td>
				</tr>
				<tr style="display: none" >
					<td colspan="5" class="detail-row">
						<h3>예약 정보</h3>
						<table class="cart-table table table-align">
							<tr>
								<th width=20% class="text-center">업체명</th>
								<td width=45% class="text-left">${vo.com_name }</td>
								<td width=35% rowspan="5"><img src="${vo.poster }">
								</td>
							</tr>
							<tr>
								<th width=20% class="text-center">예약일</th>
								<td width=45% class="text-left">${vo.dbday }</td>
							</tr>
							<tr>
								<th width=20% class="text-center">업체주소</th>
								<td width=45% class="text-left">${vo.address }</td>
							</tr>
							<tr>
								<th width=20% class="text-center">연락처</th>
								<td width=45% class="text-left">${vo.phone }</td>
							</tr>
							<tr>
								<th width=20% class="text-center">반려동물명</th>
								<td width=45% class="text-left">${vo.pet_name }</td>
							</tr>

							<tr>
								<th width=20% class="text-center">예약 메시지</th>
								<td width=45% class="text-left">${vo.res_msg }</td>
							</tr>
						</table>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</div>
<div class="col-sm-1 col-md-1"></div>