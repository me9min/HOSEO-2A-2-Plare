<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Bean.Cart" %>
<%@ include file="/assets/include/login_check.jsp" %>
<%@ include file="/assets/include/steamid_check.jsp" %>
<%
	String id[] = request.getParameterValues("checkItem");
	Cart cart = Cart.getInstance();
	
	for(int i=0; i<id.length; i++) {
		cart.DeleteCart(email, id[i]);
	}
%>
<script>
	alert("장바구니에서 해당 아이템들이 삭제되었습니다.");
	window.location = './';
</script>