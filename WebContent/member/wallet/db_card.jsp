<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, Bean.*" %>
<% 
	request.setCharacterEncoding("utf-8");
	
	String email = (String)session.getAttribute("email");
%>

<jsp:useBean id="card" class="Bean.MemberBean">
	<jsp:setProperty property="*" name="card"/>
	<jsp:setProperty property="email" name="card" value="<%=email %>"/>
</jsp:useBean>

<% 
	Member member = Member.getInstance();

	try {
		member.addCard(card);	// addCard 메소드로 받아온 정보를 DB에 저장
	} catch(Exception e) {
%>
<script>
	alert("오류가 발생했습니다. 다시 시도해주세요.");
	window.location = 'buy_card.jsp';
</script>
<%
	} finally {
		boolean check = member.hasPayPassword(email);
		if(check == false) {
%>
<script>
	alert("카드 등록이 완료되었습니다. 결제 비밀번호를 설정해주세요.");
	window.location = 'buy_pw.jsp';
</script>
<%
		}
%>
<script>
	alert("카드 등록이 완료되었습니다.");
	window.location = 'buy_point.jsp';
</script>
<%
	}
%>