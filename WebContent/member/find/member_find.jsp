<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"/>
<title>아이디/비밀번호 찾기</title>
<script type="text/javascript" src="login.js"></script>
<link rel="stylesheet" type="text/css" href="login.css"/>
<style>
	#lmain {
		width: 300px;
		height: 220px;
    }
</style>
</head>
<body>
	<div id="lbox">
	</div>
	<div id="lmain">
		<center>
		<h2 id="lhead">아이디/비밀번호 찾기</h2>
		<form method="post" name="find" action="db_member_find.jsp">
			<table>
				<tr>
					<th>이메일</th>
					<td><input type="text" size="16" name="mem_email"/></td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td><input type="text" size="16" name="mem_phone"/></td>
				</tr>
			</table>
			<input type="reset" value="다시쓰기" class="btn"/>
			<input type="button" value="찾기" class="btn" onClick="findCheck()"/>
		</form>
	</div>
</body>
</html>