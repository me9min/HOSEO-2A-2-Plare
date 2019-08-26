<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>아이디/비밀번호 찾기</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="../../assets/css/main.css" href="login.css"/>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<script type="text/javascript" src="../login/login.js"></script>
	</head>
	<body class="subpage">

		<!-- Header -->
			<header id="header">
				<div class="logo"><a href="../../">plare.cf <span>host by BSM</span></a></div>
				<a href="#menu">메뉴</a>
			</header>

		<!-- Nav -->
			<nav id="menu">
				<ul class="links">
					<li><a href="../../">홈</a></li>
					<li><a href="../../guide">게임소개/가이드</a></li>
					<li><a href="../../rank">랭크</a></li>
					<li><a href="../../shop">상점</a></li>
					<li><a href="../../list">게시판</a></li>
					<li><a href="http://bigstar131.myds.me/sb">소스밴 <span class="glyphicon glyphicon-new-window"></span></a></li>
				</ul>
			</nav>
			
		<!-- One -->
			<section id="One" class="wrapper style3">
				<div class="inner">
					<header class="align-center">
						<p>아이디(이메일) 또는 비밀번호 찾기</p>
						<h2>아이디/비밀번호 찾기</h2>
					</header>
				</div>
			</section>
			
		<!-- main -->
			<section id="two" class="wrapper style2">
				<div class="inner">
					<div class="box">
						<div class="content">
							<header class="align-center">
								<h2>이메일 찾기</h2>
							</header>
<form method="post" action="db_member_find.jsp" name="find">
	<div class="row uniform"><br>
		<div class="4u 12u$(xsmall)" align="right">
			  전화번호
		</div>
		<div class="6u 12u$(xsmall)">
			<input type="text" name="phone" id="email" value="" placeholder="전화번호 -없이" />
		</div><br><br><br>
		<div class="4u 12u$(xsmall)" align="right">
			  인증번호
		</div>
		<div class="6u 12u$(xsmall)">
			<input type="text" name="code" id="code" value="" placeholder="인증번호 입력" />
		</div><br><br>
		<div class="4u 12u$(xsmall)" align="right">
			  <div id="cattery" style="visibility:hidden;">내용</div>
		</div>
		<div class="3u 12u$(xsmall)">
			<input type="button" class="button alt" value="비밀번호 찾기" />
		</div>
		<div class="0.5u 12u$(xsmall)" align="right">
			  <div id="cattery" style="visibility:hidden;">내용</div>
		</div>
		<div class="3u 12u$(xsmall)">
			<input type="button" class="button alt" value="인증번호 확인" />
		</div><br>


</form>
						</div>
					</div>
				</div>
			</section>

		<!-- Footer -->
			<footer id="footer">
				<div class="container">
					<ul class="icons">
						<li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
						<li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
						<li><a href="#" class="icon fa-instagram"><span class="label">Instagram</span></a></li>
						<li><a href="#" class="icon fa-envelope-o"><span class="label">Email</span></a></li>
					</ul>
				</div>
				<a href="https://templated.co/hielo">TEMPLATED by Hielo</a>
				<div class="copyright">
					&copy; Untitled. All rights reserved.
				</div>
			</footer>

		<!-- Scripts -->
			<script src="../../assets/js/jquery.min.js"></script>
			<script src="../../assets/js/jquery.scrollex.min.js"></script>
			<script src="../../assets/js/skel.min.js"></script>
			<script src="../../assets/js/util.js"></script>
			<script src="../../assets/js/main.js"></script>

	</body>
</html>