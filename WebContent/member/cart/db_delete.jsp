<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@ page import="Bean.Cart" %>
<%
	String email = (String)session.getAttribute("email");
	Cart cart = Cart.getInstance();
	
	if(request.getParameter("menu_id") != null) {
		String id = request.getParameter("menu_id");
		
		cart.DeleteCart(email, id);
	}
%>
<script>
	alert("장바구니에서 해당 아이템이 삭제되었습니다.");
	window.location = './';
</script>