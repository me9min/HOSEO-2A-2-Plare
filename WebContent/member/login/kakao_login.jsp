<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,Kakao.KakaoLogin" %>
<%
	KakaoLogin KakaoLogin = new KakaoLogin();
	String code = request.getParameter("code");
	
	out.println(code);
	String hc = KakaoLogin.kakaoHttpPost(code);
	out.println(hc);
%>