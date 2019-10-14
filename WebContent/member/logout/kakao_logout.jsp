<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,java.util.*,Kakao.KakaoLogin"%>
<%@ page import="com.google.gson.*,com.google.gson.internal.LinkedTreeMap"%>
<%
	Gson gson = new Gson();
	KakaoLogin kakao = new KakaoLogin();
	String code = request.getParameter("code");
	String string_profile = kakao.getProfile(kakao.getToken(code));
	
	JsonObject json_profile = (JsonObject) gson.fromJson(string_profile, JsonObject.class);
	String kakao_id = (String) Integer.toString(json_profile.get("id").getAsInt());
	
 	String email = (String)session.getAttribute("email");
 	if(email == null) {
 		
 		kakao.logoutKakao(kakao_id);
 		response.sendRedirect("/");
 	} else {
 		
 	}
 %>