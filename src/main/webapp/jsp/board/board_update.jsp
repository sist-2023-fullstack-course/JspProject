<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<div class="container">
	<div class="row">
		<div class="board-insert-main">
		<div class="board-title"> 
			자유게시판 
		</div>
   
   <form method=post action="../board/board_update_ok.do">
   <table class="board-table table">
   <tr>
      <th width=15%>게시글 종류</th>
      <td width=85%>
		  <select name="category" >
		    <option value="공지사항" ${vo.board_category=='공지사항'?"selected":"" }>공지사항</option>
		    <option value="자유토크" ${vo.board_category=='자유토크'?"selected":"" }>자유토크</option>
		    <option value="자랑하기" ${vo.board_category=='자랑하기'?"selected":"" }>자랑하기</option>
		    <option value="QNA" ${vo.board_category=='QNA'?"selected":"" }>Q&amp;A</option>
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
    <table class="table" style="font-size:18px; font-weight:500px; !important">
      <tr style="display:show" id="delTr" >
       <td width=15% class="inline text-left">
      		비밀번호:
       </td>
       <td width=15% class="inline text-left">
       		<input type=password name=pwd id=pwd1 size=10 class="input-sm">
       </td>
       <td class="text-right inline">
        <input type=submit value="수정" class="btn btn-sm btn-success">
        <input type=button value="취소" class="btn btn-sm btn-info" onclick="javascript:history.back()">
      </td>
    </tr>
    </table>
    
    
   
   </form>
   <!-- <table></table> -->
   </div>
  </div>
</div>
