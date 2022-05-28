<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, Bean.*" %>
<jsp:useBean id="member" class="Bean.Member"/>
<%
	request.setCharacterEncoding("UTF-8");
	String email = (String)session.getAttribute("email");
	String password = request.getParameter("password");
	
	boolean check = member.password_check(email, password);
	
	if(check == false) {
%>
	<script>
		alert("비밀번호가 틀렸습니다. 다시 시도해주세요.");
		location.href = "./password_check.jsp";
	</script>
<%		
	} else {
		response.sendRedirect("./");
	}
%>