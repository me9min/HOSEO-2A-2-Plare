<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"/>
<title>회원가입</title>
<script type="text/javascript" src="login.js"></script>
<link rel="stylesheet" type="text/css" href="login.css"/>
<style>
	#lmain {
		width: 300px;
		height: 460px;
    }
</style>
</head>
<body>
	<div id="lbox">
	</div>
	<div id="lmain">
		<center>
		<h2 id="lhead">회원가입</h2>
		<form method="post" name="register" action="db_register.jsp">
			<table>
				<tr>
					<th>아이디*</th>
					<td><input type="text" size="16" name="mem_id"/></td>
				</tr>
				<tr>
					<th>비밀번호*</th>
					<td><input type="password" size="16" name="mem_passwd"/></td>
				</tr>
				<tr>
					<th>비밀번호 확인*</th>
					<td><input type="password" size="16" name="mem_repasswd"/></td>
				</tr>
				<tr>
					<th>이름*</th>
					<td><input type="text" size="16" name="mem_name"/></td>
				</tr>
				<tr>
					<th>주민번호 앞자리*</th>
					<td><input type="text" size="16" name="mem_num1"/></td>
				</tr>
				<tr>
					<th>주민번호 뒷자리*</th>
					<td><input type="text" size="16" name="mem_num2"/></td>
				</tr>
				<tr>
					<th>이메일*</th>
					<td><input type="text" size="16" name="mem_email"/></td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td><input type="text" size="16" name="mem_phone"/></td>
				</tr>
				<tr>
					<th>zip코드</th>
					<td><input type="text" size="16" name="mem_zipcode"/></td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input type="text" size="16" name="mem_address"/></td>
				</tr>
				<tr>
					<th>직업</th>
					<td><input type="text" size="16" name="mem_job"/></td>
				</tr>
			</table>
			<input type="reset" value="다시쓰기" class="btn"/>
			<input type="button" value="회원가입" class="btn" onClick="inputCheck()"/>
		</form>
	</div>
</body>
</html>
