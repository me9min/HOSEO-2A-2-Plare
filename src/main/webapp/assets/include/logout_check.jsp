<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	String email = (String)session.getAttribute("email");
	if(email != null) {
%>
<script>
	if(confirm("로그아웃이 필요합니다 로그아웃 하시겠습니까?") == true) {
		location.replace('/member/logout/');
	}
	else {
		history.back();
	}
</script>
<%
	return;
	}
%>