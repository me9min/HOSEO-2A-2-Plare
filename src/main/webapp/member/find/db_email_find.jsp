<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, Bean.*" %>
<jsp:useBean id="member" class="Bean.Member" />
<%
	request.setCharacterEncoding("UTF-8");
	
	String nickname = request.getParameter("nickname");
	
	String email = member.find_email(nickname);
%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>아이디/비밀번호 찾기</title>
		<script language="JavaScript" src="./find.js"></script>
<%@ include file="/assets/include/menu_member.jsp" %>
			
<%@ include file="/assets/include/member_top.jsp" %>
			
		<!-- main -->
			<section id="two" class="wrapper style2">
				<div class="inner">
					<div class="box">
						<div class="content">
							<header class="align-center">
								<h2>이메일 찾기</h2>
							</header>
	<div class="row uniform">
		<div class="12u 12u$(xsmall)">
		<center>
<%
		if(email == null) {
%>
			<br><br><p>해당되는 회원 정보가 없습니다. 다시 시도해주세요.</p><br><br>
		</center>
		</div>
		<div class="12u 12u$(xsmall)">
		<center>
			<a href="./" class="button alt">돌아가기</a>
		</center>
		</div>
<%		
		} else {
%>
			<br><br><p>회원님의 이메일은 <%=email %>입니다.</p>
		</center>
		</div>
		<div class="12u 12u$(xsmall)">
		<center>
			<br><br><a href="../login/" class="button alt">로그인</a><br><br>
		</center>
		</div>
<%
		}
%>
		</center>
		
	</div>
			</div>
			</div>
			</div>
			</section>

		<!-- Footer -->
			<footer id="footer">
				<div class="container">
					<ul class="icons">
						<li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
						<li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
						<li><a href="#" class="icon fa-instagram"><span class="label">Instagram</span></a></li>
						<li><a href="#" class="icon fa-envelope-o"><span class="label">Email</span></a></li>
					</ul>
				</div>
				<a href="https://templated.co/hielo">TEMPLATED by Hielo</a>
				<div class="copyright">
					&copy; Untitled. All rights reserved.
				</div>
			</footer>

		<!-- Scripts -->
			<script src="../../assets/js/jquery.min.js"></script>
			<script src="../../assets/js/jquery.scrollex.min.js"></script>
			<script src="../../assets/js/skel.min.js"></script>
			<script src="../../assets/js/util.js"></script>
			<script src="../../assets/js/main.js"></script>

	</body>
</html>