<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%@ page import = "Bean.Board" %>
<%@ page import = "java.sql.Date" %>

<% 
	request.setCharacterEncoding("utf-8");
	String email = (String)session.getAttribute("email");
	
	String title = request.getParameter("title");
	
	if(email != null) {
%>
<jsp:useBean id="article" scope="page" class="Bean.BoardBean">
	<jsp:setProperty name="article" property="*"/>
	<jsp:setProperty name="article" property="writer" value="<%=email %>"/>
	<jsp:setProperty name="article" property="title" value="<%=title %>"/>
</jsp:useBean>
<%
		String ip = null;
		if (null != request.getRemoteAddr()) {
			ip = request.getRemoteAddr();
			if (null != request.getRemoteHost()) {
				ip = request.getRemoteHost();
				if (null != request.getHeader("x-forwarded-for")) {
					ip = request.getHeader("x-forwarded-for");
				}
			}
		}
		article.setIp(ip);
		
		Board board = Board.getInstance();
		board.insertArticle(article, "free");
%>
<script>
	alert("게시글 등록이 완료되었습니다.");
	window.location = './';
</script>
<%
	} else {
%>
<script>
	if(confirm("로그인이 필요합니다 로그인 하시겠습니까?") == true) {
		location.replace('/member/login');
	}
	else {
		history.back();
	}
</script>
<%
	}
%>