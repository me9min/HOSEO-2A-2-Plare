<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, Bean.*" %>
<jsp:useBean id="member" class="Bean.Member" />
<%
	request.setCharacterEncoding("UTF-8");
	
	String email = request.getParameter("email");
	Boolean email_check = member.email_double_check(email);
	
	if(email_check == false) {
		StringBuffer code_created = member.emailCode(email);
		if(code_created != null) {
%>
	<form method="post" name="randomCode" action="./">
		<input type="hidden" name="email" value="<%=email %>">
		<input type="hidden" name="code_created" value="<%=code_created %>">
		<script>
			alert("해당 이메일로 인증 번호가 발송되었습니다. 받은 인증번호를 적어주세요.");
			document.randomCode.submit();
		</script>
	</form>
<%
		} else {
%>
		<script>
			alert("인증 번호를 보내는 도중 오류가 발생했습니다. 다시 시도해주세요.");
			history.back();
		</script>
<%
		}
	} else { 
%>
		<script>
			alert("가입되어있지않은 이메일입니다. 다시 시도해주세요.");
			history.back();
		</script>
<%
	}
%>