<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
    <link rel="stylesheet" href="../css/login.css">
    <script src="../lib/jquery-3.6.0.min.js"></script>
    <style type="text/css">
    @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');

* {
  margin: 0;
  padding: 0;
}

body {
  font-family: 'Noto Sans KR', sans-serif;
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
}

.login-form h1 {
  font-size: 32px;
  text-align: center;
  margin-bottom: 50px;
}

.int-area {
  width: 400px;
  position: relative;
  margin-top: 20px;
}

.int-area:first-child {
  margin-top: 0;
}

.int-area input {
  width: 100%;
  padding: 20px 10px 10px;
  background-color: transparent;
  border: none;
  border-bottom: 1px solid black;
  font-size: 18px;
  outline: none;
}

.int-area label {
  position: absolute;
  left: 10px;
  top: 15px;
  font-size: 18px;
  transition: top 0.5s ease;
}

.int-area label.warning {
  color: red !important;
  animation: warning 0.3s ease;
  animation-iteration-count: 3;
}

@keyframes warning {
  0% {
    transform: translateX(-8px);
  }
  25% {
    transform: translateX(8px);
  }
  50% {
    transform: translateX(-8px);
  }
  75% {
    transform: translateX(8px);
  }
}

.int-area input:focus + label,
.int-area input:valid + label {
  top: -2px;
  font-size: 13px;
  color: #166caa;
}

.btn-area {
  margin-top: 30px;
}

.btn-area #btn {
  width: 100%;
  height: 50px;
  margin: 0px 10px;
  color: #fff;
  background: #166caa;
  border: none;
  border-radius: 20px;
  font-size: 20px;
  cursor: pointer;
}

.btn-area #btn2 {
  width: 100%;
  height: 50px;
  margin: 0px 10px;
  color: #fff;
  background: green;
  border: none;
  border-radius: 20px;
  font-size: 20px;
  cursor: pointer;
}

.caption {
  margin-top: 20px;
  text-align: center;
}

.caption a {
  margin: 0 20px;
  font-size: 15px;
  color: blue;
  text-decoration: none;
}
    </style>
</head>
<body>
    <section class="login-form">
        <h1>Login</h1>
        <form action="">
            <div class="int-area">
                <input type="text" name="id" id="id" autocomplete="off" required>
                <label for="id">아이디 입력</label>
            </div>
            <div class="int-area">
                <input type="password" name="pw" id="pw" autocomplete="off" required>
                <label for="pw">패스워드 입력</label>
            </div>
            <div class="btn-area">
                <button id="btn" type="submit">LOGIN</button>
            </div>
            <div class="btn-area">
                <button id="btn2" type="submit">회원가입</button>
            </div>
           
        </form>
        <div class="caption">
            <a href="">아이디 찾기</a>
            <a href="">패스워드 찾기</a>
        </div>
    </section>

    <script>       
        let id = $('#id');
        let pw = $('#pw');
        let btn = $('#btn');
        
        $(btn).on('click', function() {
            if($(id).val() == "") {
                $(id).next('label').addClass('warning');
                setTimeout(function() {
                    $('label').removeClass('warning');
                }, 1500);
            }
            else if($(pw).val() == "") {
                $(pw).next('label').addClass('warning');
                setTimeout(function() {
                    $('label').removeClass('warning');
                }, 1500);
            }
        });
    </script>           
</body>
</html>