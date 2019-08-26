<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, Bean.*" %>
<jsp:useBean id="member" class="Bean.Member"/>
<%
	request.setCharacterEncoding("UTF-8");
	String email = (String)session.getAttribute("email");
		
	member.delete_member(email);
	session.invalidate();
%>
<script>
	alert("회원탈퇴가 성공적으로 완료되었습니다.");
	location.href = "../../";
</script>