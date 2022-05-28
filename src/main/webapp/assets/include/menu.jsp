<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Bean.Board" %>

	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<link rel="stylesheet" href="/assets/css/main.css" />
	<link rel="stylesheet" href="/assets/css/menu.css" />
	
	<!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<!-- 부가적인 테마 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<script>
		function logout() {
			if (confirm("로그아웃 하시겠습니까?") == true){
				location.href = "/member/logout";
			} else {
				return;
			}
		}
	</script>

</head>

<body>

<div id="menubox">
	<a href="/"><img src="/assets/images/PlareLogo.jpg" width="88px" height="42px" id="plare_logo"></a>
	<ul id="menuul">
<%
request.setCharacterEncoding("utf-8");
String email = (String)session.getAttribute("email");
Board bmenu = Board.getInstance();
if(email == null || email.length() == 0) {
%>
		<li><a class="menuLink" href="/member/login/">회원서비스</a>
			<ul id="dropmenu">
				<li><a href="/member/login/">로그인/회원가입</a></li>
				<li><a href="/member/find/">아이디/비밀번호찾기</a></li>
<%
} else {
%>
		<li><a class="menuLink" href="/member/"><%=bmenu.getNickname(email) %> 님</a>
			<ul id="dropmenu">
				<li><a href="/member/">내정보</a></li>
				<li><a href="#" onclick="logout()">로그아웃</a></li>
<%
}
%>
			</ul>
		</li>
		<li><a href="#">게시판</a>
			<ul id="dropmenu">
				<li><a href="/board/motd/">공지사항</a></li>
				<li><a href="/board/event/">이벤트</a></li>
				<li><a href="/board/free/">자유게시판</a></li>
				<li><a href="/board/issue/">문의/신고게시판</a></li>
			</ul>
		</li>
		<li><a href="/shop/">상점</a></li>
		<li><a href="/rank/">랭크</a></li>
		<li><a href="/guide/">게임소개</a></li>
	</ul>
</div>