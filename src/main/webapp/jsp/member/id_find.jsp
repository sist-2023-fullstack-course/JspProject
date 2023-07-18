<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<body>
<main class="container clear"> 
 <div class="find-main">
  <p class="find-sign" align="center" style="padding-bottom: 40px; padding-top: 90px;">아이디 찾기</p>

  <div class="find_tabs" style="margin: 0px 100px;">

  <input type="radio" name="tabs" id="tabone" checked="checked">
  <label for="tabone">이메일로 찾기</label>
  <div class="tab">
  <dl>
     <dd>
 		<span class="find-info">이메일</span>
 		<input class="find-input" type="text" name=email id=email>
       <span class="find-check" style="text-decoration: none;" id="idfind_emailBtn">검색</span>
     </dd>
     <dd class="text-center">
     <p>
     <p id="id_email" style="color: red; font-size: 16px; margin-top: 50px;"></p> 
     </dd>
  </dl>
  </div>
  
  <input type="radio" name="tabs" id="tabtwo">
  <label for="tabtwo">전화번호로 찾기</label>
  <div class="tab">
  <dl>
      <dd>
		<span class="find-info">전화번호</span>
		<input class="find-input" type="text" name=phone id=phone>
        <span class="find-check" style="text-decoration: none;" id="idfind_phoneBtn">검색</span>
      </dd>
      <dd class="text-center">
      	<p>
      	<p id="id_phone" style="color: red; font-size: 16px; margin-top: 50px;"></p> 
      </dd>
  </dl>
  </div>
  
  </div>
  
 </div>
</main>
</body>