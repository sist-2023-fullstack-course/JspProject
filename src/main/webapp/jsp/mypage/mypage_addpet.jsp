<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="page-title">마이펫 등록하기</div>
    <div class="col-sm-1 col-md-1"></div>
    <div class="col-sm-10 col-md-10">
    	<div class="row">
    	 <form method=post action="../mypage/adding_pet.do">
	      <table class="myinfo table">
	        <tr>
	         <th class="text-center" width=30% style="padding-top: 20px">펫종류</th>
	         <td width=70% class="inline" style="padding-top: 15px">
	          <input class="radio-btn" type=radio name=category id=dog value="강아지">강아지
	          <input class="radio-btn" type=radio name=category id=cat value="고양이">고양이
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
	          <input class="radio-btn" type="radio" name=gender id=m value="남아">남아
	          <input class="radio-btn" type="radio" name=gender id=f value="여아">여아
	         </td>
	        </tr>

	        <tr>
	         <th class="text-center" width=30% style="padding-top: 20px;">중성화여부</th>
	         <td width=70% class="inline" style="padding-top: 15px">
	         &nbsp;&nbsp;
	          <input class="radio-btn" type="radio" name=neutered value=y>네
	          <input class="radio-btn" type="radio" name=neutered value=n>아니요
	         </td>
	        </tr>
	        
	        <tr>
	         <th class="text-center" width=30% style="padding-top: 20px; font-size: 13px;" >태어난 년도</th>
	         <td width=70% class="inline" style="padding-top:15px">
	          &nbsp;&nbsp;
               <input type="number" id="birthyear" name="birthyear" min="1980" max="2023" placeholder="예: 2010" required> 년
	         </td>
	        </tr>
	       
	        <tr>
	         <th class="text-center" width=30% style="padding-top: 20px; font-size: 13px;">몸무게</th>
	         <td width=70% class="inline">
	          <input class="join-id" type="text" name=weight id=weight style="width: 20%"  placeholder="예: 6.5">
	           &nbsp;kg
	         </td>
	        </tr> 
	        
	        <tr>
	          <td colspan=2 style="text-align:center">
	           <p style="margin: 0px; display: none" id=updateMsg></p>
	           <input type=submit value=등록하기 class="login-submit updates" style="text-decoration: none; font-style: bold">
               <input type=button value="취소" class="login-to-join-submit" onclick="javascript:history.back()">
	          </td>
	        </tr>
	      </table>
	      </form>
	    </div>
    </div>
    <div id="dialog" title="중복체크" style="display: none"></div>
    <div class="col-sm-1 col-md-1" ></div>