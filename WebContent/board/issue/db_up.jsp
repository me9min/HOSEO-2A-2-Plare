<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%@ page import = "Bean.Board" %>
<% 
	request.setCharacterEncoding("UTF-8");
	Board board = Board.getInstance();
	
	int num = Integer.parseInt(request.getParameter("num"));
	
	board.up("issue", num);
%>
<script>
	alert("게시글을 공감했습니다.");
	window.location = 'content.jsp?num=<%=num%>';
</script>
