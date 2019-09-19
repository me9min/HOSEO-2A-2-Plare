<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%@ page import = "Bean.Board" %>
<%@ page import = "java.sql.Date" %>

<% 
	request.setCharacterEncoding("utf-8");
	String email = (String)session.getAttribute("email");
	String title = (String)request.getParameter("title");
	String content = (String)request.getParameter("content");
%>

<jsp:useBean id="article" scope="page" class="Bean.BoardBean">
	<jsp:setProperty name="article" property="*"/>
	<jsp:setProperty name="article" property="writer" value="<%=email %>"/>
	<jsp:setProperty name="article" property="content" value="<%=content %>"/>
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

	//response.sendRedirect("./");
%>
(<%=title %>)<br>
(<%=content %>)<br>
(<%=ip %>)<br>
(<%=email %>)