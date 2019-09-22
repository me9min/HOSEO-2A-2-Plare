<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%@ page import = "Bean.Board" %>
<%@ page import = "Bean.BoardBean" %>
<% 
	request.setCharacterEncoding("UTF-8");
	Board board = Board.getInstance();
	BoardBean article = new BoardBean();
	int num = Integer.parseInt(request.getParameter("num"));
	
	article.setNum(num);
	article.setTitle(request.getParameter("title"));
	article.setContent(request.getParameter("content"));
	
	board.updateArticle(article, "free");
%>
<script>
	alert("게시글 수정이 완료되었습니다.");
	window.location = './content.jsp?num=<%=num %>';
</script>
