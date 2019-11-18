<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%@ page import = "Bean.Shop" %>
<%@ include file="/assets/include/login_check.jsp" %>
<%
	int id = Integer.parseInt(request.getParameter("id"));
%>
<jsp:useBean id="item" scope="page" class="Bean.ShopBean">
	<jsp:setProperty name="item" property="*"/>
	<jsp:setProperty name="item" property="id" value="<%=id %>"/>
</jsp:useBean>
<%
		Shop shop = Shop.getInstance();
		shop.updateItem(item, id);
%>
<script>
	alert("게시글 수정이 완료되었습니다.");
	window.location = './content.jsp?id=<%=id %>';
</script>