<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div style="padding-top: 40px;"></div>
    <div class="col-sm-1 col-md-1"></div>
    <div class="col-sm-10 col-md-10">
    	<div class="row">
	      <table class="myinfo table">
	        <tr>
	         <th class="text-center" width=15% style="padding-top: 20px">ID</th>
	         <td width=85% class="inline">
	          <input class="join-id" type="text" align="center" name=id id=id readonly value="${vo.id }">&nbsp;
	         </td>
	        </tr>
	        
	        <tr>
	         <th class="text-center" width=15% style="padding-top: 20px; font-size: 13px;" >비밀번호</th>
	         <td width=85% class="inline">
	           <input class="join-id" type="password" name=pwd1 id=pwd1 align="center" display="inline">
	         </td>
	        </tr>
	        
	        <tr>
	         <th class="text-center" width=15% style="padding-top: 20px">이름</th>
	         <td width=85% class="inline">
	         <input class="join-id" type="text" name=name id=name style="width: 25%" value="${vo.name }">
	         </td>
	        </tr>
	        
	        <tr>
	         <th class="text-center" width=15% style="padding-top: 20px;">성별</th>
	         <td width=85% class="inline" style="padding-top: 15px">
	          <input type="radio" name=gender id=gender value="남자" ${vo.gender=='남자'?"selected":"" }> 남자 
	          <input type="radio" name=gender id=gender value="여자" ${vo.gender=='여자'?"selected":"" }> 여자
	         </td>
	        </tr>
	        
	        <tr>
	         <th class="text-center" width=15% style="padding-top: 20px; font-size: 13px;" >생년월일</th>
	         <td width=85% class="inline" style="padding-top:15px">
	          <input type="date" name=birthday id=birthday size=20 value="${vo.birthday }">
	         </td>
	        </tr>
	       
	        <tr>
	         <th class="text-center" width=15% style="padding-top: 20px">닉네임</th>
	         <td width=85% class="inline">
	          <input class="join-id" type="text" align="center" name=nickname id=nickname value="${vo.nickname }" readonly>
	          <span class="check-submit" align="center" style="text-decoration: none;" id="nicknameCheckBtn">중복체크</span>
	         </td>
	        </tr> 
	        
	        <tr>
	         <th class="text-center" width=15% style="padding-top: 20px; font-size: 13px;">전화번호</th>
	         <td width=85% class="inline">
	          <input class="join-id" type="text" align="center" name=phone id=phoneInput  style="width: 40%" value="${vo.phone }">
	          <span class="check-submit" align="center" style="text-decoration: none;" id="phoneBtn">중복체크</span>
	           &nbsp;<p id="phoneMsg" style="color: red; display: none"></p> 
	         </td>
	        </tr> 
	        
	        <tr>
	         <th class="text-center" width=15% style="padding-top: 20px">이메일</th>
	         <td width=85% class="inline"> 
	          <input class="join-id" type="text" align="center" name=email id=emailInput style="width: 45%" value="${vo.email }">
	          <span class="check-submit" align="center" style="text-decoration: none;" id="emailBtn">중복체크</span>
	           &nbsp;<p id="emailMsg" style="color: red; display: none"></p> 
	         </td>
	        </tr>
	        
	        <tr>
	         <th class="text-center" width=15% style="padding-top: 20px; font-size: 13px;">우편번호</th>
	         <td width=85% class="inline">
	         <input class="join-id" type="text" align="center" name=post id=post  style="width: 20%" value="${vo.post }" readonly>
	          <span class="post-submit" align="center" style="text-decoration: none;" id="postBtn">우편번호 검색</span>
	         </td>
	        </tr>
	        
	        <tr>
	         <th class="text-center" width=15% style="padding-top: 20px">주소</th>
	         <td width=85% class="inline">
	         <input class="join-id" type="text" align="center" name=addr1 id=addr1 style="width: 60%" value="${vo.addr1 }" readonly>
	         </td>
	        </tr>
	        
	        <tr>
	         <th class="text-center" width=15% style="padding-top: 20px; font-size: 13px;" >상세주소</th>
	         <td width=85% class="inline">
	         <input class="join-id" type="text" align="center" name=addr2 id=addr2 style="width: 60%" value="${vo.addr2 }">
	         </td>
	        </tr>
	        
	        <tr>
	          <th></th>
	          <td style="text-align:center">
	          <span class="join-ok-submit updates" align="center" style="text-decoration: none; font-style: bold" id="joinBtn">수정하기</span>
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
	
})

</script>
    