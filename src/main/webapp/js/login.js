/**
 * 
 */
function idCheckfc(){
		let id=$('#idInput').val();
		if(id.trim()=="")
		{
			$('#idInput').focus();
			return;
		}
		
		let pwd=$('#pwdInput').val();
		if(pwd.trim()=="")
		{
			$('#pwdInput').focus();
			return;
		}
		
		// 전송 => 실행결과를 가지고 온다 (자체 처리) (요청=응답:Ajax, Vue, React)
		$.ajax({
			type:'post',
			url:'login.do',
			data:{"id":id,"pwd":pwd},
			success:function(result) // NOID, NOPWD, OK
			{
				console.log(result);
				let res=result.trim();
				if(res=='NOID')
				{
					alert("아이디가 존재하지 않습니다!!")
					$('#idInput').val("");
					$('#pwdInput').val("");
					$('#idInput').focus();
				}
				else if(res=='NOPWD')
				{
					alert("비밀번호가 틀립니다!!")
					$('#pwdInput').val("");
					$('#pwd').focus();
				}
				else
				{
					location.href="../main/main.do"
				}
			}
		})
}
	
$('#loginBtn').click(idCheckfc);