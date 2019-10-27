<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, Bean.*" %>
<jsp:useBean id="member" class="Bean.Member"/>
<%
	request.setCharacterEncoding("UTF-8");
	String email = (String)session.getAttribute("email");
	String pw = request.getParameter("pw");
	pw.trim();
	if(request.getParameter("pw") == null || pw == "") {
%>
<script>
	alert("비밀번호를 입력하지않았습니다!");
	history.back();
</script>
<%
	} else {
		boolean success = member.delete_member(email, pw);
		if(success == true) {
			session.invalidate();
%>
<script>
	alert("회원탈퇴가 성공적으로 완료되었습니다.");
	location.href = "/";
</script>
<%
		} else {
%>
<script>
	alert("비밀번호가 틀렸습니다!");
	history.back();
</script>
<%
		}
	}
%>