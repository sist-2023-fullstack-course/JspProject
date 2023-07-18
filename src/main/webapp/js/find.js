/**
 * 
 */
function idfind_email(){
	  let email=$('#email').val()
	  if(email.trim()==="")
	  {
		  $('#email').focus()
		  return
	  }
  
  	  $.ajax({
  		  type:'post',
  		  url:'../member/idfind_email_ok.do',
  		  data:{"email":email},
  		  success:function(result)
  		  {
  			  let res=result.trim()
  			  if(res==='NO')
  			  {
  				  $('#id_email').html('<span style="color: red">이메일이 존재하지 않습니다.</span>')
  			  }
  			  else
  			  {
  				  $('#id_email').html('<span style="color: blue">'+res+'</span>')
  			  }
  		  }
  	  })
}
  
function idfind_phone(){
	  let phone=$('#phone').val()
	  if(phone.trim()==="")
	  {
		  $('#phone').focus()
		  return
	  }
  
  	  $.ajax({
  		  type:'post',
  		  url:'../member/idfind_phone_ok.do',
  		  data:{"phone":phone},
  		  success:function(result)
  		  {
  			  let res=result.trim()
  			  if(res==='NO')
  			  {
  				  $('#id_phone').html('<span style="color: red">전화번호가 존재하지 않습니다.</span>')
  			  }
  			  else
  			  {
  				  $('#id_phone').html('<span style="color: blue">'+res+'</span>')
  			  }
  		  }
  	  })
}

function pwdfind_email(){
		let id=$('#id1').val()
		if(id.trim()==="")
		{
			$('#id1').focus()
			return
		}
		
		let email=$('#email').val()
		if(email.trim()==="")
		{
			$('#email').focus()
			return
		}
		
		$.ajax({
			type:'post',
			url:'../member/pwdfind_email_ok.do',
			data:{"id":id,"email":email},
			success:function(result)
			{
				let res=result.trim()
				if(res==='NO')
				{
					$('#pwd_email').html('<span style="color: red">이름 or 이메일이 존재하지 않습니다.</span>')
				}
				else
				{
					$('#pwd_email').html('<span style="color: blue">'+res+'</span>')
				}
			}
		})
}

function pwdfind_phone(){
		let id=$('#id2').val()
		if(id.trim()==="")
		{
			$('#id2').focus()
			return
		}
		
		let phone=$('#phone').val()
		if(phone.trim()==="")
		{
			$('#phone').focus()
			return
		}
		
		$.ajax({
			type:'post',
			url:'../member/pwdfind_phone_ok.do',
			data:{"id":id,"phone":phone},
			success:function(result)
			{
				let res=result.trim()
				if(res==='NO')
				{
					$('#pwd_phone').html('<span style="color: red">이름 or 전화번호가 존재하지 않습니다.</span>')
				}
				else
				{
					$('#pwd_phone').html('<span style="color: blue">'+res+'</span>')
				}
			}
		})
}

$('#idfind_emailBtn').click(idfind_email)
$('#idfind_phoneBtn').click(idfind_phone)
$('#pwdfind_emailBtn').click(pwdfind_email)
$('#pwdfind_phoneBtn').click(pwdfind_phone)