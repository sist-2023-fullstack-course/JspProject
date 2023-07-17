/**
 * 
 */
function idcheck() {
    $.ajax({
		type:'post',
		url:'../member/idcheck.do',
		success:function(res) // 정상수행을 했다면 res에 기능을 넣어줌
		{
			$('#dialog').html(res);
			$('#dialog').dialog({
				autoOpen:false,
				width:500,
				height:450,
				modal:true // 다른 화면 클릭 안됨
			}).dialog("open")
			idok();
		}
	})
}

function idok(){
	$('#ok').hide();
	$('#checkBtn').click(function(){
		let id=$('#idInput').val();
		
		if(id.trim()=="")
		{
			$('#idInput').focus();
			return;
		}
		
		$.ajax({
			type:'post',
			url:'../member/idcheck_ok.do',
			data:{"id":id},
			success: function(result)
			{
				//alert("result="+result);
				let count=Number(result.trim());
				if(count==0) /* id가 없다 */
				{
					$('#ok').show();
					$('#res').html('<span style="color:blue">'+id+"는(은) 사용 가능한 아이디입니다.</span>");
					$('#idInput').prop('disabled',true);
				}
				else /* id가 있다 */
				{
					$('#ok').hide();
					$('#res').html('<span style="color:red">'+id+"는(은) 이미 사용중인 아이디입니다!</span>");
					$('#idInput').val();
					$('#idInput').focus();
				}
			}
		})
	})
	
	$('#okBtn').click(function(){
		$('#dialog').dialog('close');
		$('#id').val($('#idInput').val());
	})
}

function pwdcheck(){
			let pwd1=$('#pwd1').val();
			let pwd2=$('#pwd2').val();
			
			if(pwd1==pwd2)
			{
				$('#pwdMsg').text('일치합니다.');
				$('#pwdMsg').attr('style', 'display:inline; color:blue;');
			}
			else
			{
				$('#pwdMsg').text('비밀번호가 일치하지 않습니다.')
				$('#pwdMsg').attr('style', 'display:inline; color:red;');
				$('#pwd2').val("");
				$('#pwd2').focus();
			}
}

function nicknamecheck() {
    $.ajax({
		type:'post',
		url:'../member/nicknamecheck.do',
		success:function(res) // 정상수행을 했다면 res에 기능을 넣어줌
		{
			$('#dialog').html(res);
			$('#dialog').dialog({
				autoOpen:false,
				width:500,
				height:450,
				modal:true // 다른 화면 클릭 안됨
			}).dialog("open")
			nickok();
		}
	})
}

function nickok(){
	$('#ok').hide();
	$('#checkBtn').click(function(){
		let nickname=$('#nicknameInput').val();
		
		if(nickname.trim()=="")
		{
			$('#nicknameInput').focus();
			return;
		}
		
		$.ajax({
			type:'post',
			url:'../member/nicknamecheck_ok.do',
			data:{"nickname":nickname},
			success: function(result)
			{
				//alert("result="+result);
				let count=Number(result.trim());
				if(count==0) /* 닉네임이 없다 */
				{
					$('#ok').show();
					$('#res').html('<span style="color:blue">'+nickname+"는(은) 사용 가능한 아이디입니다.</span>");
					$('#nicknameInput').prop('disabled',true);
				}
				else /* 닉네임이 있다 */
				{
					$('#ok').hide();
					$('#res').html('<span style="color:red">'+nickname+"는(은) 이미 사용중인 아이디입니다!</span>");
					$('#nicknameInput').val();
					$('#nicknameInput').focus();
				}
			}
		})
	})
	
	$('#okBtn').click(function(){
		$('#dialog').dialog('close');
		$('#nickname').val($('#nicknameInput').val());
	})
}

function phonecheck(){
			let phone=$('#phoneInput').val();
			
			if(phone.trim()=="")
			{
				$('#phoneInput').focus();
				$('#phoneMsg').text('전화번호를 입력해주세요.');
				$('#phoneMsg').attr('style', 'display:inline; color:red;');
				return;
			}
			
			$.ajax({
				type:'post',
				url:'../member/phonecheck.do',
				data:{"phone":phone},
				success: function(result)
				{
					let count=Number(result.trim());
					if(count==0) /* 전화번호가 없다 */
					{
						$('#phoneMsg').text('사용 가능한 전화번호입니다.')
						$('#phoneMsg').attr('style', 'display:inline; color:blue;');
	
					}
					else /* 전화번호가 있다 */
					{
						$('#phoneMsg').text('이미 사용중인 전화번호입니다.')
						$('#phoneMsg').attr('style', 'display:inline; color:red;');
						$('#phoneInput').val("");
						$('#phone').focus();
					}
				}
			})
}


function emailcheck(){
			let email=$('#emailInput').val();
			
			if(email.trim()=="")
			{
				$('#emailInput').focus();
				$('#emailMsg').text('이메일을 입력해주세요.');
				$('#emailMsg').attr('style', 'display:inline; color:red;');
				return;
			}
			
			$.ajax({
				type:'post',
				url:'../member/emailcheck.do',
				data:{"email":email},
				success: function(result)
				{
					let count=Number(result.trim());
					if(count==0) /* 이메일이 없다 */
					{
						$('#emailMsg').text('사용 가능한 이메일입니다.')
						$('#emailMsg').attr('style', 'display:inline; color:blue;');
	
					}
					else /* 이메일이 있다 */
					{
						$('#emailMsg').text('이미 사용중인 이메일입니다.')
						$('#emailMsg').attr('style', 'display:inline; color:red;');
						$('#emailInput').val("");
						$('#email').focus();
					}
				}
			})
}

function zipcodecheck() {
    $.ajax({
		type:'post',
		url:'../member/postfind.do',
		success:function(res) // 정상수행을 했다면 res에 기능을 넣어줌
		{
			$('#dialog').html(res);
			$('#dialog').dialog({
				autoOpen:false,
				width:500,
				height:450,
				modal:true // 다른 화면 클릭 안됨
			}).dialog("open")
			zipcodeok();
		}
	})
}

function zipcodeok(){
	$('#postfindBtn').click(function(){
		let dong=$('#dongInput').val();
		
		if(dong.trim()=="")
		{
			$('#dongInput').focus();
			return;
		}
		
		$.ajax({
			type:'post',
			url:'../member/postfind_result.do',
			data:{"dong":dong},
			success:function(result)
			{
				$('#result').html(result);
			}
		})
	})
}

function findok(zip,addr)
{
	parent.joinFrm.post.value=zip;
	parent.joinFrm.addr1.value=addr;
	$('#dialog').dialog('close');
}


$('#joinBtn').click(function(){
	if($('#id').val().trim()==="")
	{
		$('#joinMsg').text('아이디를 입력해주세요.')
		$('#joinMsg').attr('style','display:block; color:red; margin: 0px;')
		return
	}
	
	if($('#pwd1').val().trim()==="")
	{
		$('#pwd1').focus()
		$('#joinMsg').text('비밀번호를 입력해주세요.')
		$('#joinMsg').attr('style','display:block; color:red; margin: 0px;')
		return
	}
	
	if($('#pwd2').val().trim()==="")
	{
		$('#pwd2').focus()
		$('#joinMsg').text('비밀번호를 확인해주세요.')
		$('#joinMsg').attr('style','display:block; color:red; margin: 0px;')
		return
	}
	
	if($('#name').val().trim()==="")
	{
		$('#name').focus()
		$('#joinMsg').text('이름을 입력해주세요.')
		$('#joinMsg').attr('style','display:block; color:red; margin: 0px;')
		return
	}
	
	if($('#birthday').val().trim()==="")
	{
		$('#joinMsg').text('생년월일을 입력해주세요.')
		$('#joinMsg').attr('style','display:block; color:red; margin: 0px;')
		return
	}
	
	if($('#nickname').val().trim()==="")
	{
		$('#joinMsg').text('닉네임을 입력해주세요.')
		$('#joinMsg').attr('style','display:block; color:red; margin: 0px')
		return
	}
	
	if($('#phoneInput').val().trim()==="")
	{
		$('#phone').focus()
		$('#joinMsg').text('전화번호를 입력해주세요.')
		$('#joinMsg').attr('style','display:block; color:red; margin: 0px;')
		return
	}

	if($('#emailInput').val().trim()==="")
	{
		$('#email').focus()
		$('#joinMsg').text('이메일을 입력해주세요.')
		$('#joinMsg').attr('style','display:block; color:red; margin: 0px;')
		return
	}

	if($('#post').val().trim()==="")
	{
		$('#joinMsg').text('우편번호를 입력해주세요.')
		$('#joinMsg').attr('style','display:block; color:red; margin: 0px;')
		return
	}
	
	if($('#addr1').val().trim()==="")
	{
		$('#joinMsg').text('주소를 입력해주세요.')
		$('#joinMsg').attr('style','display:block; color:red; margin: 0px;')
		return
	}
	
	if($('#addr2').val().trim()==="")
	{
		$('#addr2').focus()
		$('#joinMsg').text('상세주소를 입력해주세요.')
		$('#joinMsg').attr('style','display:block; color:red; margin: 0px;')
		return
	}
		
	$('#joinFrm').submit();
})

$('#idCheckBtn').click(idcheck);
$('#pwdBtn').click(pwdcheck);
$('#nicknameCheckBtn').click(nicknamecheck);
$('#emailBtn').click(emailcheck);
$('#phoneBtn').click(phonecheck);
$('#postBtn').click(zipcodecheck);