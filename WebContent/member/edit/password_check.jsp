<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/assets/include/login_check.jsp" %>
<!DOCTYPE HTML>
<html>
	<head>
		<title>비밀번호 확인</title>
		<script language="JavaScript" src="edit.js"></script>
<%@ include file="/assets/include/menu_member.jsp" %>

<%@ include file="/assets/include/member_top.jsp" %>

		<!-- main -->
			<section id="two" class="wrapper style2">
				<div class="inner">
					<div class="box">
						<div class="content">
							<div style="height:440px;">
							  <div style="height:100px;visibility:hidden;"></div>
								<header class="align-center">
									<h2>비밀번호확인</h2>
								</header>
<center><p>본인 확인을 위해 비밀번호를 입력해주세요.</p></center><br>
<form method="post" action="./db_check.jsp" name="check" onsubmit="return passwordCheck()">
	<div class="row uniform">
		<div class="3u 12u$(xsmall)" style="visibility:hidden;"> 빈공간</div>
		<div class="6u 12u$(xsmall)">
			<input type="password" name="password" id="password" value="" placeholder="비밀번호" />
		</div>
	</div><br>
	<ul class="actions">
		<div class="row uniform">
			<div class="8u 12u$(xsmall)" style="visibility:hidden;"> 빈공간</div>
		<li><input type="submit" class="button special" value="확인"></li>
		</div>	
	</ul>
</form>						</div>
						</div>
					</div>
				</div>
			</section>

<%@ include file="/assets/include/foot.jsp" %>

</html>