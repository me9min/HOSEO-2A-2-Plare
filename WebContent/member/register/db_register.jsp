<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="member_form" class="Bean.MemberBean"/>
<jsp:setProperty property="*" name="member_form"/>

<jsp:useBean id="member" class="Bean.Member"/>

<% 
	try {
		member.register(member_form);	// register 메소드로 받아온 정보를 DB에 저장
	} catch(Exception e) {
%>
<script>
	alert("회원 가입 실패");
	window.location = './';
</script>
<%
		return;
	} finally {
%>
<script>
	alert("회원 가입이 완료되었습니다.");
	window.location = '../login';
</script>
<%
	}
%>