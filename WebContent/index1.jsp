<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>plare.cf</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	</head>
	<body>

<header id="header" class="navbar navbar-inverse">
	<div class="logo"><a href="/">plare.cf <span>host by BSM</span></a></div>
	
	<div class="container-fluid">
		<ul class="nav navbar-nav">
			
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

<%@ include file="/assets/include/menu_index.jsp" %>

		<!-- Banner -->
			<section class="banner full">
				<article>
					<img src="assets/images/main.jpg" alt="" />
					<div class="inner">
						<header>
						</header>
					</div>
				</article>
				<article>
					<img src="assets/images/gasstation.jpg" alt="" />
					<div class="inner">
						<header>
							<h2>새로운맵!</h2>
						</header>
					</div>
				</article>
				<article>
					<img src="assets/images/m4.jpg"  alt="" />
					<div class="inner">
						<header>
							<h2>새로운무기!</h2>
						</header>
					</div>
				</article>
			</section>

<%@ include file="/assets/include/foot.jsp" %>

</html>