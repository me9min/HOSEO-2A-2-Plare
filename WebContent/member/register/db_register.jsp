<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	request.setCharacterEncoding("UTF-8");
	
	String email = request.getParameter("email");
	String pw = request.getParameter("pw");
	String pwc = request.getParameter("pwc");
	String phone = request.getParameter("phone");
	String zipcode = request.getParameter("zipcode");
	String referrer = request.getParameter("referrer");
	
	
	
%>