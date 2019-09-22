<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%@ page import = "Bean.Board" %>
<% 
	request.setCharacterEncoding("UTF-8");
	Board board = Board.getInstance();
	
	int num = Integer.parseInt(request.getParameter("num"));
	int currentPage = Integer.parseInt(request.getParameter("pageNum"));
	
	board.up(num);
%>
<script>
	alert("게시글을 추천했습니다.");
	window.location = 'content.jsp?num=<%=num%>&pageNum=<%=currentPage%>';
</script>
