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
<title>자유 게시판</title>	
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
		table { border-collapse:collapse }
	</style>
<%@ include file="/assets/include/menu.jsp" %>
</head>
<body>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

   	try{
   		Board board = Board.getInstance(); 
      	BoardBean article = board.getArticle("free", num);
      	String nickname = board.getNickname(article.getWriter());
      	String edit_date = "";
        if(article.getEdit_date() != null) {
      	  edit_date = sdf.format(article.getEdit_date());
        }
%>
	<section id="One" class="wrapper style3">
				<div class="inner">
					<header class="align-center">
						<p>게시글을 올리는 커뮤니티입니다</p>
						<h2>게시판</h2>
					</header>
				</div>
			</section>
	<div id="main" class="container" >
		<center><h3>자유게시판</h3></center><br>
		<div class="table-wrapper">
		<form method="post" action="db_edit.jsp" name="edit">
		<input type="hidden" name="num" id="num" value="<%=num %>">
		<table class="table">
			<tr>
				<td align="center" width="20%" style="vertical-align: middle">제목</td>
				<td><input type="text" name="title" id="title" style="background-color:transparent;" value="<%=article.getTitle() %>"></td>
			</tr>
			<tr>
				<td align="center" style="vertical-align: middle">작성자</td>
				<td><%=nickname %></td>
			</tr>
			<tr>
				<td align="center" style="vertical-align: middle">작성일</td>
				<td><%=article.getReg_date() %></td>
			</tr>
			<tr>
				<td align="center" style="vertical-align: middle">마지막 수정일</td>
				<td><%=edit_date %></td>
			</tr>
			<tr>
				<td height="300px" align="center" style="vertical-align: middle">내용</td>
				<td height="300px">
					<textarea name="content" id="content" style="height:300px; background-color:transparent;"><%=article.getContent() %></textarea>
				</td>
			</tr>
			<tr id="border" style="background-color:#ffffff;">
				<td colspan="2" align="right"><input type="submit" value="수정"></td>
			</tr>
		</table>
		</form>
		</div>
	</div>
<%
   	} catch(Exception e) {}
%>
<%@ include file="/assets/include/foot.jsp" %>


</body>
</html>