<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,java.util.*,java.io.*,Kakao.KakaoLogin,com.google.gson.*,com.google.gson.internal.LinkedTreeMap"%>
<%@ include file="/assets/include/logout_check.jsp" %>
<%
	String code = request.getParameter("code");
	String urlme = request.getRequestURL().toString();
	
	Gson gson = new Gson();
	KakaoLogin kakao = new KakaoLogin();
	
	String access_token = kakao.getToken(code,urlme);
	String string_profile = kakao.getProfile(access_token);
	
	JsonObject json_profile = (JsonObject) gson.fromJson(string_profile, JsonObject.class);
	String kakao_id = (String) Integer.toString(json_profile.get("id").getAsInt());
	
 	String emailq = kakao.loginMemberKakao(kakao_id);
 	if(emailq == null || emailq.length() == 0) {
 		
 		JsonObject json_properties = (JsonObject) json_profile.get("properties");
 		String kakao_nick = json_properties.get("nickname").getAsString();
 		String kakao_img = json_properties.get("thumbnail_image").getAsString();
 		
 		JsonObject json_account = (JsonObject) json_profile.get("kakao_account");
 		JsonObject json_profile = (JsonObject) json_profile.get("profile");
 		String kakao_nick = json_profile.get("nickname").getAsString();
 		
 		
 	} else {
 		session.setAttribute("email", emailq);
%>
<script>
	opener.document.location.href=("/");
</script>
<%
	}
%>
<script>
	window.close();
</script>









{
	"id":1178231026,
	"properties":
	{
		"nickname":"백승민",
		"profile_image":"http://k.kakaocdn.net/dn/xuHZ8/btqyGcNPSX6/KWWAmjlnSvyJomKfYSbfA1/profile_640x640s.jpg",
		"thumbnail_image":"http://k.kakaocdn.net/dn/xuHZ8/btqyGcNPSX6/KWWAmjlnSvyJomKfYSbfA1/profile_110x110c.jpg"
	},
	"kakao_account":
	{
		"profile_needs_agreement":false,
		"profile":
		{
			"nickname":"백승민",
			"thumbnail_image_url":"http://k.kakaocdn.net/dn/75Tuq/btqj39EBGhe/xwSUFnVdWIoe4mJNHJuKc1/img_110x110.jpg",
			"profile_image_url":"http://k.kakaocdn.net/dn/75Tuq/btqj39EBGhe/xwSUFnVdWIoe4mJNHJuKc1/img_640x640.jpg"
		},
		"has_email":true,
		"email_needs_agreement":true,
		"has_birthday":true,
		"birthday_needs_agreement":true
	}
}