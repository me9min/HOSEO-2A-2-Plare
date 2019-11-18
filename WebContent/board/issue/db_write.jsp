<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "Bean.Board" %>
<%@ page import = "java.sql.Date" %>

<% 
	request.setCharacterEncoding("utf-8");
	String email = (String)session.getAttribute("email");
	String admin = "admin@plare.cf";
	
	int reply_num = 0;
	String title = request.getParameter("title");
	if(title == null) {
		return;
	} else {
		title = title.trim();
	}
	if(title == "") {
		return;
	}
	
	if(email != null) {
		if(email.equals(admin)) {
			try {
				reply_num = Integer.parseInt(request.getParameter("reply_num"));
			} catch(Exception e) {}
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