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
		#link:hover {color: red; text-decoration: none;}
		#blank {text-align: right; width: 5%;}
	</style>
	<script language="JavaScript" src="write.js"></script>
<%@ include file="/assets/include/menu.jsp" %>

</head>
<body>
<%
	email = (String)session.getAttribute("email");
	if(email == null) {
		email = "";
	}
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
        new SimpleDateFormat("yyyy-MM-dd hh:mm");
   	

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
					<button id="button" onclick="location.href('edit.jsp?num=<%=article.getNum() %>')" class="button alt">수정</button> 
					<button id="button" onclick="location.href('db_delete.jsp?num=<%=article.getNum() %>')" class="button alt">삭제</button>
				</td>
			</tr>
<%
	}
%>
			<tr id="border" style="background-color:#ffffff;">
				<td colspan="2" align="center">
					<input type="button" value="추천하기" class="button alt" onclick="location.href('db_up.jsp?num=<%=num %>&pageNum=<%=currentPage %>')">
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
		int count = 1;
	   	for (int i = 0 ; i < commentList.size() ; i++) {
			  BoardBean comment = commentList.get(i);
			  String nicknameComment = board.getNickname(comment.getWriter());
%>
			<tr style="background-color:#ffffff;border-bottom:hidden;" >			
				<td colspan="3" style="vertical-align:middle;">
					<p style="display:inline; font-weight:bold;"><%=nicknameComment %></p>
					<p style="display:inline; font-size:10px; color:gray"><%=sdf.format(comment.getReg_date()) %></p>
				</td>
			</tr>
			<tr style="background-color:#ffffff">
				<td id="blank">&nbsp;</td>
				<td style="vertical-align: middle">
					<pre style="background:transparent; border:hidden; font-family:'Nanum Gothic', sans-serif; padding:0px;"><%=comment.getContent() %></pre>
				</td>
				<td style="text-align:right; vertical-align:bottom;">
<%
			if(email.equals(comment.getWriter())) {
%>
<%-- 				<a href="db_comment_update.jsp?num=<%=comment.getNum()%>" id="link">수정</a>
					<a href="db_comment_delete.jsp?num=<%=comment.getNum()%>" id="link">삭제</a> 
--%>
					<p style="display:inline;" id="link" onclick="updateShow(<%=count*2-1 %>, <%=count*2 %>)">수정</p>
					<p style="display:inline;" id="link" onclick="">삭제</p>
<%
			}
%>
					<p style="display:inline;" id="link" onclick="replyShow(<%=count*2-1 %>, <%=count*2 %>)">답글</p>
				</td>
			</tr>
			<tr id="update<%=count*2-1 %>" style="display:none; background-color:#ffffff">
				<td align="center" style="vertical-align: middle"><%=nickname %></td>
				<td colspan="2" height="100px" style="vertical-align: middle">
				<form method="post" name="update_hidden">
					<input type="hidden" name="count1" value="<%=count*2-1 %>">
					<input type="hidden" name="count2" value="<%=count*2 %>">
					<textarea name="content_update" id="content_update" style="width:100%;height:100px;"><%=comment.getContent() %></textarea>
				</form>
				</td>
			</tr>
			<tr id="update<%=count*2 %>" style="display:none;">
				<td colspan="3" align="right" style="vertical-align: middle">
					<input type="button" class="button alt" value="댓글수정" onclick="updateCheck()">
				</td>
			</tr>
			<tr id="reply<%=count*2-1 %>" style="display:none; background-color:#ffffff">
				<td id="blank">&nbsp;</td>
				<td align="center" style="vertical-align: middle"><%=nickname %></td>
				<td height="100px" style="vertical-align: middle">
				<form method="post" name="reply_hidden">
					<input type="hidden" name="count1" value="<%=count*2-1 %>">
					<input type="hidden" name="count2" value="<%=count*2 %>">
					<textarea name="content_reply" id="content_reply" style="width:100%;height:100px;"></textarea>
				</form>
				</td>
			</tr>
			<tr id="reply<%=count*2 %>" style="display:none;">
				<td colspan="3" align="right" style="vertical-align: middle">
					<input type="button" class="button alt" value="답글등록" onclick="replyCheck()">
				</td>
			</tr>
<%
			count++;
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
				<td align="center" style="width:15%; vertical-align: middle"><%=nickname %></td>
				<td height="100px" style="vertical-align: middle">
					<textarea name="content" id="content" style="width:100%;height:100px;"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="right" style="vertical-align: middle">
					<input type="button" class="button alt" value="댓글등록" onclick="commentCheck()">
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