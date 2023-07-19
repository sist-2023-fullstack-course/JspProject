<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="page-title">마이펫 등록하기</div>
    <div class="col-sm-1 col-md-1"></div>
    <div class="col-sm-10 col-md-10">
    	<div class="row">
	      <table class="myinfo table">
	        <tr>
	        <%-- INSERT INTO pet VALUES(pm_pti_seq.nextval,'고양이','참깨','남','2016','6','y','jolie'); 
	private int pid,birthyear;
	private String,neutered,uid,weight;
	         --%>
	         <th class="text-center" width=30% style="padding-top: 20px">펫종류</th>
	         <td width=70% class="inline">
	          <input class="join-id" type="text" name=id id=id readonly value="${vo.category }">&nbsp;
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
	          <input type="radio" name=gender id=gender value="남아" ${vo.gender=='남아'?"checked":"" } onclick="return false;"> 남아 
	          <input type="radio" name=gender id=gender value="여아" ${vo.gender=='여아'?"checked":"" } onclick="return false;"> 여아
	         </td>
	        </tr>

	        <tr>
	         <th class="text-center" width=30% style="padding-top: 20px;">중성화여부</th>
	         <td width=70% class="inline" style="padding-top: 15px">
	         &nbsp;&nbsp;
	          <input type="radio" name=gender id=gender value="네" ${vo.gender=='네'?"checked":"" } onclick="return false;"> 네 
	          <input type="radio" name=gender id=gender value="아니요" ${vo.gender=='아니요'?"checked":"" } onclick="return false;"> 아니요
	         </td>
	        </tr>
	        
	        <tr>
	         <th class="text-center" width=30% style="padding-top: 20px; font-size: 13px;" >태어난 년도</th>
	         <td width=70% class="inline" style="padding-top:15px">
	          &nbsp;&nbsp;
	          <input type="date" name=birthday id=birthday size=20 value="${vo.birthyear }">
	         </td>
	        </tr>
	       
	        
	        <tr>
	         <th class="text-center" width=30% style="padding-top: 20px; font-size: 13px;">몸무게</th>
	         <td width=70% class="inline">
	          <input class="join-id" type="text" name=phone id=phone  style="width: 40%" value="">
	           &nbsp;<p id="phoneMsg" style="color: red; display: none"></p> 
	         </td>
	        </tr> 
	        
	        <tr>
	         <th class="text-center" width=30% style="padding-top: 20px">이메일</th>
	         <td width=70% class="inline"> 
	          <input class="join-id" type="text" name=email id=email style="width: 45%" value="${vo.email }">
	           &nbsp;<p id="emailMsg" style="color: red; display: none"></p> 
	         </td>
	        </tr>
	        
	        <tr>
	         <th class="text-center" width=30% style="padding-top: 20px; font-size: 13px;">우편번호</th>
	         <td width=70% class="inline">
	         <input class="join-id" type="text" name=post id=post  style="width: 20%" value="" readonly>
	         </td>
	        </tr>
	        
	        <tr>
	         <th class="text-center" width=30% style="padding-top: 20px">주소</th>
	         <td width=70% class="inline">
	         <input class="join-id" type="text" name=addr1 id=addr1 style="width: 60%" value="" readonly>
	         </td>
	        </tr>
	        
	        <tr>
	         <th class="text-center" width=30% style="padding-top: 20px; font-size: 13px;" >상세주소</th>
	         <td width=70% class="inline">
	         <input class="join-id" type="text" name=addr2 id=addr2 style="width: 60%" value="">
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
	           <span class="join-ok-submit updates" style="text-decoration: none; font-style: bold">등록하기</span>
	           <!-- <input type=button value="취소" class="btn btn-danger btn-sm" onclick="javascript:history.back()"> -->
	          </td>
	        </tr>
	      </table>
	    </div>
    </div>
    <div id="dialog" title="중복체크" style="display: none"></div>
    <div class="col-sm-1 col-md-1" ></div>