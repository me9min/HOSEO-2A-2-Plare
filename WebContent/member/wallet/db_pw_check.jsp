<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, Bean.*" %>
<%
	request.setCharacterEncoding("UTF-8");
	String email = (String)session.getAttribute("email");
	String password = request.getParameter("password");
	String price = request.getParameter("price");
	
	Member member = Member.getInstance();
	boolean check = member.payPasswordCheck(email, password);
	
	if(check == false) {
%>
	<script>
		alert("비밀번호가 틀렸습니다. 다시 시도해주세요.");
		history.back();
	</script>
<%		
	} else {
		response.sendRedirect("db_buy_card.jsp?price=" + price);
	}
%>