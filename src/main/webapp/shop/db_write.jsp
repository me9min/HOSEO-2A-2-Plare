<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "Bean.Shop" %>
<%@ include file="/assets/include/login_check.jsp" %>
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