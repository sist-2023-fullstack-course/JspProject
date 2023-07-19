/**
 * 
 */
function idCheckfc(){
		let id=$('#idInput').val();
		if(id.trim()=="")
		{
			$('#idInput').focus();
			$('#loginMsg').text('아이디를 입력해주세요');
			$('#loginMsg').attr('style', 'display:block; color:red; ');
			return;
		}
		
		let pwd=$('#pwdInput').val();
		if(pwd.trim()=="")
		{
			$('#pwdInput').focus();
			$('#loginMsg').text('비밀번호를 입력해주세요');
			$('#loginMsg').attr('style', 'display:block; color:red;');
			return;
		}
		
		// 전송 => 실행결과를 가지고 온다 (자체 처리) (요청=응답:Ajax, Vue, React)
		$.ajax({
			type:'post',
			url:'login.do',
			data:{"id":id,"pwd":pwd},
			success:function(result) // NOID, NOPWD, OK
			{
				let res=result.trim();
				if(res=='NOID')
				{
					$('#loginMsg').text('아이디가 존재하지 않습니다')
					$('#loginMsg').attr('style', 'display:block; color:red;');
					$('#idInput').val('');
					$('#pwdInput').val('');
					$('#idInput').focus();
				}
				else if(res=='NOPWD')
				{
					$('#loginMsg').text('비밀번호가 틀렸습니다')
					$('#loginMsg').attr('style', 'display:block; color:red;');
					$('#pwdInput').val("");
					$('#pwd').focus();
				}
				else
				{
					location.href = document.referrer;
				}
			}
		})
}

function logout(){
	$.get('/JspProject/member/logout.do', function() {
        location.reload();
    });
}	
$('#loginBtn').click(idCheckfc);