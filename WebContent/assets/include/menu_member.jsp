<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<meta charset="utf-8" />
	<%-- <meta name="viewport" content="width=device-width, initial-scale=1" />--%>
	<link rel="stylesheet" href="/assets/css/main.css" />
	<!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<!-- 부가적인 테마 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
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
		<li><a href="/board/free">자유게시판</a></li>
		<li><a href="/board/motd">공지사항</a></li>
		<li><a href="/board/issue">문의게시판</a></li>
<%
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