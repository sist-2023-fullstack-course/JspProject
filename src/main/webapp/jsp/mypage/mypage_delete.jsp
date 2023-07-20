<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="delete-main">
   <p class="delete-title" align="center">회원 탈퇴</p>
      <p class="delete-before">탈퇴 시 삭제된 데이터는 복구되지 않습니다. 삭제하시겠습니까? </p> 
      <input class="delete-password" type="password" align="center" placeholder="비밀번호 확인" id="pwdInput">
      <div style="display:inline;margin:0px 100px;">
	      <a id="delAccBtn" class="delete-to-confirm-submit" align="center">탈퇴하기</a>
	      <span class="delete-cancel" align="center" style="text-decoration: none;"  onclick="javascript:history.back()">취소</span>
      </div>
</div>

<script type="text/javascript">
$(function(){
	$('#delAccBtn').click(function(){
		let pwd = $('#pwdInput').val().trim();
		if(pwd==="")
		{
			$('#pwdInput').focus();
			return;
		}
		$.ajax({
			type:'post',
			url:'deletemyaccount_confirm.do',
			data:{"pwd":pwd},
			success:function(result)
			{
				let res=result.trim();
				if(res==='no')
			    {
					alert("비밀번호가 틀립니다. 다시 확인해주세요.");
					$('#pwdInput').val("");
					$('#pwdInput').focus();
				}
				else if(res==='yes')
				{
					alert("회원 탈퇴 완료되었습니다.");
					location.href="../main/main.do";
				}
			}
			
		})
	})
})
</script>