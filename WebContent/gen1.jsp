<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>기본 페이지</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="/assets/css/main.css" />
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	</head>
<body class="subpage">


<header id="header" class="navbar navbar-inverse">
	<div class="logo"><a href="/">plare.cf <span>host by BSM</span></a></div>
	
	<div class="container-fluid">
		<ul class="nav navbar-nav centered">
			
			<li class="dropdown">
				<a class="dropdown-toggle" data-toggle="dropdown" href="#">게임소개
				<span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="#">소개</a></li>
					<li><a href="#">가이드</a></li>
					<li><a href="#">맵설명</a></li>
					<li><a href="#">다운로드</a></li>
				</ul>
			</li>
			
			<li class="dropdown">
				<a class="dropdown-toggle" data-toggle="dropdown" href="#">게시판
				<span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="#">공지</a></li>
					<li><a href="#">자유 게시판</a></li>
					<li><a href="#">신고 게시판</a></li>
					<li><a href="#">버그/건의 게시판</a></li>
				</ul>
			</li>
			
			<li><a href="#">랭크</a></li>
			
			<li><a href="#">상점</a></li>
			
			
			
			
			
		</ul>
	</div>
	
	<a href="#menu">메뉴</a>
</header>


<!-- Nav -->
<nav id="menu">
	<ul class="links">
		<li><a href="/">홈</a></li>
		<li><a href="/guide">게임소개/가이드</a></li>
		<li><a href="/rank">랭크</a></li>
		<li><a href="/shop">상점</a></li>
		<li><a href="/board">게시판</a></li>
<%
	request.setCharacterEncoding("utf-8");
	
	String email = (String)session.getAttribute("email");
	if(email == null) {
%>
		<li><a href="/member/login">로그인/회원가입</a></li>
<%
	} else {
%>
		<li><a href="/member">내정보</a></li>
		<li><a href="/member/logout">로그아웃</a></li>
<%
	}
%>
		<li><a href="http://bigstar131.myds.me/sb">소스밴 <span class="glyphicon glyphicon-new-window"></span></a></li>
	</ul>
</nav>

		<!-- One -->
			<section id="One" class="wrapper style3">
				<div class="inner">
					<header class="align-center">
						<p>Generic Page Template</p>
						<h2>기본 페이지 템플릿</h2>
					</header>
				</div>
			</section>

		<!-- Three -->
			<section id="three" class="wrapper style2">
				<div class="inner">
					<header class="align-center">
						<p class="special">게임 스샷들</p>
						<h2>사진관</h2>
					</header>
					<div class="gallery">
						<div>
							<div class="image fit">
								<a href="#"><img src="assets/images/pic01.jpg" alt="" /></a>
							</div>
						</div>
						<div>
							<div class="image fit">
								<a href="#"><img src="assets/images/pic02.jpg" alt="" /></a>
							</div>
						</div>
						<div>
							<div class="image fit">
								<a href="#"><img src="assets/images/pic03.jpg" alt="" /></a>
							</div>
						</div>
						<div>
							<div class="image fit">
								<a href="#"><img src="assets/images/pic04.jpg" alt="" /></a>
							</div>
						</div>
					</div>
				</div>
			</section>

<%@ include file="/assets/include/foot.jsp" %>

</html>