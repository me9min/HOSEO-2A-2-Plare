<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>공지게시판</title>	
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
<%@ include file="/assets/include/menu.jsp" %>

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
		<center><h3>문의/신고게시판</h3></center><br>
		<div class="table-wrapper">
		<table class="table">
			<tr>
				<td align="center" style="vertical-align: middle">제목</td>
				<td>제목</td>
			</tr>
			<tr>
				<td align="center" style="vertical-align: middle">작성자</td>
				<td>작성자</td>
			</tr>
			<tr>
				<td align="center" style="vertical-align: middle">작성일</td>
				<td>2019-09-16</td>
			</tr>
			<tr>
				<td height="300px" align="center" style="vertical-align: middle">내용</td>
				<td height="300px">내용</td>
			</tr>
			<tr style="border-bottom:hidden;background-color:#ffffff">
				<td></td>
				<td align="right">조회수 댓글수</td>
			</tr>
		</table>
		<table bgcolor="#eeeeee">
			<tr>
				<td align="center" style="vertical-align: middle">계정닉네임</td>
				<td height="100px" style="vertical-align: middle"><textarea style="width:100%;height:100px;"></textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="right" style="vertical-align: middle"><button>댓글등록</button></td>
			</tr>
		</table>
		</div>
	</div>

<%@ include file="/assets/include/foot.jsp" %>

</body>
</html>