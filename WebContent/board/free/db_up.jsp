<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "Bean.Board" %>
<% 
	request.setCharacterEncoding("UTF-8");
	Board board = Board.getInstance();
	
	int num = Integer.parseInt(request.getParameter("num"));
	
	board.up("free", num);
%>
<script>
	alert("게시글을 추천했습니다.");
	window.location = 'content.jsp?num=<%=num%>';
</script>
