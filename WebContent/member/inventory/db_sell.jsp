<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Bean.Member" %>
<%@ include file="/assets/include/login_check.jsp" %>
<%@ include file="/assets/include/steamid_check.jsp" %>
<%
	Member member = Member.getInstance();
	
	if(request.getParameter("id") != null) {
		String id = request.getParameter("id");
		
		member.sellItem(email, id);
	}
%>
<script>
	alert("성공적으로 아이템을 판매하였습니다.");
	window.location = './';
</script>
