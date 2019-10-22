<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "Bean.Board" %>
<%@ page import = "Bean.BoardBean" %>
<%@ page import = "java.sql.Timestamp" %>
<%@ page import = "java.text.SimpleDateFormat" %>

<%@ include file="/assets/include/login_check.jsp" %>
    
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
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link rel="stylesheet" href="/assets/daumeditor/css/editor.css" type="text/css" charset="utf-8"/>
	<script src="/assets/daumeditor/js/editor_loader.js?environment=development" type="text/javascript" charset="utf-8"></script>
	<script language="JavaScript" src="write.js"></script>
	
<%@ include file="/assets/include/menu_member.jsp" %>

<%@ include file="/assets/include/board_top.jsp" %>

	<div id="main" class="container">
	<form method="post" name="tx_editor_form" action="db_edit.jsp?num=<%=num %>" accept-charset="utf-8">
		<input type="hidden" name="reply_num" value="<%=request.getParameter("num") %>">
		<div class="table-wrapper">
		<table class="table">
			<tr>
				<td width="30%" align="center" style="vertical-align: middle">제목</td>
				<td width="70%"><input type="text" name="title" id="title" value="<%=article.getTitle() %>" style="background-color:transparent;"></td>
			</tr>
			<tr>
				<td align="center" style="vertical-align: middle">작성자</td>
				<td><%=nickname %></td>
			</tr>
			<tr>
				<td align="center" style="vertical-align: middle">작성일</td>
				<td><%=sdf.format(new Timestamp(System.currentTimeMillis())) %></td>
			</tr>
			<tr>
				<td align="center" style="vertical-align: middle">내용</td>
				<td>
					<%@ include file="/assets/daumeditor/editor_edit.jsp" %>
				</td>
			</tr>
			<tr id="border" style="background-color:#ffffff;">
				<td></td> 
				<td align="right"><input type="button" value="수정" class="button special" onclick="saveContent()"></td>
			</tr>
		</table>
		</div>
	</form>
	</div>

<%@ include file="/assets/include/foot.jsp" %>

</body>
<% } catch(Exception e) {} %>
</html>