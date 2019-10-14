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
	
	JsonObject json_properties = (JsonObject) json_profile.get("properties");
	String kakao_nick = json_properties.get("nickname").getAsString();
	String kakao_img = json_properties.get("thumbnail_image").getAsString();
	
 	String email = (String)session.getAttribute("email");
 	if(email == null) {
 		
 		kakao.loginMemberKakao(kakao_id);
 		response.sendRedirect("/");
 	} else {
 		
		kakao.updateMemberKakao(email, kakao_id, kakao_img);
		response.sendRedirect("/member/edit/");
 	}
 %>