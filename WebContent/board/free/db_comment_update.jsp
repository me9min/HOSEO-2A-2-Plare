<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%@ page import = "Bean.Board" %>
<%@ page import = "Bean.BoardBean" %>
<% 
	request.setCharacterEncoding("UTF-8");
	Board board = Board.getInstance();
	
	int num = Integer.parseInt(request.getParameter("num"));
	String content = request.getParameter("content");
	int commentNum = Integer.parseInt(request.getParameter("commentNum"));
	
	try {
		board.updateComment(commentNum, content);
%>
<script>
	alert("댓글 수정이 완료되었습니다.");
<%
	} catch(Exception e) {	
%>
<script>
	alert("댓글 수정에 실패했습니다.");
<%
	} finally {
%>
	window.location = 'content.jsp?num=<%=num%>';
</script>
<%
	}
%>