<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import = "Bean.*" %>
<%@ include file="/assets/include/login_check.jsp" %>
<%
	Shop sh = new Shop();
	int amount = Integer.parseInt(request.getParameter("amount"));
	sh.plusPoint(email,amount);
%>
<script>
	alert("성공적으로 포인트충전이 완료되었습니다.");
	window.location = '../../shop/';
</script>