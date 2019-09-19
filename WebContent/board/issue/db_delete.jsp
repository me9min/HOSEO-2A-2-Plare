<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%@ page import = "Bean.Board" %>
<%@ page import = "Bean.BoardBean" %>
<% 
	request.setCharacterEncoding("UTF-8");
	Board board = Board.getInstance();
	
	int num = Integer.parseInt(request.getParameter("num"));
	
	board.deleteArticle("issue", num);
%>
<script>
	alert("게시글 삭제가 완료되었습니다.");
	window.location = 'index.jsp';
</script>
