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
		table {
		border-collapse:collapse;
		}
		#link {color: black; text-decoration: none;}
		#link:visited {color: black; text-decoration: none;}
	</style>
	<script language="JavaScript" src="write.js"></script>
<%@ include file="/assets/include/menu.jsp" %>

</head>
<body>
<%
	String blank = "&nbsp;&nbsp;&nbsp;&nbsp;";

	email = (String)session.getAttribute("email");
	Board board = Board.getInstance(); 
	String nickname = board.getNickname(email);

	int num = Integer.parseInt(request.getParameter("num"));
	int currentPage = Integer.parseInt(request.getParameter("pageNum"));
	String pageNum = request.getParameter("pageNum");
	
    List<BoardBean> commentList = null;
    commentList = board.getComments(num);
    int commentCount = 0;
    if(commentList != null) {
    	commentCount = commentList.size();
    }
	
   	SimpleDateFormat sdf = 
        new SimpleDateFormat("yyyy-MM-dd");
   	

   try{
      BoardBean article = board.getArticle("free", num);
      String nickname_writer = board.getNickname(article.getWriter());
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
		<a href="index.jsp" class="button alt pull-right">글목록</a><br><br>
		<table class="table">
			<tr>
				<td align="center" width="20%" style="vertical-align: middle">제목</td>
				<td><%=article.getTitle() %></td>
			</tr>
			<tr>
				<td align="center" style="vertical-align: middle">작성자</td>
				<td><%=nickname_writer %></td>
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
				<td colspan="2" align="center">
					<button id="button" class="button special" onclick="location.href('db_up.jsp?num=<%=num %>&pageNum=<%=currentPage %>')">추천하기</button>
				</td>
			</tr>
			<tr style="border-bottom:hidden;">
				<td colspan="2" align="right" style="background-color:#ffffff;">
					조회수 <%=article.getRead_count() %> 추천수 <%=article.getUp_count() %> 댓글수 <%=commentCount %>
				</td>
			</tr>
		</table>
<%
   } catch(Exception e) {}
   
   if (commentList == null) {
%>
		<p style="text-align:center; border-top:1px solid rgba(144, 144, 144, 0.25); padding:10px;">댓글이 존재하지 않습니다.</p>
<%
   } else {
%>	
		<table>
<%
	   for (int i = 0 ; i < commentList.size() ; i++) {
			  BoardBean comment = commentList.get(i);
			  nickname = board.getNickname(comment.getWriter());
%>
			<tr style="background-color:#ffffff;border-bottom:hidden;" >
				<td colspan="2" align="left" style="vertical-align:middle;">
					<p style="display:inline; font-weight:bold;"><%=nickname %></p>
					<p style="display:inline; font-size:10px; color:gray"><%=sdf.format(comment.getReg_date()) %></p>
				</td>
			</tr>
			<tr style="background-color:#ffffff">
				<td style="vertical-align: middle"><%=blank %><%=blank %><%=comment.getContent() %></td>
				<td style="text-align:right;">
<%
			if(email.equals(comment.getWriter())) {
%>
					<a href="db_comment_update.jsp?num=<%=comment.getNum()%>" id="link">수정</a>
					<a href="db_comment_delete.jsp?num=<%=comment.getNum()%>" id="link">삭제</a>
<%
			}
%>
					<a href="" id="link">답글</a>
				</td>
			</tr>
<%
	   	}
%>
		</table>
<%
   	}
	if(email != null) {
%>
		<form method="post" name="comment_board" action="db_write_comment.jsp">
		<input type="hidden" name="num_board" value="<%=num %>">
		<input type="hidden" name="page_num" value="<%=pageNum %>">
		
		<table>
			<tr style="background-color:#ffffff">
				<td align="center" style="vertical-align: middle"><%=nickname %></td>
				<td height="100px" style="vertical-align: middle">
					<textarea name="content" id="content" style="width:100%;height:100px;"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="right" style="vertical-align: middle">
					<input type="button" class="button special" value="댓글등록" onclick="commentCheck()">
				</td>
			</tr>
		</table>
		</form>
<%} %>
		</div>
	</div>

<%@ include file="/assets/include/foot.jsp" %>

</body>
</html>