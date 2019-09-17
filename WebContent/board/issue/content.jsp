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

	int num = Integer.parseInt(request.getParameter("num"));
	int currentPage = Integer.parseInt(request.getParameter("pageNum"));
	String pageNum = request.getParameter("pageNum");
	
   	SimpleDateFormat sdf = 
        new SimpleDateFormat("yyyy-MM-dd");

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
				<td align="center" style="vertical-align: middle">마지막 수정일</td>
				<td><%=edit_date %></td>
			</tr>
			<tr>
				<td height="300px" align="center" style="vertical-align: middle">내용</td>
				<td height="300px"><pre style="background:transparent; border:hidden; font-family:'Nanum Gothic', sans-serif;"><%=article.getContent() %></pre></td>
			</tr>
<%
	if(email.equals(article.getWriter())) {
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
			<tr id="border" style="background-color:#ffffff;">
				<td colspan="2" align="center"><button id="button" onclick="location.href('db_up.jsp?num=<%=num %>&pageNum=<%=currentPage %>')">추천하기</button></td>
			</tr>
			<tr style="border-bottom:hidden;">
				<td colspan="2" align="right" style="background-color:#ffffff;">
					조회수 <%=article.getRead_count() %> 추천수 <%=article.getUp_count() %> 댓글수 0
				</td>
			</tr>
		</table>
<%
   } catch(Exception e) {}
%>
		<table bgcolor="#eeeeee">
			<tr>
				<td align="center" style="vertical-align: middle">계정닉네임</td>
				<td height="100px" style="vertical-align: middle"><textarea style="width:100%;height:100px;"></textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="right" style="vertical-align: middle"><button>댓글등록</button></td>
			</tr>
		</table>
		</div>
	</div>

<%@ include file="/assets/include/foot.jsp" %>

</body>
</html>