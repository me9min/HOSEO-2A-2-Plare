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
		#blank {text-align: right; width: 5%;}
	</style>
	<script language="JavaScript" src="write.js"></script>
<%@ include file="/assets/include/menu.jsp" %>
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
        new SimpleDateFormat("yyyy-MM-dd hh:mm");
   	

   try{
      BoardBean article = board.getArticle("issue", num);
      String nickname_writer = board.getNickname(article.getWriter());
      String edit_date = "";
      if(article.getEdit_date() != null) {
    	  edit_date = sdf.format(article.getEdit_date());
      }
%>
<head>
<title><%=article.getTitle() %></title>
</head>
<body>

	<section id="One" class="wrapper style3">
				<div class="inner">
					<header class="align-center">
						<p>게시글을 올리는 커뮤니티입니다</p>
						<h2>게시판</h2>
					</header>
				</div>
			</section>
	<div id="main" class="container" >
		<div class="table-wrapper">
		<a href="./" class="button alt pull-right">글목록</a><br><br>
		<table class="table">
			<tr>
				<td align="center" width="20%" style="vertical-align: middle">제목</td>
				<td><%=article.getTitle() %></td>
			</tr>
			<tr>
				<td align="center" style="vertical-align: middle">작성자</td>
				<td><%=nickname_writer %>(<%=article.getIp() %>)</td>
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
				<td align="center" style="vertical-align: middle">내용</td>
				<td><%=article.getContent() %></td>
			</tr>
			<tr>
				<td align="center" style="vertical-align: middle">파일다운로드</td>
				<td><a id="downA" href="#"><%=article.getFile_name() %></a></td>
			</tr>
<%
	if(email.equals(article.getWriter())) {
%>
			<tr style="background-color:#ffffff; border:hidden;">
				<td colspan="2" align="right">
					<a href="edit.jsp?num=<%=article.getNum() %>" class="button special">수정</a>
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
					<textarea name="content_update" id="content_update" style="width:100%;height:100px;resize: none;"><%=comment.getContent() %></textarea>
				</form>
				</td>
			</tr>
			<tr id="update<%=count*2 %>" style="display:none;">
				<td colspan="3" align="right" style="vertical-align: middle">
					<input type="button" class="button alt" value="댓글수정" onclick="updateCheck()">
				</td>
			</tr>
			<tr id="reply<%=count*2-1 %>" style="display:none; background-color:#ffffff">
				<td width="5%">&nbsp;</td>
				<td width="15%" align="center" style="vertical-align: middle"><%=nickname %></td>
				<td height="100px" style="vertical-align: middle">
					<form method="post" name="reply_hidden">
						<input type="hidden" name="count1" value="<%=count*2-1 %>">
						<input type="hidden" name="count2" value="<%=count*2 %>">
						<textarea name="content_reply" id="content_reply" style="width:100%;height:100px;resize: none;"></textarea>
					</form>
				</td>
			</tr>
			<tr id="reply<%=count*2 %>" style="display:none;">
				<td colspan="3" align="right" style="vertical-align: middle">
					<a class="button alt" onclick="replyCheck()">답글등록</a>
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

<script type="text/javascript">
	// 영문파일은 그냥 다운로드 클릭시 정상작동하지만 한글파일명을 쿼리문으로 날릴경우 인코딩 문제가 발생할 수 있다. 한글이 깨져 정상작동하지 않을 수 있음
	// 따라서, 쿼리문자열에 한글을 보낼 때는 항상 인코딩을 해서 보내주도록 하자.
	document.getElementById("downA").addEventListener("click", function(event) {
		event.preventDefault();// a 태그의 기본 동작을 막음
		event.stopPropagation();// 이벤트의 전파를 막음
		// fileName1을 utf-8로 인코딩한다.
		var fName = encodeURIComponent("<%=article.getFile_url() %>");
		// 인코딩된 파일이름을 쿼리문자열에 포함시켜 다운로드 페이지로 이동
		window.location.href ="fileDown1.jsp?file_name="+fName;
	});
</script>