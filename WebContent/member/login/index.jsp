<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/assets/include/logout_check.jsp" %>
<!DOCTYPE HTML>
<html>
	<head>
		<title>로그인</title>
		<script language="JavaScript" src="login.js"></script>
<%@ include file="/assets/include/menu_member.jsp" %>

		<!-- One -->
			<section id="One" class="wrapper style3">
				<div class="inner">
					<header class="align-center">
						<p>더 많은 기능이용</p>
						<h2>로그인</h2>
					</header>
				</div>
			</section>
		<!-- main -->
			<section id="two" class="wrapper style2">
				<div class="inner">
					<div class="box">
						<div class="content">
							<header class="align-center">
								<p>더 많은 기능이용</p>
								<h2>로그인</h2>
							</header>
<form method="post" action="db_login.jsp" name="login">
  <div class="row">
    <div class="col-md-3"  style="visibility:hidden;">빈공간</div>
    <div class="col-md-6">
     <input type="text" name="email" id="email" value="" placeholder="아이디/이메일" />
    </div>
    <div class="col-md-3"  style="visibility:hidden;">빈공간</div>
   </div><br>
   <div class="row">
    <div class="col-md-3"  style="visibility:hidden;">빈공간</div>
    <div class="col-md-6">
     <input type="password" name="password" id="password" value="" placeholder="비밀번호" />
    </div>
    <div class="col-md-3"  style="visibility:hidden;">빈공간</div>
  </div>
	<!-- <div class="row uniform">
	<br>
		<div class="3u 12u$(xsmall)" style="visibility:hidden;">
			빈공간
		</div>
		<div class="6u 12u$(xsmall)">
			<input type="text" name="email" id="email" value="" placeholder="아이디/이메일" />
		</div>
		<div class="3u 12u$(xsmall)" style="visibility:hidden;">
			빈공간
		</div><br>
		
		
		<div class="3u 12u$(xsmall)" style="visibility:hidden;">
			빈공간
		</div>
		<div class="6u$ 12u$(xsmall)">
			<input type="password" name="password" id="password" value="" placeholder="비밀번호" />
		</div>
		<div class="3u 12u$(xsmall)" style="visibility:hidden;">
			빈공간
		</div>
		
	</div> -->
</form>
<ul class="actions">
    <div class="row uniform">
   		<div class="3u 12u$(xsmall)" style="visibility:hidden;">
			빈공간
		</div>
		<li><input type="button" value="로그인" class="button special" onclick="loginCheck()"></li>
		<li><a href="../find" class="button alt">아이디/비밀번호 찾기</a></li>
		<li><a href="../register" class="button alt">회원가입</a></li>
    </div>
</ul>
						</div>
					</div>
				</div>
			</section>

<%@ include file="/assets/include/foot.jsp" %>
</html>