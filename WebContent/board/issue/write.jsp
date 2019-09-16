<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="board" class="Bean.Board"/>
<%@ page import = "java.sql.Timestamp" %>
<%@ page import = "java.text.SimpleDateFormat" %>
    
<%
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	String ip = null;
	if (null != request.getRemoteAddr()) {
		ip = request.getRemoteAddr();
		if (null != request.getRemoteHost()) {
			ip = request.getRemoteHost();
			if (null != request.getHeader("x-forwarded-for")) {
				ip = request.getHeader("x-forwarded-for");
			}
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
	<title>게시판</title>	
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
	<script language="JavaScript" src="write.js"></script>
<%@ include file="/assets/include/menu.jsp" %>

<%
	if(email == null) {
%>
		<script>
			if(confirm("로그인이 필요합니다 로그인 하시겠습니까?") == true) {
				location.replace('/member/login');
			}
			else {
				history.back();
			}
		</script>
<%
	} else {
		String nickname = board.getNickname(email);
%>
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
	<form method="post" name="write" action="db_write.jsp">
		<input type="hidden" name="ip" id="ip" value="<%=ip %>" readonly />
		<div class="table-wrapper">
		<table class="table">
			<tr>
				<td align="center" style="vertical-align: middle">제목</td>
				<td><input type="text" name="title" id="title" style="background-color:transparent;"></td>
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
				<td height="300px" align="center" style="vertical-align: middle">내용</td>
				<td height="300px"><textarea name="content" id="content" style="height:300px; background-color:transparent;"></textarea></td>
			</tr>
			</form>
			<tr id="border" style="background-color:#ffffff;">
				<td></td> 
				<td align="right"><input type="submit" value="글쓰기" class="button special" onClick=""></td>
			</tr>
		</table>
		</div>

	</div>

<%@ include file="/assets/include/foot.jsp" %>

</body>
<% } %>
</html>