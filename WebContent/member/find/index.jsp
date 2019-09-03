<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/assets/include/logout_check.jsp" %>
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
<form method="post" action="db_email_find.jsp" name="email_find">
	<div class="row uniform"><br>
		<div class="3u 12u$(xsmall)" align="right">
			  전화번호
		</div>
		<div class="5u 12u$(xsmall)">
			<input type="text" name="phone" id="email" value="" placeholder="전화번호 -없이" />
		</div>
		<div class="4u 12u$(xsmall)">
			<input type="button" class="button alt" value="인증번호 전송" />
		</div><br>
		<div class="3u 12u$(xsmall)" align="right">
			  인증번호
		</div>
		<div class="5u 12u$(xsmall)">
			<input type="text" name="code" id="code" value="" placeholder="인증번호 입력" />
		</div>
		<div class="4u 12u$(xsmall)">
			<input type="button" class="button alt" value="&nbsp;&nbsp;이메일 찾기&nbsp;&nbsp;" onclick="emailFindCheck()" />
		</div><br>
		<div class="8u 12u$(xsmall)" align="right">
			  <div id="cattery" style="visibility:hidden;">내용임</div>
		</div>
		<div class="4u 12u$(xsmall)">
			<a href="password_find.jsp" class="button alt">비밀번호 찾기</a>
		</div><br><br>



</form>
						</div>
					</div>
				</div>
			</section>

<%@ include file="/assets/include/foot.jsp" %>

</html>