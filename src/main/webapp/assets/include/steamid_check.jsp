<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Bean.Member" %>
<%
	Member mcheck = Member.getInstance();
	String steamid = (String) mcheck.steamidCheck(email);
	if(steamid == null) {
%>
<script>
	if(confirm("스팀연동이 필요합니다! 현재스팀연동기능이없어 문의게시판에 글을올려 스팀연동요청해주세요.") == true) {
		location.replace('/board/issue/');
	}
	else {
		history.back();
	}
</script>
<%
	return;
	}
%>