<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import = "com.*, java.util.*" %>
<%@ include file="/assets/include/login_check.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	
	int price = Integer.parseInt(request.getParameter("price"));

	FutureWorkThread fwt = new FutureWorkThread(email, price);
	fwt.start();
%>
<script>
	window.location = '/';
</script>