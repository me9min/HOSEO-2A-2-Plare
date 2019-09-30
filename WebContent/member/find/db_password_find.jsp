<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, Bean.*" %>
<jsp:useBean id="member" class="Bean.Member" />
<%
	request.setCharacterEncoding("UTF-8");
	
	String email = request.getParameter("email");
	String phone = request.getParameter("phone");
	
	String password = member.find_password(email);
%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>아이디/비밀번호 찾기</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="../../assets/css/main.css" />
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<script language="JavaScript" src="./find.js"></script>
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
					<li><a href="../logout">로그아웃</a></li>
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
								<h2>비밀번호 찾기</h2>
							</header>
	<div class="row uniform">
		<div class="12u 12u$(xsmall)">
		<center>
<%
		if(password == null) {
%>
			<p>해당되는 회원 정보가 없습니다. 다시 시도해주세요.</p>
		</center>
		</div>
		<div class="12u 12u$(xsmall)">
		<center>
			<a href="password_find.jsp" class="button alt">돌아가기</a>
		</center>
		</div>
<%
		} else {
%>
			<p>회원님의 비밀번호는 <%=password %>입니다.</p>
		</center>
		</div>
		<div class="12u 12u$(xsmall)">
		<center>
			<a href="../login/" class="button alt">로그인</a>
		</center>
		</div>
<%
		}
%>
		</center>
		
	</div>
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