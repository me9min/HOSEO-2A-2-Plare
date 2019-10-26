<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import = "com.*, java.util.*" %>
<%@ include file="/assets/include/login_check.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	
	int price = Integer.parseInt(request.getParameter("price"));

	Calendar currentCalendar = Calendar.getInstance();
	int year = currentCalendar.get(Calendar.YEAR);
	int month = currentCalendar.get(Calendar.MONTH) + 1;
	int day = currentCalendar.get(Calendar.DAY_OF_MONTH);
	int hour = currentCalendar.get(Calendar.HOUR_OF_DAY);
	int minute = currentCalendar.get(Calendar.MINUTE);

	FutureWorkThread fwt = new FutureWorkThread(year, month, day, hour, minute, email, price);
	fwt.start();
%>
<script>
	window.location = '/';
</script>