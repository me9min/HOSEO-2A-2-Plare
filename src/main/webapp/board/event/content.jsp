<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8");%>
<%@ page import = "Bean.Member" %>
<%@ page import = "Bean.Board" %>
<%@ page import = "Bean.BoardBean" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
	<title>이벤트</title>
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">	
	<style>
		#inputtext{
		height:300px;
		}
		#border{
		border-top:none;
		}
		#button{
		align:center;
		}
		table {
		border-collapse:collapse;
		}
	</style>
<%@ include file="/assets/include/menu.jsp" %>

</head>
<body>
<%
	email = (String)session.getAttribute("email");
	if(email == null) {
		email = "";
	}
	
	Member member = Member.getInstance();
	boolean admin_check = member.admin_check(email);

	int num = Integer.parseInt(request.getParameter("num"));
	
   	SimpleDateFormat sdf = 
        new SimpleDateFormat("yyyy-MM-dd HH:mm");

   try{
      Board board = Board.getInstance(); 
      BoardBean article = board.getArticle("event", num);
      String nickname = board.getNickname(article.getWriter());
      String edit_date = "";
      if(article.getEdit_date() != null) {
    	  edit_date = sdf.format(article.getEdit_date());
      }
%>
<%@ include file="/assets/include/board_top.jsp" %>

	<div id="main" class="container" >
		<center><h3>이벤트</h3></center><br>
		<div class="table-wrapper">
		<a href="./" class="button alt pull-right">글목록</a><br><br>
		<table class="table">
			<tr>
				<td align="center" width="20%" style="vertical-align: middle">제목</td>
				<td><%=article.getTitle() %></td>
			</tr>
			<tr>
				<td align="center" style="vertical-align: middle">작성자</td>
				<td><%=nickname %></td>
			</tr>
			<tr>
				<td align="center" style="vertical-align: middle">작성일</td>
				<td><%=sdf.format(article.getReg_date()) %></td>
			</tr>
			<tr>
				<td height="300px" align="center" style="vertical-align: middle">내용</td>
				<td height="300px"><pre style="background:transparent; border:hidden; font-family:'Nanum Gothic', sans-serif;"><%=article.getContent() %></pre></td>
			</tr>
<%
	if(admin_check == true) {
%>
			<tr style="background-color:#ffffff; border:hidden;">
				<td colspan="2" align="right">
					<button id="button" onclick="window.location='edit.jsp?num=<%=article.getNum() %>'">수정</button> 
					<button id="button" onclick="window.location='db_delete.jsp?num=<%=article.getNum() %>'">삭제</button>
				</td>
			</tr>
<%
	}
%>
			<tr style="border-bottom:hidden;">
				<td colspan="2" align="right" style="background-color:#ffffff;">
					조회수 <%=article.getRead_count() %>
				</td>
			</tr>
		</table>
<%
   } catch(Exception e) {}
%>
		</div>
	</div>

<%@ include file="/assets/include/foot.jsp" %>

</body>
</html>