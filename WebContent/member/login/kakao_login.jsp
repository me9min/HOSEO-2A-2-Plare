<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,java.util.*,Kakao.KakaoLogin"%>
<%@ page import="com.google.gson.*,com.google.gson.internal.LinkedTreeMap"%>
<%
// 	String email = (String)session.getAttribute("email");
// 	if(email == null) {
// 		return;
// 	}
	
	Gson gson = new Gson();
	KakaoLogin kakao = new KakaoLogin();
	String code = request.getParameter("code");
	
	String json_profile = kakao.getProfile(kakao.getToken(code));
	
	JsonObject json2 = new JsonObject();
	json2 = (JsonObject) gson.fromJson(json_profile, json2.getClass());
	
	Map<String,String> json3 = new HashMap<String,String>();
	json3 = (Map<String,String>) gson.fromJson(json2.get("properties"), json3.getClass());
%>

<pre><%=json3.get("nickname") %></pre>
<pre><%=json3.get("thumbnail_image") %></pre>