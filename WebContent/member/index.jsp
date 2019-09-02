<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>프로필</title>
		<style type="text/css">
			.px-200{font-size: 200px;}
		</style>
<%@ include file="/assets/include/login_check.jsp" %>
<%@ include file="/assets/include/menu_member.jsp" %>

		<!-- Main -->
			<section id="one" class="wrapper style2">
				<div class="inner">
					<div class="grid-style">

						<div>
							<div class="box" onclick="window.location.replace('edit/password_check.jsp');">
								<div class="content">
									<header class="align-center">
										<span class="glyphicon glyphicon-pencil px-200"></span>
									</header>
									<footer class="align-center">
										<h3>내 정보 수정</h3>
									</footer>
								</div>
							</div>
						</div>

						<div>
							<div class="box">
								<div class="content">
									<header class="align-center">
										<span class="glyphicon glyphicon-usd px-200"></span>
									</header>
									<footer class="align-center">
										<h3>내 지갑</h3>
									</footer>
								</div>
							</div>
						</div>
						
						<div>
							<div class="box">
								<div class="content">
									<header class="align-center">
										<span class="glyphicon glyphicon-credit-card px-200"></span>
									</header>
									<footer class="align-center">
										<h3>결제</h3>
									</footer>
								</div>
							</div>
						</div>
						
						<div>
							<div class="box">
								<div class="content">
									<header class="align-center">
										<span class="glyphicon glyphicon-inbox px-200"></span>
									</header>
									<footer class="align-center">
										<h3>인벤토리</h3>
									</footer>
								</div>
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
			<script src="../assets/js/jquery.min.js"></script>
			<script src="../assets/js/jquery.scrollex.min.js"></script>
			<script src="../assets/js/skel.min.js"></script>
			<script src="../assets/js/util.js"></script>
			<script src="../assets/js/main.js"></script>

	</body>
</html>