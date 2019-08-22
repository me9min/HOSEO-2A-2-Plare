<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>회원가입</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="/assets/css/main.css" />
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	</head>
	<body class="subpage">

		<!-- Header -->
			<header id="header">
				<div class="logo"><a href="/">plare.cf <span>host by BSM</span></a></div>
				<a href="#menu">메뉴</a>
			</header>

		<!-- Nav -->
			<nav id="menu">
				<ul class="links">
					<li><a href="/">홈</a></li>
					<li><a href="/guide">게임소개/가이드</a></li>
					<li><a href="/rank">랭크</a></li>
					<li><a href="/shop">상점</a></li>
					<li><a href="/list">게시판</a></li>
					<li><a href="/member/login">로그인/회원가입</a></li>
					<li><a href="http://bigstar131.myds.me/sb">소스밴 <span class="glyphicon glyphicon-new-window"></span></a></li>
				</ul>
			</nav>

		<!-- main -->
			<section id="two" class="wrapper style2">
				<div class="inner">
					<div class="box">
						<div class="content">
							<header class="align-center">
								<p>다양한 서버기능 이용</p>
								<h2>회원가입</h2>
							</header>
<form method="post" action="db_register.jsp" name="register">
	<div class="row uniform">
		
		<div class="12u$ 12u$(xsmall)">
			<input type="text" name="email" id="email" value="" placeholder="이메일" />
		</div>
		
		<div class="12u$ 12u$(xsmall)">
			<input type="text" name="name" id="name" value="" placeholder="닉네임" />
		</div>
		
		<div class="12u 12u$(xsmall)">
			<input type="password" name="pw" id="pw" value="" placeholder="비밀번호" />
		</div>
		
		<div class="12u$ 12u$(xsmall)">
			<input type="password" name="pwc" id="pwc" value="" placeholder="비밀번호 확인" />
		</div>
		
		<div class="12u$ 12u$(xsmall)">
			<input type="password" name="phone" id="phone" value="" placeholder="휴대전화번호" />
		</div>
		
		<div class="12u$ 12u$(xsmall)">
			<input type="password" name="zipcode" id="zipcode" value="" placeholder="주소" />
		</div>
		
		<div class="12u$ 12u$(xsmall)">
			<input type="text" name="referrer" id="referrer" value="" placeholder="추천인 아이디" />
		</div>
		
	</div>
</form>
<ul class="actions">
	<li><a href="#" class="button special">만들기</a></li>
	<li><a href="../login" class="button alt">그냥 로그인 하기</a></li>
</ul>
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
			<script src="/assets/js/jquery.min.js"></script>
			<script src="/assets/js/jquery.scrollex.min.js"></script>
			<script src="/assets/js/skel.min.js"></script>
			<script src="/assets/js/util.js"></script>
			<script src="/assets/js/main.js"></script>

	</body>
</html>