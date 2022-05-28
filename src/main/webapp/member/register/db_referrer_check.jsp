<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, Bean.*" %>
<jsp:useBean id="member" class="Bean.Member"/>
<%
	request.setCharacterEncoding("UTF-8");
	String referrer = request.getParameter("referrer");
	String referrer_sql = member.search_referrer(referrer);
%>
<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
		<title>이메일 중복 확인</title>
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="../../assets/css/main.css" />
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<script language="JavaScript" src="register.js"></script>
		<script>
			function autoInput(referrer) {
				var referrer_value = referrer;
				window.opener.register.referrer.value = referrer_value;
				window.opener.register.referrer_check.value = "true";
				window.close();
			}
			
			function autoReset() {
				window.opener.register.referrer.value = "";
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
								<h2>추천인 확인</h2>
							</header>
	<center>
	<div class="row uniform">
<%
	if(referrer_sql != null) {
%>
		<div class="12u 12u$(xsmall)">
			<p>입력하신 추천인의 이메일은 <%=referrer_sql %> 입니다. 맞으시다면 확인 버튼을 눌러주세요.</p>
		</div>

		<div class="12u$ 12u$(xsmall)">
			<a href="#" class="button alt" onclick="autoInput('<%=referrer %>')">확인</a>
			<a href="#" class="button alt" onclick="autoReset()">닫기</a>
		</div>
<%
	} else {
%>
		<div class="12u 12u$(xsmall)">
			<p>입력하신 닉네임에 해당하는 사용자가 없습니다. 창을 닫고 다시 시도해주세요.</p>
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