<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
   
   <form method=post action="../board/board_update_ok.do">
   <table class="table">
   <tr>
      <th width=15%>게시글 종류</th>
      <td width=85%>
		  <select name="category" >
		    <option value="none" >=== 선택 ===</option>
		    <option value="자유글" selected>자유글</option>
		    <option value="공지">공지</option>
		  </select>
      </td>
    </tr>
    <tr>
      <th width=15%>user_id</th>
      <td width=85%>
       <input type=text name=name size=20 class="input-sm" value=${vo.user_id }>
       <input type=hidden name=no value=${vo.board_id }>
      </td>
    </tr>
    <tr>
      <th width=15%>title</th>
      <td width=85%>
       <input type=text name=subject size=50 class="input-sm" value=${vo.title }>
      </td>
    </tr>
    <tr>
      <th width=15%>내용 content</th>
      <td width=85%>
       <textarea rows="10" cols="50" name="content">${vo.content }</textarea>
      </td>
    </tr>
    </table>
    
    <tr style="display:show" id="delTr">
       <td colspan="6" class="text-right inline">
       비밀번호:<input type=password name=pwd id=pwd1 size=10 class="input-sm">
       </td>
       </tr>
       <tr>
      <td colspan="2" class="text-center">
        <input type=submit value="수정" class="btn btn-sm btn-success">
        <input type=button value="취소" class="btn btn-sm btn-info" onclick="javascript:history.back()">
      </td>
    </tr>
   
   </form>
   <!-- <table></table> -->
   </div>
  </main>
</div>
</body>
</html>