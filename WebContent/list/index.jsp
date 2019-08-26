<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>게시판</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="../assets/css/main.css" />
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	</head>
	<body class="subpage">

		<!-- Header -->
			<header id="header">
				<div class="logo"><a href="../">plare.cf <span>host by BSM</span></a></div>
				<a href="#menu">메뉴</a>
			</header>

		<!-- Nav -->
			<nav id="menu">
				<ul class="links">
					<li><a href="../">홈</a></li>
					<li><a href="../guide">게임소개/가이드</a></li>
					<li><a href="../rank">랭크</a></li>
					<li><a href="../shop">상점</a></li>
					<li><a href="../list">게시판</a></li>
<%
	String email = (String)session.getAttribute("email");
	if(email == null) {
%>
					<li><a href="../member/login">로그인/회원가입</a></li>
<%
	} else {
%>
					<li><a href="../member">내정보</a></li>
					<li><a href="../member/login">로그아웃</a></li>
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
						<p>게시글을 올리는 커뮤니티입니다</p>
						<h2>게시판</h2>
					</header>
				</div>
			</section>

<div id="main" class="container">
	<div class="table-wrapper">
		<a href="#" class="button alt pull-right">글쓰기</a>
		<caption>자유게시판</caption>
		<table class="table table-hover">
			<thead>
				<tr>
					<th>번호</th>
					<th>작성자</th>
					<th>제목</th>
					<th>작성일자</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>4</td>
					<td>admin</td>
					<td>[블로그] 스토리보드 member(+내정보)</td>
					<td>2019/8/13</td>
					<td>3</td>
				</tr>
				<tr>
					<td>3</td>
					<td>admin</td>
					<td>[블로그] 스토리보드 member</td>
					<td>2019/8/12</td>
					<td>3</td>
				</tr>
				<tr>
					<td>2</td>
					<td>admin</td>
					<td>[블로그] 스토리보드 메인(index)</td>
					<td>2019/8/7</td>
					<td>1</td>
				</tr>
				<tr>
					<td>1</td>
					<td>admin</td>
					<td>[블로그] 홈페이지 디자인 견적</td>
					<td>2019/7/30</td>
					<td>0</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="5">
					<center>
						<ul class="actions">
							<li><a href="#" class="button alt">1</a></li>
							<li><a href="#" class="button alt">2</a></li>
						</ul>
					</center>
					</td>
				</tr>
			</tfoot>
		</table>
	</div>
</div>

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
			<script src="../assets/js/jquery.min.js"></script>
			<script src="../assets/js/jquery.scrollex.min.js"></script>
			<script src="../assets/js/skel.min.js"></script>
			<script src="../assets/js/util.js"></script>
			<script src="../assets/js/main.js"></script>

	</body>
</html>