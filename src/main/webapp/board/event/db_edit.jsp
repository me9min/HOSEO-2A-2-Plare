<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "Bean.Member" %>
<%@ page import = "Bean.Board" %>
<%@ page import = "java.sql.Date" %>

<%
	request.setCharacterEncoding("utf-8");
	String email = (String)session.getAttribute("email");
	
	Member member = Member.getInstance();
	boolean admin_check = member.admin_check(email);
	
	String nums = (String)request.getParameter("num");
	int num = 0;
	if(nums != null){
		num = Integer.parseInt(nums);
	}
	
	String title = request.getParameter("title");
	if(title == null) {
		return;
	} else {
		title = title.trim();
	}
	if(title == "") {
		return;
	}
	
	if(num != 0 && email != null && admin_check == true) {
%>
<jsp:useBean id="article" scope="page" class="Bean.BoardBean">
	<jsp:setProperty name="article" property="*"/>
	<jsp:setProperty name="article" property="title" value="<%=title %>"/>
	<jsp:setProperty name="article" property="num" value="<%=num %>"/>
</jsp:useBean>
<%
		Board board = Board.getInstance();
		board.updateArticle(article, "event");
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