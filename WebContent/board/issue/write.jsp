<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="board" class="Bean.Board"/>
<%@ page import = "java.sql.Timestamp" %>
<%@ page import = "java.text.SimpleDateFormat" %>

<%@ include file="/assets/include/login_check.jsp" %>
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
	<script language="JavaScript" src="write.js"></script>
<%@ include file="/assets/include/menu_member.jsp" %>

<%
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	String nickname = board.getNickname(email);
%>

		<!-- One -->
			<section id="One" class="wrapper style3">
				<div class="inner">
					<header class="align-center">
						<p>게시글을 올리는 커뮤니티입니다</p>
						<h2>게시판</h2>
					</header>
				</div>
			</section>
			
		<!-- main -->
			<section id="two" class="wrapper style2">
				<div class="inner">
					<div class="box">
						<div class="content">
							<header class="align-center">
							</header>

	<form method="post" name="write" action="db_write.jsp" enctype="Multipart/form-data">
		<div class="table-wrapper">
		<table class="table">
			<tr>
				<td align="center" style="vertical-align: middle">제목</td>
				<td><input type="text" name="title" id="title" style="background-color:transparent;"></td>
			</tr>
			<tr>
				<td align="center" style="vertical-align: middle">작성일</td>
				<td><%=sdf.format(new Timestamp(System.currentTimeMillis())) %></td>
			</tr>
			<tr>
				<td colspan="2"><%@ include file="editor.jsp" %></td>
			</tr>
			<tr>
				<td>파일업로드</td>
				<td><input type="file" name="file" /></td>
			</tr>
			</form>
			<tr id="border" style="background-color:#ffffff;">
				<td colspan="2" align="right"><input type="submit" value="글쓰기" class="button special" onClick=""></td>
			</tr>
		</table>

				</div>
			</div>
		</div>
	</div>
</section>

<%@ include file="/assets/include/foot.jsp" %>

</html>