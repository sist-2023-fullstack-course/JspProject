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
	         <td width=70% class="inline" style="padding-top: 15px">
	          <input type=radio name=category id=category >강아지&nbsp;&nbsp;
	          <input type=radio name=category id=category >고양이
	         </td>
	        </tr>
	        
	        <tr>
	         <th class="text-center" width=30% style="padding-top: 20px">이름</th>
	         <td width=70% class="inline">
	         <input class="join-id" type="text" name=pname id=pname style="width:25%">
	         </td>
	        </tr>
	        
	        <tr>
	         <th class="text-center" width=30% style="padding-top: 20px;">성별</th>
	         <td width=70% class="inline" style="padding-top: 15px">
	         &nbsp;&nbsp;
	          <input type="radio" name=gender id=gender> 남아 &nbsp;&nbsp;
	          <input type="radio" name=gender id=gender> 여아
	         </td>
	        </tr>

	        <tr>
	         <th class="text-center" width=30% style="padding-top: 20px;">중성화여부</th>
	         <td width=70% class="inline" style="padding-top: 15px">
	         &nbsp;&nbsp;
	          <input type="radio" name=neutered id=neutered> 네 &nbsp;&nbsp;
	          <input type="radio" name=neutered id=neutered> 아니요
	         </td>
	        </tr>
	        
	        <tr>
	         <th class="text-center" width=30% style="padding-top: 20px; font-size: 13px;" >태어난 년도</th>
	         <td width=70% class="inline" style="padding-top:15px">
	          &nbsp;&nbsp;
	          <input type="date" name=birthyear id=birthyear size=20>
	         </td>
	        </tr>
	       
	        
	        <tr>
	         <th class="text-center" width=30% style="padding-top: 20px; font-size: 13px;">몸무게</th>
	         <td width=70% class="inline">
	          <input class="join-id" type="text" name=weight id=weight  style="width: 20%">
	           &nbsp;kg
	         </td>
	        </tr> 
	        
	        <tr>
	          <td colspan=2 style="text-align:center">
	           <p style="margin: 0px; display: none" id=updateMsg></p>
	           <a href="../mypage/adding_pet.do" class="join-ok-submit updates" style="text-decoration: none; font-style: bold">등록하기</a>
	           <!-- <input type=button value="취소" class="btn btn-danger btn-sm" onclick="javascript:history.back()"> -->
	          </td>
	        </tr>
	      </table>
	    </div>
    </div>
    <div id="dialog" title="중복체크" style="display: none"></div>
    <div class="col-sm-1 col-md-1" ></div>