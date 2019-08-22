<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>랭크</title>
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
					<li><a href="../member/login">로그인/회원가입</a></li>
					<li><a href="http://bigstar131.myds.me/sb">소스밴 <span class="glyphicon glyphicon-new-window"></span></a></li>
				</ul>
			</nav>

		<!-- One -->
			<section id="One" class="wrapper style3">
				<div class="inner">
					<header class="align-center">
						<p>현재 플레이어들의 점수를 실시간으로 확인합니다</p>
						<h2>랭크</h2>
					</header>
				</div>
			</section>

<div id="main" class="container">
	<div class="table-wrapper">
<%
	$po=1;
%>
		<div class="row uniform">
			<div class="9u 12u$(small)">
				<input type="text" name="query" id="query" value="" placeholder="닉네임,스팀고유번호 로 검색" />
			</div>
			<div class="3u$ 12u$(small)">
				<input type="submit" value="Search" class="fit" />
			</div>
		</div>

		<table class="table table-hover">
			<thead>
				<tr>
					<th>순위</th>
					<th>닉네임</th>
					<th>스팀고유번호</th>
					<th>점수</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><%=rank %></td>
					<td></td>
					<td>STEAM_1:1:52589830</td>
					<td>1999</td>
				</tr>
				<tr>
					<td>2</td>
					<td>Salong</td>
					<td>STEAM_0:1:4318672</td>
					<td>1347</td>
				</tr>
				<tr>
					<td>3</td>
					<td>tah</td>
					<td>STEAM_0:0:3356981</td>
					<td>326</td>
				</tr>
				<tr>
					<td>4</td>
					<td>oh</td>
					<td>STEAM_0:0:0001002</td>
					<td>0</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="5">
					<center>
						<ul class="actions">
							<li><a href="#" class="button alt">1</a></li>
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