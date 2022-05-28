<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	String email = (String)session.getAttribute("email");
	if(email == null) {
%>
<script>
	if(confirm("로그인이 필요합니다 로그인 하시겠습니까?") == true) {
		location.replace('/member/login');
	}
	else {
		history.back();
	}
</script>
<%
	return;
	}
%>