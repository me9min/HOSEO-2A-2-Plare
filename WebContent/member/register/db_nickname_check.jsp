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
		<title>이메일 중복 확인</title>
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="../../assets/css/main.css" />
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<script language="JavaScript" src="./register.js"></script>
		<script>
			function autoInput(nickname) {
				var nickname_value = nickname;
				window.opener.register.nickname.value = nickname_value;
				window.opener.register.nickname_check.value = "true";
				window.close();
			}
			
			function autoReset() {
				window.opener.register.nickname.value = "";
				window.close();
			}
		</script>
</head>
<body>
<section id="two" class="wrapper style2">
				<div class="inner">
					<div class="box">
						<div class="content">
							<header class="align-center">
								<p>더 많은 기능이용</p>
								<h2>이메일 중복 확인</h2>
							</header>
	<center>
	<div class="row uniform">
<%
	if(nickname_check == true) {
%>
		<div class="12u 12u$(xsmall)">
			<p>사용 가능한 닉네임입니다. 확인 버튼을 눌러주세요.</p>
		</div>

		<div class="12u$ 12u$(xsmall)">
			<a href="#" class="button alt" onclick="autoInput('<%=nickname %>')">확인</a>
		</div>
<%
	} else {
%>
		<div class="12u 12u$(xsmall)">
			<p>이미 사용 중인 닉네임입니다. 창을 닫고 다른 닉네임을 입력하여 다시 시도해주세요.</p>
		</div>

		<div class="12u$ 12u$(xsmall)">
			<a href="#" class="button alt" onclick="autoReset()">닫기</a>
		</div>
<%
	}
%>
	</div>
	</center>
						</div>
					</div>
				</div>
			</section>
</body>
</html>