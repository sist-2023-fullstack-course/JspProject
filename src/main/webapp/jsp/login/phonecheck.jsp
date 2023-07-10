<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container {
	margin-top: 20px;
}
.row {
	margin: 0px auto;
	width: 300px;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('#ok').hide();
	$('#checkBtn').click(function(){
		let phone=$('#phone').val();
		if(phone.trim()=="")
		{
			$('#phone').focus();
			return;
		}
		
		$.ajax({
			type:'post',
			url:'../../login/phonecheck_ok.do',
			data:{"phone":phone},
			success: function(result)
			{
				alert("result="+result);
				let count=Number(result.trim());
				if(count==0)
				{
					$('#ok').show();
					$('#res').html('<span style="color:blue">'+"사용 가능한 번호입니다.</span>");
					$('#id').prop('disabled',true);
				}
				else
				{
					$('#ok').hide();
					$('#res').html('<span style="color:red">'+"이미 사용 중인 번호입니다.</span>");
					$('#id').val();
					$('#id').focus();
				}
			}
		})
	})
	
	$('#okBtn').click(function(){
		// parent=join.jsp
		parent.joinFrm.id.value=$('#phone').val()
		parent.Shadowbox.close();
	})
})
</script>
</head>
<body>
  <div class="container">
  	<div class="row">
  		<table class="table">
  		  <tr>
  		    <td>닉네임 : <input type=text name=phone id=phone size=15 class="input-sm">
  		    	<input type=button value="중복체크" class="btn btn-sm btn-warning" id="checkBtn">
  		    </td>
  		  </tr>
  		  <tr>
  		    <td class="text-center" id="res">
  		    
  		    </td>
  		  </tr>
  		  <tr id="ok">
  		    <td class="text-center">
  		      <input type=button value="확인" id="okBtn" class="btn btn-sm btn-primary">
  		    </td>
  		  </tr>
  		</table>
  	</div>
  </div>
</body>
</html>