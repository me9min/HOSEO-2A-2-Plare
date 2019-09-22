<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%@ page import = "Bean.Board" %>
<%@ page import = "java.sql.Date" %>

<%
	request.setCharacterEncoding("utf-8");
	int num = Integer.parseInt(request.getParameter("num"));
	String nums = request.getParameter("num");
%>

<jsp:useBean id="article" scope="page" class="Bean.BoardBean">
	<jsp:setProperty name="article" property="*"/>
	<jsp:setProperty name="article" property="num" value="<%=num %>"/>
</jsp:useBean>

<%
	Board board = Board.getInstance();
	board.updateArticle(article, "issue");
	
	response.sendRedirect("./");
%>