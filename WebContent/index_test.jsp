<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>plare.cf</title>
		<meta charset="utf-8" />
<%@ include file="/assets/include/menu.jsp" %>

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

		<!-- One -->
			<section id="one" class="wrapper style2">
				<div class="inner">
					<div class="grid-style">
<%
	int i = 0;
	while(i<10) {
		i++;
%>
						<div>
							<div class="box">
								<div class="image fit">
									<img src="assets/images/pic03.jpg" alt="" />
								</div>
								<div class="content">
									<header class="align-center">
										<p>admin</p>
										<h2>글 테스트</h2>
									</header>
									<p>테스트인데요</p>
									<footer class="align-center">
										<a href="#" class="button alt">더 보기</a>
									</footer>
								</div>
							</div>
						</div>
<%
	}
%>
					</div>
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