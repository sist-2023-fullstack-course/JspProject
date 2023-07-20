<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="wrapper row3">
  <main class="container">
  <div class="board-detail-main">
   <div style=""> <h2 class="board-detail-title">제목 : ${vo.title }</h2> </div>
   <table class="table detail-table">
     <tr>
      <th width=15% class="text-center">번호</th>
      <td width=15% class="text-center">${vo.board_id }</td>
      <th width=15% class="text-center">작성일</th>
      <td width=20% class="text-center">${vo.dbday }</td>
      <th width=15% class="text-center">조회수</th>
      <td width=20% class="text-center">${vo.hit }</td>
     </tr>
     
     <tr>
      <th width=15% class="text-center">제목</th>
      <td colspan=3 class="text-center">${vo.title }</td>
      <th width=15% class="text-center">작성자</th>
      <td width=15% class="text-center">${vo.user_id }</td>
     </tr>
    <tr>
       <td colspan="6" class="text-left" valign="top" height="200">
        <pre style="white-space: pre-wrap;border:none;background-color: white; font-size: 18px; padding:20px;">${vo.content }</pre>
       </td>
     </tr>
     <%-- id값 확인 --%>
     <tr>
       <td colspan="6" class="text-right">
     <c:if test="${sessionScope.id==vo.user_id}">
         <a href="../board/board_update.do?no=${vo.board_id }" class="btn btn-xs btn-success">수정</a>
         <span class="btn btn-xs btn-danger" id="del">삭제</span>
     </c:if>
         <a href="../board/board_list.do" class="btn btn-lg btn-primary">목록</a>
       </td>
     </tr>
    </table>
      
      <!-- 비밀번호 입력창 -->
    <table style="margin:12px 10px">
     <tr style="display:none; " id="delTr">
       <td colspan="6" class="text-right inline">
       비밀번호:<input type=password name=pwd id=pwd1 size=10 class="input-sm">
       <input type=button value="삭제" data-no="${vo.board_id }" class="btn btn-sm btn-danger" id="delBtn">
       </td>
     </tr>
    </table>
    
       <table class="table table-align">
	     <!-- 댓글 출력 위치 -->
	     <tr>
	      <td>
	        <c:forEach var="rvo" items="${list }">
	          <table class="table">
	           <tr>
	             <td class="text-left">
	             <!-- 답글의 탭이 있다면 이미지 첨부 -->
	               <c:if test="${rvo.group_tab>0 }">
	                 <c:forEach var="i" begin="1" end="${rvo.group_tab }">
	                  &nbsp;&nbsp;&nbsp;
	                 </c:forEach>
	                 <img src="../img/re_icon.png">
	               </c:if>
	               ◑${rvo.user_id }&nbsp;(${rvo.dbday })
	             </td>
	             
	            <!--  로그인 여부 -->
	             <td class="text-right">
	              <c:if test="${sessionScope.id!=null }">
	                <c:if test="${sessionScope.id==rvo.user_id }">
	                 <span class="btn btn-sm btn-success ups" data-no="${rvo.rep_id }">수정</span>
	                 <span class="btn btn-sm btn-danger" onclick="deleteComment(${rvo.rep_id}, ${vo.board_id })">삭제</span>
	                </c:if>
	                <span class="btn btn-sm btn-info ins" data-no="${rvo.rep_id }">댓글</span>
	               </c:if>
	             </td>
	             
	           </tr>
	           
	           <!-- 댓글 내용 -->
	           <tr>
	             <td colspan="2">
	             <pre style="white-space: pre-wrap;background-color: white;border: none">${rvo.rep_content }</pre>
	             </td>
	           </tr>
	           
	           
	           <!-- 댓글의 댓글 쓰기 -->
	           <tr style="display:none" class="reins" id="i${rvo.rep_id }">
			      <td colspan="2">
			        <form method="post" action="../board/reply_reply_insert.do" class="inline">
			         <input type=hidden name=bno value="${vo.board_id}"><!-- bno는 다시 detail.do로 이동 -->
			         <input type=hidden name=pno value="${rvo.rep_id }">
			         <textarea rows="4" cols="55" name="msg" style="float: left; border-radius: 15px"></textarea>
		             <input class="ml" type=submit value="댓글쓰기" style="width: 93px;height: 82px;background-color: #77d6c9;color:white;border-radius: 15px; padding: 0px 10px; font-weight: bold">
			        </form>
			      </td>
			   </tr>
			   
			    <!--  댓글의 댓글 수정 -->
	           <tr style="display: none" class="updates" id="u${rvo.rep_id }">
			      <td colspan="2">
			        <form method="post" action="../board/reply_update.do" class="inline">
			         <input type=hidden name=bno value="${vo.board_id}"> <!-- bno는 다시 detail.do로 이동 -->
			         <input type=hidden name=no value="${rvo.rep_id }">
			         <textarea rows="4" cols="55" name="msg" style="float: left; border-radius: 15px" >${rvo.rep_content }</textarea>
		             <input class="ml" type=submit value="댓글수정" style="width: 93px;height: 82px;background-color: #77d6c9;color:white; border-radius: 15px; padding: 0px 10px; font-weight: bold">
			        </form>
			      </td>
			    </tr>
			    
	          </table>
	          
	        </c:forEach>
	      </td>
	     </tr>
	     
	   </table>
	   <c:if test="${sessionScope.id!=null }">
		   <table class="table">
		     <!-- 새댓글 입력 -->
		     <tr>
		      <td>
		        <form method="post" action="../board/reply_insert.do" class="inline">
		         <input type=hidden name=bno value="${vo.board_id}">
		         <textarea rows="5" cols="60" name="msg" style="float: left; border-radius: 15px; padding: 0px 10px;" ></textarea>
	             <input class="ml" type=submit value="댓글쓰기" style="width: 120px;height: 104px;background-color: #77d6c9;color:white;border-radius: 15px; padding: 0px 10px; font-weight: bold">
		        </form>
		      </td>
		     </tr>
		   </table>
	   </c:if>
   </div>
  </main>
</div>