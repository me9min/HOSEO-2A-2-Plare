<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%@ page import = "Bean.Board" %>
<%@ page import = "java.sql.Date" %>

<% 
	request.setCharacterEncoding("utf-8");
	String email = (String)session.getAttribute("email");
	if(email == null) {
		email = "";
	}
	String admin = "admin@plare.cf";
	int reply_num = 0;
	String title = request.getParameter("title");
	
	if(email.equals(admin)) {
		try {
			reply_num = Integer.parseInt(request.getParameter("reply_num"));
			title = "[답변] "+title;
		} catch(Exception e) {
			reply_num = 0;
		}
	}
%>
<jsp:useBean id="article" scope="page" class="Bean.BoardBean">
	<jsp:setProperty name="article" property="*"/>
	<jsp:setProperty name="article" property="writer" value="<%=email %>"/>
	<jsp:setProperty name="article" property="title" value="<%=title %>"/>
	<jsp:setProperty name="article" property="num_rep" value="<%=reply_num %>"/>
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