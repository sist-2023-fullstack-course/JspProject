<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div class="page-title">개인정보 수정하기</div>
    <div class="col-sm-1 col-md-1"></div>
    <div class="col-sm-10 col-md-10">
    	<div class="row">
	      <table class="myinfo table">
	        <tr>
	         <th class="text-center" width=30% style="padding-top: 20px">ID</th>
	         <td width=70% class="inline">
	          <input class="join-id" type="text" name=id id=id readonly value="${vo.id }">&nbsp;
	         </td>
	        </tr>
	        
	        <tr>
	         <th class="text-center" width=30% style="padding-top: 20px">이름</th>
	         <td width=70% class="inline">
	         <input class="join-id" type="text" name=name id=name style="width:25%" value="${vo.name }">
	         </td>
	        </tr>
	        
	        <tr>
	         <th class="text-center" width=30% style="padding-top: 20px;">성별</th>
	         <td width=70% class="inline" style="padding-top: 15px">
	         &nbsp;&nbsp;
	          <input type="radio" name=gender id=gender value="남자" ${vo.gender=='남자'?"checked":"" } onclick="return false;"> 남자 
	          <input type="radio" name=gender id=gender value="여자" ${vo.gender=='여자'?"checked":"" } onclick="return false;"> 여자
	         </td>
	        </tr>
	        
	        <tr>
	         <th class="text-center" width=30% style="padding-top: 20px; font-size: 13px;" >생년월일</th>
	         <td width=70% class="inline" style="padding-top:15px">
	          &nbsp;&nbsp;
	          <input type="date" name=birthday id=birthday size=20 value="${vo.birthday }">
	         </td>
	        </tr>
	       
	        <tr>
	         <th class="text-center" width=30% style="padding-top: 20px">닉네임</th>
	         <td width=70% class="inline">
	          <input class="join-id" type="text" name=nickname id=nickname value="${vo.nickname }" readonly>
	          <span class="check-submit" style="text-decoration: none;text-align:center;" id="nicknameCheckBtn">중복체크</span>
	         </td>
	        </tr> 
	        
	        <tr>
	         <th class="text-center" width=30% style="padding-top: 20px; font-size: 13px;">전화번호</th>
	         <td width=70% class="inline">
	          <input class="join-id" type="text" name=phone id=phone  style="width: 40%" value="${vo.phone }">
	          <span class="check-submit" style="text-decoration: none;text-align:center;" id="phoneBtn">중복체크</span>
	           &nbsp;<p id="phoneMsg" style="color: red; display: none"></p> 
	         </td>
	        </tr> 
	        
	        <tr>
	         <th class="text-center" width=30% style="padding-top: 20px">이메일</th>
	         <td width=70% class="inline"> 
	          <input class="join-id" type="text" name=email id=email style="width: 45%" value="${vo.email }">
	          <span class="check-submit" style="text-decoration: none;text-align:center;" id="emailBtn">중복체크</span>
	           &nbsp;<p id="emailMsg" style="color: red; display: none"></p> 
	         </td>
	        </tr>
	        
	        <tr>
	         <th class="text-center" width=30% style="padding-top: 20px; font-size: 13px;">우편번호</th>
	         <td width=70% class="inline">
	         <input class="join-id" type="text" name=post id=post  style="width: 20%" value="${vo.post }" readonly>
	          <span class="post-submit" style="text-decoration: none;text-align:center;" id="postBtn">우편번호 검색</span>
	         </td>
	        </tr>
	        
	        <tr>
	         <th class="text-center" width=30% style="padding-top: 20px">주소</th>
	         <td width=70% class="inline">
	         <input class="join-id" type="text" name=addr1 id=addr1 style="width: 60%" value="${vo.addr1 }" readonly>
	         </td>
	        </tr>
	        
	        <tr>
	         <th class="text-center" width=30% style="padding-top: 20px; font-size: 13px;" >상세주소</th>
	         <td width=70% class="inline">
	         <input class="join-id" type="text" name=addr2 id=addr2 style="width: 60%" value="${vo.addr2 }">
	         </td>
	        </tr>
	        
	        <tr>
	         <th class="text-center" width=30% style="padding-top: 20px; font-size: 13px;" >비밀번호 확인</th>
	         <td width=70% class="inline">
	           <input class="join-id" type="password" name=pwd id=pwd display="inline">
	         </td>
	        </tr>
	        
	        <tr>
	          <td colspan=2 style="text-align:center">
	           <p style="margin: 0px; display: none" id=updateMsg></p>
	           <span class="join-ok-submit updates" style="text-decoration: none; font-style: bold">수정 완료</span>
	           <!-- <input type=button value="취소" class="btn btn-danger btn-sm" onclick="javascript:history.back()"> -->
	          </td>
	        </tr>
	      </table>
	    </div>
    </div>
    <div id="dialog" title="중복체크" style="display: none"></div>
    <div class="col-sm-1 col-md-1" ></div>
    
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$('.updates').click(function(){
	let id=$('#id').val();
	let pwd=$('#pwd').val();
	let name=$('#name').val();
	let nickname=$('#nickname').val();
	let phone=$('#phone').val();
	let email=$('#email').val();
	let post=$('#post').val();
	let addr1=$('#addr1').val();
	let addr2=$('#addr2').val();
	let birthday=$('#birthday').val();
	
		
		if($('#name').val().trim()==="")
		{
			$('#name').focus()
			$('#updateMsg').text('이름을 입력해주세요.')
			$('#updateMsg').attr('style','display:block; color:red; margin: 0px;')
			return
		}
		
		if($('#birthday').val().trim()==="")
		{
			$('#updateMsg').text('생년월일을 입력해주세요.')
			$('#updateMsg').attr('style','display:block; color:red; margin: 0px;')
			return
		}
		
		if($('#nickname').val().trim()==="")
		{
			$('#updateMsg').text('닉네임을 입력해주세요.')
			$('#updateMsg').attr('style','display:block; color:red; margin: 0px')
			return
		}
		
		if($('#phone').val().trim()==="")
		{
			$('#phone').focus()
			$('#updateMsg').text('전화번호를 입력해주세요.')
			$('#updateMsg').attr('style','display:block; color:red; margin: 0px;')
			return
		}

		if($('#email').val().trim()==="")
		{
			$('#email').focus()
			$('#updateMsg').text('이메일을 입력해주세요.')
			$('#updateMsg').attr('style','display:block; color:red; margin: 0px;')
			return
		}

		if($('#post').val().trim()==="")
		{
			$('#updateMsg').text('우편번호를 입력해주세요.')
			$('#updateMsg').attr('style','display:block; color:red; margin: 0px;')
			return
		}
		
		if($('#addr1').val().trim()==="")
		{
			$('#updateMsg').text('주소를 입력해주세요.')
			$('#updateMsg').attr('style','display:block; color:red; margin: 0px;')
			return
		}
		
		if($('#addr2').val().trim()==="")
		{
			$('#addr2').focus()
			$('#updateMsg').text('상세주소를 입력해주세요.')
			$('#updateMsg').attr('style','display:block; color:red; margin: 0px;')
			return
		}
	
		if($('#pwd').val().trim()==="")
		{
			$('#pwd').focus()
			$('#updateMsg').text('비밀번호를 입력해주세요.')
			$('#updateMsg').attr('style','display:block; color:red; margin: 0px;')
			return
		}
	
	$.ajax({
		type:'post',
		url:"../mypage/updatemyinfo.do",
		data:{
			"id":id,
			"pwd":pwd,
			"name":name,
			"nickname":nickname,
			"phone":phone,
			"email":email,
			"post":post,
			"addr1":addr1,
			"addr2":addr2,
			"birthday":birthday
		},
		success:function(result)
		{
			if(result=='success'){
				alert('수정 완료되었습니다.')
				location.href="../mypage/main.do";
			}
			else if (result=='fail'){
				alert('비밀번호가 일치하지 않습니다. 다시 시도해주세요.')
			}
		}
	
	})
})

</script>
    