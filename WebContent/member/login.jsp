<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"/>
<title>로그인</title>
<script type="text/javascript" src="login.js"></script>
<link rel="stylesheet" type="text/css" href="login.css"/>
<style>
	#lmain {
		width: 300px;
		height: 240px;
    }
</style>
</head>
<body>
	<div id="lbox">
	</div>
	<div id="lmain">
		<center>
		<h2 id="lhead">로그인</h2>
		<form method="post" name="login" action="db_login.jsp">
			<table>
				<tr>
					<th>아이디</th>
					<td><input type="text" size="16" name="mem_id"/></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" size="16" name="mem_passwd"/></td>
				</tr>
			</table>
			<input type="reset" value="다시쓰기" class="btn"/>
			<input type="button" value="로그인" class="btn" onClick="loginCheck()"/>
			<br>
			<a onclick="location.href='member_find.jsp'">아이디/비밀번호 찾기</a>
		</form>
	</div>
</body>
</html>