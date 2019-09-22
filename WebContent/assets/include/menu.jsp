<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<link rel="stylesheet" href="/assets/css/main.css" />
	<!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<!-- 부가적인 테마 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!-- 부가적인 테마 -->
	<link rel="stylesheet" type="text/css" href="menu.css">
</head>
<body>
	
	<div id="box">
	<img src="img/plare.png" width="95px" height="42px" id="plare_logo">
	<ul id="menu">
	<li><a class="menuLink" href="#">회원서비스</a>
	<ul id="dropmenu">
<%
request.setCharacterEncoding("utf-8");
String email = (String)session.getAttribute("email");
if(email == null) {
%>
	<li><a href="/member/find">아이디/비밀번호찾기</a></li>
	<li><a href="/member/login">로그인/회원가입</a></li>
<%
} else {
%>
	<li><a href="/member/logout">로그아웃</a></li>
	<li><a href="/member">내정보</a></li>
<%
}
%>
	</ul></li>
		<li><a href="#">게시판</a>
		<ul id="dropmenu">
			<li><a href="board/free">공지사항</a></li>
			<li><a href="/board/motd">자유게시판</a></li>
			<li><a href="/board/issue">문의/신고게시판</a></li>
		</ul></li>
			<li><a href="/shop">상점</a></li>
			<li><a href="/rank">랭크</a></li>
			<li><a href="/guide">게임소개</a></li>
	</ul>
	</div>
