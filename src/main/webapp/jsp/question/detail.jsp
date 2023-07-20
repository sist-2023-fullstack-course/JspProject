<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<main class="container clear">
	<h2 class="sectiontitle">1:1 문의하기(상세)</h2>
	<div class="row">
		<table class="table">
			<tr>
				<th width=20% class="text-center">게시물 번호</th>
				<td width=30% class="text-center">${vo.no }</td>
				<th width=20% class="text-center">작성일</th>
				<td width=30% class="text-center">${vo.dbday }</td>
			</tr>
			<tr>
				<th width=20% class="text-center">이름</th>
				<td width=30% class="text-center">${vo.name }</td>
				<th width=20% class="text-center">조회수</th>
				<td width=30% class="text-center">${vo.hit }</td>
			</tr>
			<tr>
				<th width=20% class="text-center">제목</th>
				<td colspan="3">${vo.subject }</td>
			</tr>
			<tr>
				<td colspan="4" valign="top" class="text-left" height="200"><pre
						style="white-space: pre-wrap; background-color: white; border: none">${vo.content }</pre>
				</td>
			</tr>
			<tr>
				<td colspan="4" class="text-right"><c:if
						test="${sessionScope.id==vo.id }">
						<a href="../question/update.do?no=${vo.no }"
							class="btn btn-sm btn-success">수정</a>
						<a href="../question/delete.do?no=${vo.no }"
							class="btn btn-sm btn-danger">삭제</a>
					</c:if> <a href="../question/list.do" class="btn btn-sm btn-warning">목록</a>
				</td>
			</tr>
		</table>
	</div>
</main>
