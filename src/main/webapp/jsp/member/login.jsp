<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
	<meta charset="UTF-8">
	<title>Olongkar | Login & Reg</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- Fav Icon -->
	<link id="favicon" rel="icon" type="image/png" href="../../img/favicon.ico" />
	<!-- Google Font Raleway -->
	<link href='https://fonts.googleapis.com/css?family=Raleway:200,300,500,400,600,700,800' rel='stylesheet' type='text/css'>
	<!-- Google Font Dancing Script -->
	<link href='https://fonts.googleapis.com/css?family=Dancing+Script' rel='stylesheet' type='text/css'>
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" type="text/css" href="../../css/bootstrap.min.css" />
	<!-- Font Awesome CSS -->
	<link rel="stylesheet" type="text/css" href="../../css/font-awesome.min.css" />
	<!-- Owl Carousel CSS -->
	<link rel="stylesheet" type="text/css" href="../../css/owl.carousel.min.css" />
	<!-- Animate CSS -->
	<link rel="stylesheet" type="text/css" href="../../css/animate.min.css" />
	<!-- simpleLens CSS -->
	<link rel="stylesheet" type="text/css" href="../../css/jquery.simpleLens.css" />
	<!-- Price Slider CSS -->
	<link rel="stylesheet" type="text/css" href="../../css/jquery-price-slider.css" />
	<!-- MeanMenu CSS -->
	<link rel="stylesheet" type="text/css" href="../../css/meanmenu.min.css" />
	<!-- Magnific Popup CSS -->
	<link rel="stylesheet" type="text/css" href="../../css/magnific-popup.css" />
	<!-- Nivo Slider CSS -->
	<link rel="stylesheet" type="text/css" href="../../css/nivo-slider.css" />
	<!-- Stylesheet CSS -->
	<link rel="stylesheet" type="text/css" href="../../style.css" />
	<!-- Responsive Stylesheet -->
	<link rel="stylesheet" type="text/css" href="../../css/responsive.css" />
	<!--[if IE]><script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	// 유효성 검사 => 반드시 입력
	$('#loginBtn').click(function(){
		let id=$('#id').val();
		if(id.trim()=="")
		{
			$('#id').focus();
			return;
		}
		
		let pwd=$('#pwd').val();
		if(pwd.trim()=="")
		{
			$('#pwd').focus();
			return;
		}
		
		// 전송 => 실행결과를 가지고 온다 (자체 처리) (요청=응답:Ajax, Vue, React)
		$.ajax({
			type:'post',
			url:'../member/login.do',
			data:{"id":id,"pwd":pwd},
			success:function(result) // NOID, NOPWD, OK
			{
				let res=result.trim();
				if(res==='NOID')
				{
					alert("아이디가 존재하지 않습니다!!")
					$('#id').val("");
					$('#pwd').val("");
					$('#id').focus();
				}
				else if(res==='NOPWD')
				{
					alert("비밀번호가 틀립니다!!")
					$('#pwd').val("");
					$('#pwd').focus();
				}
				else
				{
					location.href="../main/main.do"
				}
			}
		})
	})
})
</script>
</head>
<body>
<!--End Title-->
<div class="login-main">
   <p class="login-sign" align="center" style="padding-bottom: 30px; padding-top: 70px;">로그인</p>
    <form class="form1" style="text-align: center">
      <input class="login-username " type="text" align="center" placeholder="Username" style="margin-bottom: 30px;" id="id">
      <input class="login-password" type="password" align="center" placeholder="Password" id="pwd">
      <a href="" class="login-submit" align="center" style="text-decoration: none;" id="loginBtn">로그인</a>
      <a href="../member/join.do" class="login-to-join-submit" align="center" style="text-decoration: none;">회원가입</a>
      <div class="login-find">
        <a href="">아이디 찾기</a>
        <a href="">패스워드 찾기</a>
      </div>
    </form>
</div>
<!-- jQuery 2.1.4 -->
<script type="text/javascript" src="../../js/jquery-2.1.4.min.js"></script>
<!-- Bootstrap JS -->
<script type="text/javascript" src="../../js/bootstrap.min.js"></script>
<!-- Owl Carousel JS -->
<script type="text/javascript" src="../../js/owl.carousel.min.js"></script>
<!--countTo JS -->
<script type="text/javascript" src="../../js/jquery.countTo.js"></script>
<!-- mixitup JS -->
<script type="text/javascript" src="../../js/jquery.mixitup.min.js"></script>
<!-- magnific popup JS -->
<script type="text/javascript" src="../../js/jquery.magnific-popup.min.js"></script>
<!-- Appear JS -->
<script type="text/javascript" src="../../js/jquery.appear.js"></script>
<!-- MeanMenu JS -->
<script type="text/javascript" src="../../js/jquery.meanmenu.min.js"></script>
<!-- Nivo Slider JS -->
<script type="text/javascript" src="../../js/jquery.nivo.slider.pack.js"></script>
<!-- Scrollup JS -->
<script type="text/javascript" src="../../js/jquery.scrollup.min.js"></script>
<!-- simpleLens JS -->
<script type="text/javascript" src="../../js/jquery.simpleLens.min.js"></script>
<!-- Price Slider JS -->
<script type="text/javascript" src="../../js/jquery-price-slider.js"></script>
<!-- WOW JS -->
<script type="text/javascript" src="../../js/wow.min.js"></script>
<script>
	new WOW().init();
</script>	
<!-- Main JS -->
<script type="text/javascript" src="../../js/main.js"></script>

</body>

</html>