<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Kakao.KakaoLogin"%>
<%@ include file="/assets/include/login_check.jsp" %>
<%
	KakaoLogin kakao = new KakaoLogin();
	kakao.deleteMemberKakao(email);
%>
<script>
	alert("<%=email%> 연동해제성공!");
	window.opener.document.location.reload();
	window.close();
</script>