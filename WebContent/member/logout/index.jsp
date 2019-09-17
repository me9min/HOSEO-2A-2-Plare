<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.invalidate();
	
	String referer = request.getHeader("REFERER");
	/* if(referer != null) {
		response.sendRedirect(referer);
		return;
	} */
	response.sendRedirect("/member/login");
%>