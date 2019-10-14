<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, Bean.*" %>
<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="member_form" class="Bean.MemberBean" />
<jsp:setProperty property="*" name="member_form" />

<jsp:useBean id="member" class="Bean.Member" />

<%
	String ref = request.getParameter("ref");
	if(ref == null) {
		ref = "";
	}
	MemberBean member_sql = member.login(member_form);
	
	if(member_sql.getEmail() == null) {
%>
<script>
	alert("이메일이나 비밀번호가 올바르지 않습니다. 다시 시도해주세요.");
	window.location = './index.jsp?ref=<%=ref%>';
</script>
<%		
	} else {
		String email = member_sql.getEmail();
		session.setAttribute("email", email);
		
		if(ref == "") {
			ref = "/";
		}
%>
<script>
	window.location = '<%=ref%>';
</script>
<%
	}
%>