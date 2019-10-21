<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/assets/include/logout_check.jsp" %>
<!DOCTYPE HTML>
<html>
	<head>
		<title>로그인</title>
		<script language="JavaScript" src="login.js"></script>
<%@ include file="/assets/include/menu_member.jsp" %>

<%@ include file="/assets/include/member_top.jsp" %>

<%
	String ref_me = request.getRequestURL().toString();
	String ref = request.getHeader("REFERER");
	String rref = request.getParameter("ref");
	if(ref == null) {
		
		if(rref == null) {
			rref = "";
		}
		ref = rref.trim();
	}
	if(ref.contains(ref_me) || ref.contains("db_login.jsp")) {
		ref = "";
	}
%>
	<!-- main -->
	<section id="two" class="wrapper style2">
		<div class="inner">
			<div class="box">
				<div class="content">
					<div style="height:450px;" >
					<div style="height:80px;visibility:hidden;"></div>
					<header class="align-center">
						<h2>로그인</h2>
					</header>

			<form method="post" action="db_login.jsp?ref=<%=ref%>" name="login" onsubmit="return loginCheck()">
				<div class="row uniform">
				     <div class ="3u 12u$(xsmall)" style="visibility:hidden;">빈공간</div>
				     <div class="6u 12u$(xsmall)">
						<input type="text" name="email" id="email" value="" placeholder="아이디/이메일" />
				     </div>
				     <div class="3u 12u$(xsmall)"  style="visibility:hidden;">빈공간</div>
				</div><br>
					<div class="row uniform">
			 		<div class="3u 12u$(xsmall)"  style="visibility:hidden;">빈공간</div>
					<div class="6u 12u$(xsmall)">
						<input type="password" name="password" id="password" value="" placeholder="비밀번호" />
					</div>
					<div class="3u 12u$(xsmall)"  style="visibility:hidden;">빈공간</div>
					</div>
				<div class="row uniform">
					<div class="3u 12u$(xsmall)  style="visibility:hidden;"></div>
				    <ul class="actions">
						<li><input type="submit" value="로그인" class="button special"></li>
						<li><a href="../find" class="button alt">아이디/비밀번호 찾기</a></li>
						<li><a href="../register" class="button alt">회원가입</a></li>
					</ul>
				</div>
			</form>
				<div class="row uniform">
					<div class="4u 12u$(xsmall) style="visibility:hidden;"></div>
					<!-- 카카오로그인 버튼 client_id=카카오로그인api에 접속할수있는키 redirect_uri=카카오로그인후 토큰을받아올url -->
					<a onclick="window.open('https://accounts.kakao.com/login?continue=https%3a%2f%2fkauth.kakao.com%2foauth%2fauthorize%3fclient_id%3df4b335bfa37a8ce098ed450312b37a35%26redirect_uri%3dhttp%3a%2f%2f<%=request.getServerName()%>%2fmember%2flogin%2fkakao_login.jsp%26response_type%3dcode','카카오로그인','width=480,height=600,location=no,status=no,scrollbars=no');">
						<img alt="카카오로그인" src="/assets/images/kakao_account_login_btn_medium_narrow.png"/>
					</a>
				</div>
					</div>
				</div>
			</div>
		</div>
	</section>

<%@ include file="/assets/include/foot.jsp" %>

</html>