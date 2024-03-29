<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

  <div class="page-title">1:1 문의내역</div>
  <table class="table" style="width: 80%; margin: 0px auto;">
    <tr>
      <th width=45% class="text-center">제목</th>
      <th width=15% class="text-center">이름</th>
      <th width=20% class="text-center">작성일</th>
      <th width=10% class="text-center">조회수</th>
      <th width=10% class="text-center"></th>
    </tr>
    <c:forEach var="vo" items="${list }">
    <tr>
      <td width=45%>${vo.subject }</td>
      <td width=15% class="text-center">${vo.name }</td>
      <td width=20% class="text-center">${vo.dbday }</td>
      <td width=10% class="text-center">${vo.hit }</td>
      <td width=10% class="text-center">
        <c:if test="${vo.isreply==0 }">
          <a href="../admin/question_insert.do?no=${vo.no }" class="btn btn-sm btn-warning">답변대기</a>
        </c:if>
        <c:if test="${vo.isreply==1 }">
          <span>답변완료</span>
        </c:if>
      </td>
    </tr>
    </c:forEach>
    <tr>
      <td colspan="5" class="text-center">
        <a href="" class="btn btn-sm btn-primary">이전</a>
        ${curpage } page / ${totalpage } pages
        <a href="" class="btn btn-sm btn-primary">다음</a>
      </td>
    </tr>
  </table>