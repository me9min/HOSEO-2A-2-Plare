<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%@ page import = "Bean.Board" %>
<%@ page import = "java.sql.Date" %>

<% 
	request.setCharacterEncoding("utf-8");
	String email = (String)session.getAttribute("email");
%>

<jsp:useBean id="comment" scope="page" class="Bean.BoardBean">
   <jsp:setProperty name="comment" property="*"/>
   <jsp:setProperty name="comment" property="writer" value="<%=email %>"/>
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
	comment.setIp(ip);
						
	try {
	    Board board = Board.getInstance();
	    board.insertComment(comment);
%>
	<script>alert('댓글이 등록되었습니다.')</script>
<%
	} catch(Exception e) {
%>
		<script>alert('댓글 등록에 실패했습니다.')</script>
<%		
	} finally {
	    response.sendRedirect("content.jsp?num=" + request.getParameter("num_board") + "&pageNum=" + request.getParameter("page_num"));
	}

%>