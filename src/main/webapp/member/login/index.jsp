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
	String ref = request.getHeader("REFERER");
	String rref = null;
	if(ref == null) {
		rref = request.getParameter("ref");

		if(rref == null) {
			ref = "/";
		} else {
			ref = rref.trim();
		}
	}
	if(ref.contains(request.getRequestURL().toString()) || ref.contains("db")) {
		ref = "/";
	} else if(ref.contains("member")) {
		ref = "/member/";
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
						<li><a href="../find/" class="button alt">아이디/비밀번호 찾기</a></li>
						<li><a href="../register/" class="button alt">회원가입</a></li>
					</ul>
				</div>
			</form>
			<%--
				<div class="row uniform">
					<div class="4u 12u$(xsmall) style="visibility:hidden;"></div>
					<!-- 카카오로그인 버튼 client_id=카카오로그인api에 접속할수있는키 redirect_uri=카카오로그인후 토큰을받아올url -->
					<a onclick="kakao_login()">
						<img alt="카카오로그인" src="/assets/images/kakao_account_login_btn_medium_narrow.png"/>
					</a>
				</div>
			--%>
					</div>
				</div>
			</div>
		</div>
	</section>

<%@ include file="/assets/include/foot.jsp" %>

</html>

<script>
	function kakao_login() {
		var return_url = location.protocol+'%2F%2F'+location.host+'%2Fmember%2Flogin%2Fkakao_login.jsp';
		var api_url = 'https%3A%2F%2Fkauth.kakao.com%2Foauth%2Fauthorize%3Fclient_id%3Df4b335bfa37a8ce098ed450312b37a35%26redirect_uri%3D'+return_url+'%26response_type%3Dcode';
		window.open(
			'https://accounts.kakao.com/login?continue='+api_url
			,'카카오로그인'
			,'width=480,height=600,location=no,status=no,scrollbars=no'
		);
	}
</script>