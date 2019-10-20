<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%@ page import = "Bean.Shop" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="item" scope="page" class="Bean.ShopBean">
	<jsp:setProperty name="item" property="*"/>
</jsp:useBean>
<%
	Shop shop = Shop.getInstance();
	shop.insertItem(item);
%>
<script>
	alert("아이템 등록이 완료되었습니다.");
	window.location = './';
</script>