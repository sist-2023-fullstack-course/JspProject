<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<body>
<main class="container clear"> 
 <div class="find-main-pwd">
  <p class="find-sign" align="center" style="padding-bottom: 40px; padding-top: 90px;">비밀번호 찾기</p>

<div class="find_tabs" style="margin: 0px 100px;">

  <input type="radio" name="tabs" id="tabone" checked="checked">
  <label for="tabone">이메일로 찾기</label>
  <div class="tab">
   <dl>
     <dt>
 		<span class="find-info">아이디</span>
 		<input class="find-input" type="text" name=id id=id1>
 	 </dt>
   </dl>
   <dl>
     <dt>
 		<span class="find-info">이메일</span>
 		<input class="find-input" type="text" name=email id=email>
	   <span class="find-check" style="text-decoration: none;" id="pwdfind_emailBtn">검색</span>
 	 </dt>
   </dl>
   <p id="pwd_email" class="findMsg"></p> 
  </div>
  
  <input type="radio" name="tabs" id="tabtwo">
  <label for="tabtwo">전화번호로 찾기</label>
  <div class="tab">
   <dl>
     <dt>
 		<span class="find-info">아이디</span>
 		<input class="find-input" type="text" name=id id=id2>
     </dt>
    </dl>
    <dl>
     <dt>
 		<span class="find-info">전화번호</span>
 		<input class="find-input" type="text" name=phone id=phone>
       <span class="find-check" style="text-decoration: none;" id="pwdfind_phoneBtn">검색</span>
     </dt>
   </dl>
   <p id="pwd_phone" class="findMsg"></p> 
  </div>
</div>
</div>
</main>
</body>