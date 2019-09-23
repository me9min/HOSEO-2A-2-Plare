<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%@ page import = "Bean.Board" %>
<%@ page import = "java.sql.Date" %>
<%@ page import = "java.io.File"%>
<%@ page import = "java.util.Enumeration"%>
<%@ page import = "com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import = "com.oreilly.servlet.MultipartRequest"%>

<% 
	request.setCharacterEncoding("utf-8");
	String email = (String)session.getAttribute("email");
	String num = request.getParameter("num");
	String attach_image = request.getParameter("attach_image");
	String attach_file = request.getParameter("attach_file");
%>

<jsp:useBean id="article" scope="page" class="Bean.BoardBean">
	<jsp:setProperty name="article" property="*"/>
	<jsp:setProperty name="article" property="writer" value="<%=email %>"/>
	<jsp:setProperty name="article" property="num_rep" value="<%=num %>"/>
	<jsp:setProperty name="article" property="num_rep" value="<%=num %>"/>
	<jsp:setProperty name="article" property="num_rep" value="<%=num %>"/>
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
	board.insertArticle(article, "issue");

	response.sendRedirect("./");
%>