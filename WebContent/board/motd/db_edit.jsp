<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%@ page import = "Bean.Board" %>
<%@ page import = "Bean.BoardBean" %>
<% 
	request.setCharacterEncoding("UTF-8");
	Board board = Board.getInstance();
	BoardBean article = new BoardBean();
	
	article.setNum(Integer.parseInt(request.getParameter("num")));
	article.setTitle(request.getParameter("title"));
	article.setContent(request.getParameter("content"));
	
	board.updateArticle("motd", article);
%>
<script>
	alert("게시글 수정이 완료되었습니다.");
	window.location = 'index.jsp';
</script>
