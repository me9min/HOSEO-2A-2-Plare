<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, Bean.*" %>
<%
	request.setCharacterEncoding("UTF-8");
	String email = (String)session.getAttribute("email");
	String password_new = request.getParameter("password_new");
	String password_origin = request.getParameter("password_origin");
	
	Member member = Member.getInstance();
	boolean check = member.payPasswordCheck(email, password_origin);
	
	if(check == false) {
%>
	<script>
		alert("기존 비밀번호가 틀렸습니다. 다시 시도해주세요.");
		history.back();
	</script>
<%		
	} else {
		member.addPayPassword(email, password_new);
%>
	<script>
		alert("결제 비밀번호가 변경되었습니다.");
		location.href = "buy_point.jsp";
	</script>
<%
	}
%>