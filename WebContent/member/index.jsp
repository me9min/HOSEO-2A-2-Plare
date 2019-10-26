<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/assets/include/login_check.jsp" %>
<!DOCTYPE HTML>
<html>
	<head>
		<title>프로필</title>
		<style type="text/css">
			.px-180{font-size: 180px;}
			#member_menu:link{color:gray !important;text-decoration:none !important}
			#member_menu:visited{color:gray !important;text-decoration:none !important}
			#member_menu:hover{color:red !important;text-decoration:none !important;}
			#member_menu:active{color:red !important;text-decoration:none !important}
		</style>
<%@ include file="/assets/include/menu_member.jsp" %>
<%@ include file="/assets/include/member_top.jsp" %>
			<section id="one" class="wrapper style2">
				<div class="inner">
					<div class="grid-style" style="padding:50px !important; ">

						<div>
						<a id="member_menu" href="edit/password_check.jsp">
							<div class="box">
								<div class="content">
									<header class="align-center">
										<span class="glyphicon glyphicon-pencil px-180"></span>
									</header>
									<footer class="align-center">
										<h3>내 정보 수정</h3>
									</footer>
								</div>
							</div>
						</a>
						</div>

						<div>
						<a id="member_menu" href="wallet/">
							<div class="box">
								<div class="content">
									<header class="align-center">
										<span class="glyphicon glyphicon-credit-card px-180"></span>
									</header>
									<footer class="align-center">
										<h3>내 지갑</h3>
									</footer>
								</div>
							</div>
						</a>
						</div>
						
						
						<div>
						<a id="member_menu" href="cart/">
							<div class="box">
								<div class="content">
									<header class="align-center">
										<span class="glyphicon glyphicon-shopping-cart px-180"></span>
									</header>
									<footer class="align-center">
										<h3>장바구니</h3>
									</footer>
								</div>
							</div>
						</a>
						</div>
						
						<div>
						<a id="member_menu" href="inventory/">
							<div class="box">
								<div class="content">
									<header class="align-center">
										<span class="glyphicon glyphicon-inbox px-180"></span>
									</header>
									<footer class="align-center">
										<h3>인벤토리</h3>
									</footer>
								</div>
							</div>
						</a>
						</div>

					</div>
				</div>
			</section>

<%@ include file="/assets/include/foot.jsp" %>

</html>