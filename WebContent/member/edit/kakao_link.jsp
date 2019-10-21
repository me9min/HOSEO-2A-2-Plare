<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,java.util.*,java.io.*,Kakao.KakaoLogin,com.google.gson.*,com.google.gson.internal.LinkedTreeMap"%>
<%@ include file="/assets/include/login_check.jsp" %>
<%
	Gson gson = new Gson();
	KakaoLogin kakao = new KakaoLogin();
	
	String code = request.getParameter("code");
	String access_token = kakao.getToken(code,"http://"+request.getServerName()+"/member/edit/kakao_link.jsp");
	String string_profile = kakao.getProfile(access_token);
	
	JsonObject json_profile = (JsonObject) gson.fromJson(string_profile, JsonObject.class);
	String kakao_id = (String) Integer.toString(json_profile.get("id").getAsInt());
	
	JsonObject json_properties = (JsonObject) json_profile.get("properties");
	//String kakao_nick = json_properties.get("nickname").getAsString();
	String kakao_img = json_properties.get("thumbnail_image").getAsString();
	
	int res = kakao.updateMemberKakao(email, kakao_id, kakao_img);
	String ress = "unknown";
	if(res == 0) {
		ress = "연동 성공!";
	} else if(res == 1) {
		ress = "실패! 이미 연동된계정";
	} else if(res == 2) {
		ress = "실패! 이미 다른계정에서 연동중인 카카오계정";
	}
%>
<script>
	alert("<%=ress%>");
	window.opener.document.location.reload();
	window.close();
</script>