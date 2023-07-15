<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <div class="join-main">
  	<div class="row">
  	<div class="col-sm-2"></div>
  	<div class="col-sm-8">
      <p class="join-sign" align="center">회원가입</p>
	    <div class="row">
	     <form method="post" action="../member/join_ok.do" name="joinFrm" id="joinFrm">
	      <table class="table">
	        <tr>
	         <th class="text-center" width=10% style="padding-top: 20px">ID</th>
	         <td width=90% class="inline">
	          <input class="join-id" type="text" align="center" name=id id=id readonly>&nbsp;
	          <span class="check-submit" align="center" style="text-decoration: none;" id="idCheckBtn">중복체크</span>
	         </td>
	        </tr>
	        
	        <tr>
	         <th class="text-left" width=10% style="padding-top: 20px; font-size: 13px;" >비밀번호</th>
	         <td width=90% class="inline">
	           <input class="join-id" type="password" name=pwd1 id=pwd1 align="center" display="inline">
	           &nbsp;&nbsp;비밀번호 확인 <input class="join-id" type="password" name=pwd2 id=pwd2 align="center">
	           <span class="check-submit" align="center" style="text-decoration: none;" id="pwdBtn">중복체크</span>
	          <p id="pwdMsg" style="color: red; display: block none;"></p> 
	         </td>
	        </tr>
	        
	        <tr>
	         <th class="text-center" width=10% style="padding-top: 20px">이름</th>
	         <td width=90% class="inline">
	         <input class="join-id" type="text" align="center" name=name id=name style="width: 25%">
	         </td>
	        </tr>
	        
	        <tr>
	         <th class="text-center" width=10% style="padding-top: 20px;">성별</th>
	         <td width=90% class="inline" style="padding-top: 15px">
	          <input type="radio" name=gender id=gender value="남자" checked> 남자 
	          <input type="radio" name=gender id=gender value="여자"> 여자
	         </td>
	        </tr>
	        
	        <tr>
	         <th class="text-left" width=10% style="padding-top: 20px; font-size: 13px;" >생년월일</th>
	         <td width=90% class="inline" style="padding-top:15px">
	          <input type="date" name=birthday id=birthday size=20>
	         </td>
	        </tr>
	       
	        <tr>
	         <th class="text-center" width=10% style="padding-top: 20px">닉네임</th>
	         <td width=90% class="inline">
	          <input class="join-id" type="text" align="center" name=nickname id=nickname readonly>
	          <span class="check-submit" align="center" style="text-decoration: none;" id="nicknameCheckBtn">중복체크</span>
	         </td>
	        </tr> 
	        
	        <tr>
	         <th class="text-left" width=10% style="padding-top: 20px; font-size: 13px;">전화번호</th>
	         <td width=90% class="inline">
	          <input class="join-id" type="text" align="center" name=phone id=phoneInput  style="width: 40%">
	          <span class="check-submit" align="center" style="text-decoration: none;" id="phoneBtn">중복체크</span>
	           &nbsp;<p id="phoneMsg" style="color: red; display: none"></p> 
	         </td>
	        </tr> 
	        
	        <tr>
	         <th class="text-center" width=10% style="padding-top: 20px">이메일</th>
	         <td width=90% class="inline"> 
	          <input class="join-id" type="text" align="center" name=email id=emailInput style="width: 45%">
	          <span class="check-submit" align="center" style="text-decoration: none;" id="emailBtn">중복체크</span>
	           &nbsp;<p id="emailMsg" style="color: red; display: none"></p> 
	         </td>
	        </tr>
	        
	        <tr>
	         <th class="text-left" width=10% style="padding-top: 20px; font-size: 13px;">우편번호</th>
	         <td width=90% class="inline">
	         <input class="join-id" type="text" align="center" name=post id=post  style="width: 20%" readonly>
	          <span class="post-submit" align="center" style="text-decoration: none;" id="postBtn">우편번호 검색</span>
	         </td>
	        </tr>
	        
	        <tr>
	         <th class="text-center" width=10% style="padding-top: 20px">주소</th>
	         <td width=90% class="inline">
	         <input class="join-id" type="text" align="center" name=addr1 id=addr1 style="width: 60%">
	         </td>
	        </tr>
	        
	        <tr>
	         <th class="text-left" width=10% style="padding-top: 20px; font-size: 13px;" >상세주소</th>
	         <td width=90% class="inline">
	         <input class="join-id" type="text" align="center" name=addr2 id=addr2 style="width: 60%">
	         </td>
	        </tr>
	        
	        <tr>
	          <td colspan="2" class="text-center">
	          <span class="join-ok-submit" align="center" style="text-decoration: none; font-style: bold" id="joinBtn">회원가입</span>
	           <!-- <input type=button value="취소" class="btn btn-danger btn-sm" onclick="javascript:history.back()"> -->
	          </td>
	        </tr>
	      </table>
	      </form>
	    </div>
	    <div id="dialog" title="중복체크" style="display: none"></div>
  		<div class="col-sm-2"></div>
  		</div>
  	</div>
</div>