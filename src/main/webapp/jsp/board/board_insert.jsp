<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

</head>
<body>
<div class="wrapper row3">
  <main class="container clear">
   <h2 class="sectiontitle">글쓰기</h2>
   <div class="row">
   
   <form method=post action="../board/board_insert_ok.do">
   <table class="table">
   <tr>
      <th width=15%>게시글 종류</th>
      <td width=85%>
		  <select name="category" >
		    <option value="none" selected>=== 선택 ===</option>
		    <option value="자유글">자유글</option>
		    <option value="공지">공지</option>
		  </select>
      </td>
    </tr>
    <tr>
      <th width=15%>사용자 ID</th>
      <td width=85%>
       <input type=text name=name size=20 class="input-sm" value="${sessionScope.id }" readonly>
      </td>
    </tr>
    <tr>
      <th width=15%>title</th>
      <td width=85%>
       <input type=text name=subject size=50 class="input-sm">
      </td>
    </tr>
    <tr>
      <th width=15%>내용 content</th>
      <td width=85%>
       <textarea rows="10" cols="50" name="content"></textarea>
      </td>
    </tr>
    <tr>
      <td colspan="2" class="text-center">
        <input type=submit value="글쓰기" class="btn btn-sm btn-success">
        <input type=button value="취소" class="btn btn-sm btn-info" onclick="javascript:history.back()">
      </td>
    </tr>
   </table>
   </form>
   </div>
  </main>
</div>
</body>
</html>