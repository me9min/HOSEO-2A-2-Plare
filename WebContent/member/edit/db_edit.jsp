<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, Bean.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="member_form" class="Bean.MemberBean"/>
<jsp:setProperty property="*" name="member_form"/>
<jsp:useBean id="member" class="Bean.Member"/>
<%
	String email = (String)session.getAttribute("email");
	member.change_info(member_form, email);
	// change_information(edit) 메소드로 받아온 정보를 DB에 저장
%>
<script>
	alert("회원 수정이 완료되었습니다.");
	window.location = '../';
</script>
