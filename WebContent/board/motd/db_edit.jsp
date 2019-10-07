<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%@ page import = "Bean.Board" %>
<%@ page import = "java.sql.Date" %>

<%
	request.setCharacterEncoding("utf-8");
	String email = (String)session.getAttribute("email");
	String admin = "admin@plare.cf";
	
	String nums = (String)request.getParameter("num");
	int num = 0;
	if(nums != null){
		num = Integer.parseInt(nums);
	}
	
	if(num != 0 && email != null && email.equals(admin)) {
%>
<jsp:useBean id="article" scope="page" class="Bean.BoardBean">
	<jsp:setProperty name="article" property="*"/>
	<jsp:setProperty name="article" property="num" value="<%=num %>"/>
</jsp:useBean>
<%
		Board board = Board.getInstance();
		board.updateArticle(article, "motd");
%>
<script>
	alert("게시글 수정이 완료되었습니다.");
	window.location = './content.jsp?num=<%=nums %>';
</script>
<%
	} else {
		response.sendRedirect("/");
	}
%>