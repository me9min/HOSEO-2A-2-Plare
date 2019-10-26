<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "Bean.*" %>
<%@ include file="/assets/include/login_check.jsp" %>
<!DOCTYPE HTML>
<html>
	<head>
		<title>비밀번호 확인</title>
		<script language="JavaScript" src="wallet.js"></script>
<%@ include file="/assets/include/menu_member.jsp" %>

<%@ include file="/assets/include/member_top.jsp" %>
<%
	String price = request.getParameter("price");
	
	Member member = Member.getInstance();
	boolean check = member.hasPayPassword(email);
	System.out.println(check);
	if(check == false) {
%>
<script>
	alert("먼저 결제 비밀번호를 설정해주세요.");
	window.location = 'buy_pw_add.jsp';
</script>
<%
	}
%>
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
<center><p>결제 비밀번호를 입력해주세요.</p></center><br>
<form method="post" action="db_pw_check.jsp" name="check" onsubmit="return payPasswordCheck()">
<input type="hidden" name="price" id="price" value="<%=price %>">
	<div class="row uniform">
		<div class="3u 12u$(xsmall)" style="visibility:hidden;"> 빈공간</div>
		<div class="6u 12u$(xsmall)">
			<input type="password" name="password" id="password" value="" placeholder="결제 비밀번호  6자리 숫자" />
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