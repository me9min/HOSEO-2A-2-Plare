<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/assets/include/login_check.jsp" %>
<!DOCTYPE HTML>
<html>
	<head>
		<title>프로필</title>
		<style type="text/css">
			.px-200{font-size: 200px;}
		</style>
<%@ include file="/assets/include/menu_member.jsp" %>
<%@ include file="/assets/include/member_top.jsp" %>
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

<%@ include file="/assets/include/foot.jsp" %>

</html>