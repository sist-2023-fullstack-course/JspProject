<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<body>
<!--End Title-->
<div class="login-main">
   <p class="login-sign" align="center" style="padding-bottom: 30px; padding-top: 70px;">로그인</p>
    <form class="form1" style="text-align: center">
      <input class="login-username " type="text" align="center" placeholder="Username" style="margin-bottom: 30px;" id="idInput">
      <input class="login-password" type="password" align="center" placeholder="Password" id="pwdInput">
      <p id="loginMsg" style="color: red; display: none"></p> 
      <span class="login-submit" align="center" style="text-decoration: none;" id="loginBtn">로그인</span>
      <a href="../member/join.do" class="login-to-join-submit" align="center" style="text-decoration: none;">회원가입</a>
      <div class="login-find">
        <a href="../member/id_find.do">아이디 찾기</a>
        <a href="../member/pwd_find.do">패스워드 찾기</a>
      </div>
    </form>
</div>