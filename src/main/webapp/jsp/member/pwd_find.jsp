<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<body>
<main class="container clear"> 
 <div class="find-main-pwd">
  <p class="find-sign" align="center" style="padding-bottom: 40px; padding-top: 90px;">비밀번호 찾기</p>

<div class="find_tabs" style="margin: 0px 140px;">

  <input type="radio" name="tabs" id="tabone" checked="checked">
  <label for="tabone">이메일로 찾기</label>
  <div class="tab">
  <dl>
   <dt>
     <dd class="inline">
 		아이디&nbsp;<input class="find-input" type="text" align="center" name=id id=id1>
 		<p></p>
 		이메일&nbsp;<input class="find-input" type="text" align="center" name=email id=email>
       <span class="find-check" align="center" style="text-decoration: none;" id="pwdfind_emailBtn">검색</span>
     </dd>
   </dt>
   <dt>
     <dd class="text-center">
     <p>
     <p id="pwd_email" style="color: red; font-size: 16px; margin-top: 50px;"></p> 
     </dd>
   </dt>
  </dl>
  </div>
  
  <input type="radio" name="tabs" id="tabtwo">
  <label for="tabtwo">전화번호로 찾기</label>
  <div class="tab">
  <dl>
   <dt>
     <dd class="inline">
 		&nbsp;&nbsp;&nbsp;&nbsp;아이디&nbsp;<input class="find-input" type="text" align="center" name=id id=id2>
 		<p></p>
 		전화번호&nbsp;<input class="find-input" type="text" align="center" name=phone id=phone>
       <span class="find-check" align="center" style="text-decoration: none;" id="pwdfind_phoneBtn">검색</span>
     </dd>
   </dt>
   <dt>
     <dd class="text-center">
     <p>
     <p id="pwd_phone" style="color: red; font-size: 16px; margin-top: 50px;"></p> 
     </dd>
   </dt>
  </dl>
  </div>
</div>
 	  	</main>
	  </div>
</body>