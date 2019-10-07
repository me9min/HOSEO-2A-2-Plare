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
		#blank {text-align: right; width: 5%; word-break:break-all;}
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
	
    List<BoardBean> commentList = null;
    commentList = board.getComments(num);
    int commentCount = 0;
    if(commentList != null) {
    	commentCount = commentList.size();
    }
	
   	SimpleDateFormat sdf = 
        new SimpleDateFormat("yyyy-MM-dd HH:mm");
   	

   try{
      BoardBean article = board.getArticle("free", num);
      String nickname_writer = board.getNickname(article.getWriter());
      String edit_date = "";
      if(article.getEdit_date() != null) {
    	  edit_date = sdf.format(article.getEdit_date());
      }
%>
<head>
<title><%=article.getTitle() %></title>
</head>
<%@ include file="/assets/include/board_top.jsp" %>

	<div id="main" class="container" >
		<center><h3>자유게시판</h3></center><br>
		<div class="table-wrapper">
		<a href="./" class="button alt pull-right">글목록</a><br><br>
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
					<a href="edit.jsp?num=<%=article.getNum() %>" class="button alt">수정</a> 
					<a href="db_delete.jsp?num=<%=article.getNum() %>" class="button alt">삭제</a> 
				</td>
			</tr>
<%
	}
%>
			<tr id="border" style="background-color:#ffffff;">
				<td colspan="2" align="center">
					<a href="db_up.jsp?num=<%=num %>" class="button alt" >추천하기</a>
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
	   	for (int i = 0; i < commentList.size(); i++) {
			  BoardBean comment = commentList.get(i);
			  String nicknameComment = board.getNickname(comment.getWriter());
			  
			  List<BoardBean> replyList = null;
			  replyList = board.getReplys(comment.getNum());
%>
			<tr style="background-color:#ffffff;border-bottom:hidden;" >			
				<td colspan="4" style="vertical-align:middle;">
					<p style="display:inline; font-weight:bold;"><%=nicknameComment %></p>
					<p style="display:inline; font-size:10px; color:gray"><%=sdf.format(comment.getReg_date()) %></p>
				</td>
			</tr>
			<tr style="background-color:#ffffff">
				<td id="blank">&nbsp;</td>
				<td colspan="2" style="vertical-align: middle">
					<pre style="background:transparent; border:hidden; font-family:'Nanum Gothic', sans-serif; padding:0px;"><%=comment.getContent() %></pre>
				</td>
				<td style="text-align:right; vertical-align:bottom;">
<%
			if(email.equals(comment.getWriter())) {
%>
					<p style="display:inline;" id="link" onclick="updateShow(<%=count %>)">수정</p>
					<p style="display:inline;" id="link" onclick="window.location='db_comment_delete.jsp?commentNum=<%=comment.getNum()%>&num=<%=num%>'">삭제</p>
<%
			}
%>
					<p style="display:inline;" id="link" onclick="replyShow(<%=count %>)">답글</p>
				</td>
			</tr>
			<tr id="update<%=count %>" style="display:none; background-color:#ffffff">
				<td align="center" style="vertical-align: middle"><%=nickname %></td>
				<td colspan="3" height="100px" style="vertical-align: middle">
				<form method="post" name="commentUpdate" action="db_comment_update.jsp">
					<input type="hidden" name="num" value="<%=num %>">
					<input type="hidden" name="commentNum" value="<%=comment.getNum() %>">
					<textarea name="content" id="content" style="display:inline;width:90%;height:100px;resize: none;"><%=comment.getContent() %></textarea>
					<input type="submit" class="button alt" value="댓글수정">
				</form>
				</td>
			</tr>
			<tr id="reply<%=count %>" style="display:none; background-color:#ffffff">
				<td align="center" style="vertical-align: middle"><%=nickname %></td>
				<td colspan=3" height="100px" style="vertical-align: middle">
				<form method="post" name="reply_hidden" action="db_comment_reply.jsp">
					<input type="hidden" name="num" value="<%=num %>">
					<input type="hidden" name="commentNum" value="<%=comment.getNum() %>">
					<textarea name="content" id="content" style="display:inline;width:90%;height:100px;resize: none;"></textarea>
					<input type="submit" class="button alt" value="답글등록">
				</form>
				</td>
			</tr>
<%
			if(replyList != null) {
				for (int j = 0; j < replyList.size(); j++) {
				  BoardBean reply = replyList.get(j);
				  String nicknameReply = board.getNickname(reply.getWriter());
%>
			<tr style="background-color:#ffffff;border-bottom:hidden;" >
				<td id="blank">┕</td>
				<td colspan="3" style="vertical-align:middle;">
					<p style="display:inline; font-weight:bold;"><%=nicknameReply %></p>
					<p style="display:inline; font-size:10px; color:gray"><%=sdf.format(reply.getReg_date()) %></p>
				</td>
			</tr>
			<tr style="background-color:#ffffff">
				<td id="blank">&nbsp;</td>
				<td id="blank" nowrap>&nbsp;</td>
				<td style="vertical-align: middle">
					<pre style="background:transparent; border:hidden; font-family:'Nanum Gothic', sans-serif; padding:0px;"><%=reply.getContent() %></pre>
				</td>
				<td style="text-align:right; vertical-align:bottom;">
<%
			if(email.equals(reply.getWriter())) {
%>
					&nbsp;
					<p style="display:inline;" id="link" onclick="updateReplyShow(<%=count %>)">수정</p>
					<p style="display:inline;" id="link" onclick="window.location='db_comment_delete.jsp?commentNum=<%=reply.getNum()%>&num=<%=num%>'">삭제</p>
<%
			}
%>
				</td>
			</tr>
			<tr id="updateReply<%=count %>" style="display:none; background-color:#ffffff">
				<td align="center" style="vertical-align: middle"><%=nicknameReply %></td>
				<td colspan="3" height="100px" style="vertical-align: middle">
				<form method="post" name="commentUpdate" action="db_comment_update.jsp">
					<input type="hidden" name="num" value="<%=num %>">
					<input type="hidden" name="commentNum" value="<%=reply.getNum() %>">
					<textarea name="content" id="content" style="display:inline;width:90%;height:100px;resize: none;"><%=reply.getContent() %></textarea>
					<input type="submit" class="button alt" value="댓글수정">
				</form>
				</td>
			</tr>
<%
				}
			}
			count++;
	   	}
%>
		</table>
<%
   	}
	if(email != "") {
%>
		<form method="post" name="comment_board" action="db_write_comment.jsp">
		<input type="hidden" name="num_board" value="<%=num %>">
		
		<table>
			<tr style="background-color:#ffffff">
				<td align="center" style="width:15%; vertical-align: middle"><%=nickname %></td>
				<td height="100px" style="vertical-align: middle">
					<textarea name="content" id="content" style="width:100%;height:100px;resize: none;"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="right" style="vertical-align: middle">
					<a class="button alt" onclick="commentCheck()">댓글등록</a>
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