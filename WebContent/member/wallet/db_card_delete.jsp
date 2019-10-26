<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, Bean.*" %>
<% 
	request.setCharacterEncoding("utf-8");
	
	String email = (String)session.getAttribute("email");
	int id = Integer.parseInt(request.getParameter("id"));
%>

<% 
	Member member = Member.getInstance();

	try {
		member.deleteCard(id);
	} catch(Exception e) {
%>
<script>
	alert("오류가 발생했습니다. 다시 시도해주세요.");
	window.location = 'buy_point.jsp';
</script>
<%
	} finally {
		boolean check = member.hasPayPassword(email);
		if(check == false) {
%>
<script>
	alert("카드 삭제가 완료되었습니다. 결제 비밀번호를 설정해주세요.");
	window.location = 'buy_pw_add.jsp';
</script>
<%
		} else {
%>
<script>
	alert("카드 삭제가 완료되었습니다.");
	window.location = 'buy_point.jsp';
</script>
<%		}
	}
%>