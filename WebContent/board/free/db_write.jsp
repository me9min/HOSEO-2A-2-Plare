<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%@ page import = "Bean.Board" %>
<%@ page import = "java.sql.Timestamp" %>
<%@ page import = "java.sql.Date" %>

<% 
	request.setCharacterEncoding("utf-8");
	String email = (String)session.getAttribute("email");
%>

<jsp:useBean id="article" scope="page" class="Bean.BoardBean">
   <jsp:setProperty name="article" property="*"/>
   <jsp:setProperty name="article" property="writer" value="<%=email %>"/>
</jsp:useBean>

<%
	article.setIp(request.getRemoteAddr());

    Board board = Board.getInstance();
    board.insertArticle(article, "free"); 

    response.sendRedirect("index.jsp");
%>