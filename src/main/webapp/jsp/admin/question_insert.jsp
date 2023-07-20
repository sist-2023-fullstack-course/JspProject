<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 	<h2 class="sectiontitle">1:1 답변하기</h2>
       <form method="post" action="../admin/question_insert_ok.do">
 	      <table class="table table-align" style="width:60%; margin: 0px auto;">
 	        <tr>
 	          <th width=20% class="text-center">제목</th>
 	          <td width=80%>
 	            <input type=text name=subject size=55 class="input-sm" style="padding:20px;">
 	            <input type=hidden name=qno value=${no }>
 	          </td>
 	        </tr>
 	        <tr>
 	          <th width=20% class="text-center">내용</th>
 	          <td width=80%>
 	            <textarea rows="10" cols="50" name="content" style="padding:20px;"></textarea>
 	          </td>
 	        </tr>
 	        <tr>
 	          <td colspan="2" class="text-center">
 	            <button class="btn btn-sm btn-success">답변</button>
 	            <input type=button value="취소" class="btn btn-sm btn-info" onclick="javascript:history.back()">
 	          </td>
 	        </tr>
 	      </table>
      </form>