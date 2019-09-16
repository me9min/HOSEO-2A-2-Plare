<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8");%>
<%@ page import = "Bean.Board" %>
<%@ page import = "Bean.BoardBean" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
	<title>공지사항</title>
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
	String admin = "admin@plare.cf";

	int num = Integer.parseInt(request.getParameter("num"));
	int currentPage = Integer.parseInt(request.getParameter("pageNum"));
	String pageNum = request.getParameter("pageNum");
	
   	SimpleDateFormat sdf = 
        new SimpleDateFormat("yyyy-MM-dd");

   try{
      Board board = Board.getInstance(); 
      BoardBean article = board.getArticle("motd", num);
      String nickname = board.getNickname(article.getWriter());
      String edit_date = "";
      if(article.getEdit_date() != null) {
    	  edit_date = sdf.format(article.getEdit_date());
      }
%>
	<section id="One" class="wrapper style3">
				<div class="inner">
					<header class="align-center">
						<p>안내사항이나 이벤트를 확인할 수 있습니다</p>
						<h2>공지사항</h2>
					</header>
				</div>
			</section>
	<div id="main" class="container" >
		<center><h3>공지사항</h3></center><br>
		<div class="table-wrapper">
		<a href="index.jsp" class="button alt pull-right">글목록</a>
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
	if(email.equals(admin)) {
%>
			<tr style="background-color:#ffffff; border:hidden;">
				<td colspan="2" align="right">
					<button id="button" onclick="location.href('edit.jsp?num=<%=article.getNum() %>')">수정</button> 
					<button id="button" onclick="location.href('db_delete.jsp?num=<%=article.getNum() %>')">삭제</button>
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