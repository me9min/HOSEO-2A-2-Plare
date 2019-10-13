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
	
	Map<String,String> json2 = new HashMap<String,String>();
	json2 = (Map<String,String>) gson.fromJson(json_profile, json2.getClass());
	Map<String,String> json3 = new HashMap<String,String>();
	json3 = (Map<String,String>) gson.fromJson(json2.get("properties"), json3.getClass());
%>

<pre><%=code %></pre>
<pre><%=json_profile %></pre>



<br><br><br><br><br>
<pre>
{
	"id":1188766878,
	"properties":
	{
		"nickname":"박지호",
		"profile_image":"http://k.kakaocdn.net/dn/brVKnv/btqy0qL38Pu/T1NlUWER9Mt8hHA9nKjKv0/profile_640x640s.jpg",
		"thumbnail_image":"http://k.kakaocdn.net/dn/brVKnv/btqy0qL38Pu/T1NlUWER9Mt8hHA9nKjKv0/profile_110x110c.jpg"
	},
	"kakao_account":
	{
		"profile_needs_agreement":false,
		"profile":
		{
			"nickname":"박지호",
			"thumbnail_image_url":"http://k.kakaocdn.net/dn/ccEO2c/btqwMUJzxhm/RsYgf63B2o3bsmp7at09Vk/img_110x110.jpg",
			"profile_image_url":"http://k.kakaocdn.net/dn/ccEO2c/btqwMUJzxhm/RsYgf63B2o3bsmp7at09Vk/img_640x640.jpg"
		}
	}
}
</pre>