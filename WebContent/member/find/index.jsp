<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/assets/include/logout_check.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	
	String email_entered = request.getParameter("email");
	if(email_entered == null) {
		email_entered = "";
	}
	String code_created = request.getParameter("code_created");
	if(code_created == null) {
		code_created = "";
	}
%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>아이디/비밀번호 찾기</title>
		<script type="text/javascript" src="find.js"></script>
<%@ include file="/assets/include/menu_member.jsp" %>

		<!-- One -->
			<section id="One" class="wrapper style3">
				<div class="inner">
					<header class="align-center">
						<p>아이디(이메일) 또는 비밀번호 찾기</p>
						<h2>아이디/비밀번호 찾기</h2>
					</header>
				</div>
			</section>
			
		<!-- main -->
			<section id="two" class="wrapper style2">
				<div class="inner">
					<div class="box">
						<div class="content">
							<header class="align-center">
								<h2>이메일 찾기</h2>
							</header>
<form method="post" action="db_email_find.jsp" name="email_find" onsubmit="return emailFindCheck()">
	<div class="row uniform"><br>
		<div class="3u 12u$(xsmall)" align="right">
			  닉네임
		</div>
		<div class="5u 12u$(xsmall)">
			<input type="text" name="nickname" id="nickname" value="" placeholder="닉네임" />
		</div>
		<div class="4u 12u$(xsmall)">
			<input type="submit" class="button special"value="&nbsp;&nbsp;이메일 찾기&nbsp;&nbsp;" />
		</div><br>
		<div class="8u 12u$(xsmall)" align="right">
			  <div id="cattery" style="visibility:hidden;">내용임</div>
		</div><br><br>
	</div>
</form>
						</div>
					</div>
				</div>
			</section>
			
<section id="two" class="wrapper style2">
	<div class="inner">
		<div class="box">
			<div class="content">
				<header class="align-center">
					<h2>비밀번호 찾기</h2>		
				</header>
<form method="post" action="db_password_find.jsp" name="password_find" onsubmit="return passwordFindCheck()">
	<input type="hidden" name="email_check" id="email_check" value="false" /> 
	<input type="hidden" name="code_created" id="code_created" value="<%=code_created %>" />
	<div class="row uniform"><br>
		<div class="3u 12u$(xsmall)" align="right">
			  이메일
		</div>
		<div class="5u 12u$(xsmall)">
			<input type="text" name="email" id="email" value="<%=email_entered %>" placeholder="이메일을 입력하시오" />
		</div>
		<div class="4u 12u$(xsmall)">
			<input type="button" class="button alt" value="인증번호 전송" onclick="emailCheck()" />
		</div><br>
		<div class="3u 12u$(xsmall)" align="right">
			  인증번호
		</div>
		<div class="5u 12u$(xsmall)">
			<input type="text" name="code" id="code" value="" placeholder="인증번호 입력" />
		</div>
		<div class="4u 12u$(xsmall)">
			<input type="submit" class="button special" value="비밀번호 찾기">
		</div><br>
		<div class="8u 12u$(xsmall)" align="right">
			  <div id="cattery" style="visibility:hidden;">내용임</div>
		</div><br><br>
	</div>
</form>

						</div>
					</div>
				</div>
			</section>

<%@ include file="/assets/include/foot.jsp" %>

</html>