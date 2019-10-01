<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, Bean.*" %>
<jsp:useBean id="member" class="Bean.Member"/>
<%
	request.setCharacterEncoding("UTF-8");
	String nickname = request.getParameter("nickname");
	boolean nickname_check = member.email_double_check(nickname);
%>
<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
		<title>닉네임 변경</title>
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="../../assets/css/main.css" />
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<script language="JavaScript" src="edit.js"></script>
</head>
<body>
<section id="two" class="wrapper style2">
				<div class="inner">
					<div class="box">
						<div class="content">
							<header class="align-center">
								<p>닉네임을 변경할 수 있습니다.</p>
								<h2>닉네임 변경</h2><br>
							</header>
	<center>
	<form method="post" action="db_nickname_change.jsp" name="change">
	  <div class="row uniform">
		<div class="3u 12u$(xsmall)" style="visibility:hidden;"> 빈공간</div>
		<div class="6u 12u$(xsmall)">
			<input type="text" name="nickname" id="nickname" value="" placeholder="변경할 닉네임  20자 이하, 특수문자 가능" />
		</div>
		<div>
			<a href="#" class="button alt" onclick="nicknameDoubleCheck()">중복확인</a>
			<br><br>
		</div>
	  </div>
	</form>
	</center>
					</div>
				</div>
			</section>
</body>
</html>
