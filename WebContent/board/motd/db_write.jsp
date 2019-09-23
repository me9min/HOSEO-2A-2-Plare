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
	if(email == null) {
		email = "";
	}
	String admin = "admin@plare.cf";
	
	if(email.equals(admin)) {
%>

<jsp:useBean id="article" scope="page" class="Bean.BoardBean">
   <jsp:setProperty name="article" property="*"/>
   <jsp:setProperty name="article" property="writer" value="<%=email %>"/>
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
	    board.insertArticle(article, "motd");
	    
	    response.sendRedirect("./");
	} else {
%>
<script>
	alert("관리자가아닙니다!");
	history.go(-2);
</script>
<%
	}
%>