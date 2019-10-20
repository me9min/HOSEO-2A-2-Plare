<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,java.util.*,java.io.*,Kakao.KakaoLogin,com.google.gson.*,com.google.gson.internal.LinkedTreeMap"%>
<%@ include file="/assets/include/login_check.jsp" %>
<%
	Gson gson = new Gson();
	KakaoLogin kakao = new KakaoLogin();
	
	String code = request.getParameter("code");
	String access_token = kakao.getToken(code);
	String string_profile = kakao.getProfile(access_token);
	
	JsonObject json_profile = (JsonObject) gson.fromJson(string_profile, JsonObject.class);
	String kakao_id = (String) Integer.toString(json_profile.get("id").getAsInt());
	
	JsonObject json_properties = (JsonObject) json_profile.get("properties");
	//String kakao_nick = json_properties.get("nickname").getAsString();
	String kakao_img = json_properties.get("thumbnail_image").getAsString();
	
	int res = kakao.updateMemberKakao(email, kakao_id, kakao_img);
	String ress = "실패! unkown error";
	switch(res) {
		case 0:
			ress = "연동 성공!";
			break;
		case 1:
			ress = "연동해제 실패!";
			break;
		case 2:
			ress = "실패! 이미 연동중인 카카오계정입니다";
			break;
	}
%>
<script>
	alert("<%=ress%>");
	window.close();
</script>