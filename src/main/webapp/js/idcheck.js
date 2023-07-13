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

$('#idCheckBtn').click(idcheck);
$('#nicknameCheckBtn').click(nicknamecheck);