<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
let i=0; // 전역변수 
let u=0;
let k=0;
$(function(){
	$('#del').click(function(){
		if(i==0)
		{
			$(this).text("취소");
			$('#delTr').show();
			i=1;
		}
		else
		{
			$(this).text("수정");
			$('#delTr').hide();
			i=0;
		}
	})
	//게시물 삭제
	$('#delBtn').click(function(){
		let pwd=$('#pwd1').val();
		let no=$('#delBtn').attr("data-no");
		if(pwd.trim()=="")
		{
			$('#pwd1').focus();
			return;
		}
		// delete.do?no=1&pwd=1111
		$.ajax({
			type:'post',
			url:'../board/board_delete.do',
			data:{"no":no,"pwd":pwd},
			success:function(result) //YES, NO전달
			{
				let res=result.trim();
				if(res==='NO')
				{
					alert("비밀번호가 틀립니다")
					$('#pwd1').val("")
					$('#pwd1').focus()
				}
				else
				{
					location.href="../board/board_list.do"
				}
			}
		})
	})
	// Update (댓글 수정)
	$('.ups').click(function(){
		let no=$(this).attr("data-no"); //댓글의 번호
		$('.ups').text("수정");
		$('.updates').hide();
		$('.reins').hide();
		if(u===0)
		{
			$('#u'+no).show();
			$(this).text("취소");
			u=1;
		}
		else
		{
			$('#u'+no).hide();
			$(this).text("수정");
			u=0;
		}
	})
	$('.ins').click(function(){
		let no=$(this).attr("data-no");
		$('.ins').text("댓글");
		$('.reins').hide();
		$('.updates').hide();
		if(k==0)
		{
			$(this).text("취소");
			$('#i'+no).show();
			k=1;
		}
		else
		{
			$(this).text("댓글");
			$('#i'+no).hide();
			k=0;
		}
		
	})
})
</script>
</head>
<body>
<div class="wrapper row3">
  <main class="container clear">
   <h2 class="sectiontitle">글쓰기</h2>
   <table class="table">
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
      <td colspan=2 class="text-center">${vo.title }</td>
      <th width=15% class="text-center">작성자</th>
      <td colspan=2 class="text-center">${vo.user_id }</td>
     </tr>
    <tr>
       <td colspan="6" class="text-left" valign="top" height="200">
        <pre style="white-space: pre-wrap;border:none;background-color: white">${vo.content }</pre>
       </td>
     </tr>
     <tr>
       <td colspan="6" class="text-right">
         <a href="../board/board_update.do?no=${vo.board_id }" class="btn btn-xs btn-info">수정</a>
         <span class="btn btn-xs btn-success" id="del">삭제</span>
         <a href="../board/board_list.do" class="btn btn-xs btn-warning">목록</a>
       </td>
     </tr>
      </table>
    <table>
     <tr style="display:none" id="delTr">
       <td colspan="6" class="text-right inline">
       비밀번호:<input type=password name=pwd id=pwd1 size=10 class="input-sm">
       <input type=button value="삭제" data-no="${vo.board_id }" class="btn btn-sm btn-primary" id="delBtn">
       </td>
     </tr>
   </table>
   <div style="height: 20px"></div> 
   
   <div class="col-sm-8">
       <table class="table">
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
	                 <img src="image/re_icon.png">
	               </c:if>
	               ◑${rvo.user_id }&nbsp;(${rvo.dbday })
	             </td>
	             
	            <!--  id공백여부 -->
	             <td class="text-right">
	               <%-- <c:if test="${sessionScope.id!=null }">
	                <c:if test="${sessionScope.id==rvo.id }"> --%>
	                 <span class="btn btn-xs btn-success ups" data-no="${rvo.rep_id }">수정</span>
	                 <a href="../board/reply_delete.do?no=${rvo.rep_id }&bno=${vo.board_id}" class="btn btn-xs btn-info">삭제</a>
	                <%-- </c:if> --%>
	                <span class="btn btn-xs btn-warning ins" data-no="${rvo.rep_id }">댓글</span>
	               <%-- </c:if> --%>
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
			         <input type=hidden name=bno value="${vo.board_id}">
			         <!-- bno는 다시 detail.do로 이동 -->
			         <input type=hidden name=pno value="${rvo.rep_id }">
			         <textarea rows="5" cols="55" name="msg" style="float: left"></textarea>
		             <input type=submit value="댓글쓰기" style="width: 100px;height: 104px;background-color: green;color:white;">
			        </form>
			      </td>
			   </tr>
			   
			    <!--  댓글의 댓글 수정 -->
	           <tr style="display: none" class="updates" id="u${rvo.rep_id }">
			      <td colspan="2">
			        <form method="post" action="../board/reply_update.do" class="inline">
			         <input type=hidden name=bno value="${vo.board_id}"> <!-- bno는 다시 detail.do로 이동 -->
			         <input type=hidden name=no value="${rvo.rep_id }">
			         <textarea rows="5" cols="55" name="msg" style="float: left">${rvo.rep_content }</textarea>
		             <input type=submit value="댓글수정" style="width: 100px;height: 104px;background-color: green;color:white;">
			        </form>
			      </td>
			    </tr>
			    
	          </table>
	          
	        </c:forEach>
	      </td>
	     </tr>
	     
	   </table>
	   <%-- <c:if test="${sessionScope.id!=null }"> --%>
		   <table class="table">
		     <!-- 새댓글 입력 -->
		     <tr>
		      <td>
		        <form method="post" action="../board/reply_insert.do" class="inline">
		         <input type=hidden name=bno value="${vo.board_id}">
		         <textarea rows="5" cols="60" name="msg" style="float: left"></textarea>
	             <input type=submit value="댓글쓰기" style="width: 120px;height: 104px;background-color: green;color:white;">
		        </form>
		      </td>
		     </tr>
		   </table>
	   <%-- </c:if> --%>
   </div>
    
   <div class="col-sm-4">
   
   </div>
  
  </main>
</div>
</body>
</html>