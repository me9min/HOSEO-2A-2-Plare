<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "Bean.Board" %>
<%@ page import = "Bean.BoardBean" %>
<% 
	request.setCharacterEncoding("UTF-8");
	Board board = Board.getInstance();
	
	int num = Integer.parseInt(request.getParameter("num"));
	String content = request.getParameter("content");
	int commentNum = Integer.parseInt(request.getParameter("commentNum"));

	String email = (String)session.getAttribute("email");
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
%>
<jsp:useBean id="comment" scope="page" class="Bean.BoardBean">
   <jsp:setProperty name="comment" property="num_rep" value="<%=commentNum %>"/>
   <jsp:setProperty name="comment" property="writer" value="<%=email %>"/>
   <jsp:setProperty name="comment" property="ip" value="<%=ip %>"/>
   <jsp:setProperty name="comment" property="content" value="<%=content %>"/>
   <jsp:setProperty name="comment" property="num_board" value="<%=num %>"/>
</jsp:useBean>
<%	
	try {
		board.insertComment(comment);
%>
<script>
	alert("댓글 등록이 완료되었습니다.");
<%
	} catch(Exception e) {	
%>
<script>
	alert("댓글 등록에 실패했습니다.");
<%
	} finally {
%>
	window.location = 'content.jsp?num=<%=num%>';
</script>
<%
	}
%>