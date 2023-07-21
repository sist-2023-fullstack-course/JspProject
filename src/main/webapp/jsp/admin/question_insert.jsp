<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h2 class="sectiontitle">1:1 답변하기</h2>
<h3>글 내용</h3>
<table class="table table-bordered" style="width: 70%; margin: 0px auto;">
	<tr>
		<th class="info" width=20% class="text-center">게시물 번호</th>
		<td width=30% class="text-center">${vo.no }</td>
		<th class="info" width=20% class="text-center">작성일</th>
		<td width=30% class="text-center">${vo.dbday }</td>
	</tr>
	<tr>
		<th class="info" width=20% class="text-center">이름</th>
		<td width=30% class="text-center">${vo.name }</td>
		<th class="info" width=20% class="text-center">조회수</th>
		<td width=30% class="text-center">${vo.hit }</td>
	</tr>
	<tr>
		<th class="info" width=20% class="text-center">제목</th>
		<td colspan="3">${vo.subject }</td>
	</tr>
	<tr>
		<td colspan="4" valign="top" class="text-left" height="200"><pre
				style="white-space: pre-wrap; background-color: white; border: none">${vo.content }</pre>
		</td>
	</tr>
</table>
<h3 style="margin-top: 30px;">답변 작성</h3>
<form method="post" action="../admin/question_insert_ok.do">
	<table class="table table-align" style="width: 70%; margin: 0px auto;">
		<tr>
			<th width=20% class="text-center">제목</th>
			<td width=80%><input type=text name=subject size=55
				class="input-sm" style="padding: 20px;"> <input type=hidden
				name=qno value=${no }></td>
		</tr>
		<tr>
			<th width=20% class="text-center">내용</th>
			<td width=80%><textarea rows="10" cols="50" name="content"
					style="padding: 20px;"></textarea></td>
		</tr>
		<tr>
			<td colspan="2" class="text-center">
				<button class="btn btn-sm btn-success">답변</button> <input
				type=button value="취소" class="btn btn-sm btn-info"
				onclick="javascript:history.back()">
			</td>
		</tr>
	</table>
</form>