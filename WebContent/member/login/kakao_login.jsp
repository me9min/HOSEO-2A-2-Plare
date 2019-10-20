<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,java.util.*,java.io.*,Kakao.KakaoLogin,com.google.gson.*,com.google.gson.internal.LinkedTreeMap"%>
<%@ include file="/assets/include/logout_check.jsp" %>
<%
	Gson gson = new Gson();
	KakaoLogin kakao = new KakaoLogin();
	
	String code = request.getParameter("code");
	String access_token = kakao.getToken(code);
	String string_profile = kakao.getProfile(access_token);
	
	JsonObject json_profile = (JsonObject) gson.fromJson(string_profile, JsonObject.class);
	String kakao_id = (String) Integer.toString(json_profile.get("id").getAsInt());
	
 	String emailq = kakao.loginMemberKakao(kakao_id);
 	if(emailq == null || emailq.length() == 0) {
%>
<script>
	alert("연동된계정이없습니다! 회원가입이나 로그인후 내정보수정에서 연동해주세요.");
</script>
<%
 	} else {
 		session.setAttribute("email", emailq);
%>
<script>
	window.opener.location=("/");
</script>
<%
	}
%>
<script>
	window.close();
</script>