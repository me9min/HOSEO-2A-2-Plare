<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/assets/include/logout_check.jsp" %>
<!DOCTYPE HTML>
<html>
	<head>
		<title>아이디/비밀번호 찾기</title>
		<script type="text/javascript" src="find.js"></script>
<%@ include file="/assets/include/menu_member.jsp" %>

<%@ include file="/assets/include/member_top.jsp" %>
			
		<!-- main -->
			<section id="two" class="wrapper style2">
				<div class="inner">
					<div class="box">
						<div class="content">
							<header class="align-center">
								<h2>비밀번호 찾기</h2>

		</header>
<form method="post" action="db_password_find.jsp" name="password_find">
	<input type="hidden" name="email_check" id="email_check" value="false" /> 
	<div class="row uniform"><br>
		<div class="3u 12u$(xsmall)" align="right">
			  이메일
		</div>
		<div class="5u 12u$(xsmall)">
			<input type="text" name="email" id="email" value="" placeholder="이메일을 입력하시오" />
		</div>
		<div class="4u 12u$(xsmall)">
			<input type="button" class="button alt" value="&nbsp;&nbsp;이메일 확인&nbsp;&nbsp; " onclick="emailCheck()" />
		</div><br>
		<div class="3u 12u$(xsmall)" align="right">
			  전화번호
		</div>
		<div class="5u 12u$(xsmall)">
			<input type="text" name="phone" id="phone" value="" placeholder="전화번호 -없이" />
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
			<input type="button" class="button alt" value="비밀번호 찾기" onclick="passwordFindCheck()">
		</div><br>
		<div class="8u 12u$(xsmall)" align="right">
			  <div id="cattery" style="visibility:hidden;">내용임</div>
		</div>
		<div class="4u 12u$(xsmall)">
			<a href="./" class="button alt">&nbsp;&nbsp;이메일 찾기&nbsp;&nbsp;</a>
		</div><br><br>
	</div>
</form>

						</div>
					</div>
				</div>
			</section>

<%@ include file="/assets/include/foot.jsp" %>

</html>