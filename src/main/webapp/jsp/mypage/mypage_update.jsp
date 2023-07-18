<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div style="padding-top: 40px;"></div>
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
	         <input class="join-id" type="text" name=name id=name style="width:25%" value="${vo.name }" readonly>
	         </td>
	        </tr>
	        
	        <tr>
	         <th class="text-center" width=30% style="padding-top: 20px;">성별</th>
	         <td width=70% class="inline" style="padding-top: 15px" >
	         &nbsp;&nbsp;
	          <input type="radio" name=gender id=gender value="남자" ${vo.gender=='남자'?"checked":"" } onclick="return false;"> 남자 
	          <input type="radio" name=gender id=gender value="여자" ${vo.gender=='여자'?"checked":"" } onclick="return false;"> 여자
	         </td>
	        </tr>
	        
	        <tr>
	         <th class="text-center" width=30% style="padding-top: 20px; font-size: 13px;" >생년월일</th>
	         <td width=70% class="inline" style="padding-top:15px">
	          &nbsp;&nbsp;
	          <input type="date" name=birthday id=birthday size=20 value="${vo.birthday }" readonly>
	         </td>
	        </tr>
	       
	        <tr>
	         <th class="text-center" width=30% style="padding-top: 20px">닉네임</th>
	         <td width=70% class="inline">
	          <input class="join-id" type="text" name=nickname id=nickname value="${vo.nickname }" readonly>
	         </td>
	        </tr> 
	        
	        <tr>
	         <th class="text-center" width=30% style="padding-top: 20px; font-size: 13px;">전화번호</th>
	         <td width=70% class="inline">
	          <input class="join-id" type="text" name=phone id=phone  style="width: 40%" value="${vo.phone }" readonly>
	           &nbsp;<p id="phoneMsg" style="color: red; display: none"></p> 
	         </td>
	        </tr> 
	        
	        <tr>
	         <th class="text-center" width=30% style="padding-top: 20px">이메일</th>
	         <td width=70% class="inline"> 
	          <input class="join-id" type="text" name=email id=email style="width: 45%" value="${vo.email }" readonly>
	           &nbsp;<p id="emailMsg" style="color: red; display: none"></p> 
	         </td>
	        </tr>
	        
	        <tr>
	         <th class="text-center" width=30% style="padding-top: 20px; font-size: 13px;">우편번호</th>
	         <td width=70% class="inline">
	         <input class="join-id" type="text" name=post id=post  style="width: 20%" value="${vo.post }" readonly>
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
	         <input class="join-id" type="text" name=addr2 id=addr2 style="width: 60%" value="${vo.addr2 }" readonly>
	         </td>
	        </tr>
	        
	        <tr>
	          <td colspan=2 style="text-align:center">
	           <p style="margin: 0px; display: none" id=updateMsg></p>
	           <a href="editprofile.do" class="join-ok-submit" style="text-decoration: none; font-style: bold">수정하기</a>
	           <!-- <input type=button value="취소" class="btn btn-danger btn-sm" onclick="javascript:history.back()"> -->
	          </td>
	        </tr>
	      </table>
	    </div>
    </div>
    <div class="col-sm-1 col-md-1" ></div>
    
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">

</script>
    