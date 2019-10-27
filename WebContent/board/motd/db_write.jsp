<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%@ page import = "Bean.Member" %>
<%@ page import = "Bean.Board" %>
<%@ page import = "java.sql.Date" %>
<%@ page import = "java.io.File"%>
<%@ page import = "java.util.Enumeration"%>
<%@ page import = "com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import = "com.oreilly.servlet.MultipartRequest"%>
<%
	request.setCharacterEncoding("utf-8");
	String email = (String)session.getAttribute("email");
	
	Member member = Member.getInstance();
	boolean admin_check = member.admin_check(email);
	
	String title = request.getParameter("title");
	if(title == null) {
		return;
	} else {
		title = title.trim();
	}
	if(title == "") {
		return;
	}
	
	if(email != null && admin_check == true) {
%>
<jsp:useBean id="article" scope="page" class="Bean.BoardBean">
	<jsp:setProperty name="article" property="*"/>
	<jsp:setProperty name="article" property="title" value="<%=title %>"/>
	<jsp:setProperty name="article" property="writer" value="<%=email %>"/>
</jsp:useBean>
<%
		Board board = Board.getInstance();
		board.insertArticle(article, "motd");
%>
<script>
	alert("게시글 등록이 완료되었습니다.");
	window.location = './';
</script>
<%
	} else {
		response.sendRedirect("/");
	}
%>