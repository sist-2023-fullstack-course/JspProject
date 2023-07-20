<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    

<div class="container">
	<div class="row">
		<div class="board-insert-main">
		<div class="board-title"> 
			게시글 작성
		</div>
			<form method=post action="../board/board_insert_ok.do">
			   <table class="board-table table">
			   <tr>
			      <th width=20% style="padding-top:20px">게시글 종류</th>
			      <td width=80%>
					  <select name="cat" >
					    <option value="none" >=== 선택 ===</option>
					    <option value="공지사항">공지사항</option>
					    <option value="자유토크" selected>자유토크</option>
					    <option value="자랑하기">자랑하기</option>
					    <option value="QNA">Q&amp;A</option>
					  </select>
			      </td>
			    </tr>
			    <tr>
			      <th width=20%>사용자 ID</th>
			      <td width=80%>
			       <input type=text name=id size=45 class="input-sm" value="${sessionScope.id }" readonly style="font-size:18px">
			       <input type=hidden name=name value="${sessionScope.name }">
			      </td>
			    </tr>
			    <tr>
			      <th width=20%>title</th>
			      <td width=80%>
			       <input type=text name=subject size=45 class="input-sm" style="font-size:18px">
			      </td>
			    </tr>
			    <tr>
			      <th width=20%>내용 content</th>
			      <td width=80%>
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
	</div>
</div>


<!--
<div class="board-insert">
	<div>
   <h2 class="board-title">게시글 작성</h2>
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
   </div>
</div>
  -->
