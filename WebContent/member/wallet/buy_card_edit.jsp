<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "Bean.*" %>
<%@ include file="/assets/include/login_check.jsp" %>
<!DOCTYPE HTML>
<html>
	<head>
		<title>카드 비밀번호 수정과 삭제</title>
		<style>
			#link {color: black; text-decoration: none;}
			#link:visited {color: black; text-decoration: none;}
			#link:hover {color: #ff0000; text-decoration: none;}
		</style>
		<script language="JavaScript" src="wallet.js"></script>
<%@ include file="/assets/include/menu_member.jsp" %>

<%@ include file="/assets/include/member_top.jsp" %>

		<!-- main -->
			<section id="two" class="wrapper style2">
				<div class="inner">
					<div class="box">
						<div class="content">
							<div style="height:400px;">
								<header class="align-center">
									<h2>카드 수정</h2><br><br>
								</header>
								
	<div class="row uniform">	
		<div class="3u 12u$(xsmall)" style="visibility:hidden;">빈공간</div>
		<div class="6u 12u$(xsmall)" style="text-align:center;">
			<button type="button" style="width:150px;height:70px;">	
				카드 삭제하기
			</button>
		</div>
		<div class="3u 12u$(xsmall)" style="visibility:hidden;">빈공간</div>
	</div>	<br><br><br><br>
	<center><h4 style="color:#ee1111;">결재시 새 비밀번호</h4></center><br>
	
	<form>
		<div class="row uniform">
			<div class="3u 12u$(xsmall)" style="visibility:hidden;">빈공간</div>
			<div class="6u 12u$(xsmall)">
				<input type="password" name="password" id="password" value="" placeholder="새 비밀번호" />
			</div>
			<div class="3u 12u$(xsmall)" style="visibility:hidden;">빈공간</div>
		</div>
		<div class="row uniform">	
			<div class="3u 12u$(xsmall)" style="visibility:hidden;">빈공간</div>
			<div class="6u 12u$(xsmall)">
				<input type="password" name="password" id="password" value="" placeholder="새 비밀번호 확인" />
			</div>
			<div class="3u 12u$(xsmall)" style="visibility:hidden;">빈공간</div>
		</div><br>
		<ul class="actions">
			<div class="row uniform">
				<div class="5u 12u$(xsmall)" style="visibility:hidden;"> 빈공간</div>
				<div class="2u 12u$(xsmall)" style="text-align:center;">
					<li><input type="submit" class="button special" value="확인"></li>
				</div>
				<div class="5u 12u$(xsmall)" style="visibility:hidden;"> 빈공간</div>
			</div>	
		</ul>
	</form>						</div><br><br>
							</div>
						</div>
					</div>
				</section>

<%@ include file="/assets/include/foot.jsp" %>

</html>