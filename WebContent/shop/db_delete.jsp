<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%@ page import = "Bean.Shop" %>
<%@ include file="/assets/include/login_check.jsp" %>
<%
	Shop shop = Shop.getInstance();
	int id = Integer.parseInt(request.getParameter("id"));
	shop.deleteItem(id);
%>
<script>
	alert("아이템 삭제가 완료되었습니다.");
	window.location = './';
</script>
