<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, Bean.*" %>
<% 
	request.setCharacterEncoding("utf-8");
	
	String email = (String)session.getAttribute("email");
	String password = request.getParameter("pay_password");
	
	Member member = Member.getInstance();

	try {
		member.addPayPassword(email, password);
	} catch(Exception e) {
%>
<script>
	alert("오류가 발생했습니다. 다시 시도해주세요.");
	window.location = 'buy_card.jsp';
</script>
<%
	} finally {
%>
<script>
	alert("결제 비밀번호 등록이 완료되었습니다. 앞으로 신용카드로 결제할 때 카드를 선택한 후 해당 비밀번호를 입력해주세요.");
	window.location = 'buy_point.jsp';
</script>
<%
	}
%>