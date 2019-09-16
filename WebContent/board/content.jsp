<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
	<form  method="post" name="writeform" 
      action="writePro.jsp" onsubmit="return writeSave()">
		<center><h3>자유게시판</h3></center><br>
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
			<tr id="border" style="background-color:#ffffff;">
				<td></td>
				<td align="center"><button id="button">추천하기</button></td>
			</tr>
			<tr>
				<td></td>
				<td align="right">조회수 추천수 댓글수</td>
			</tr>
		</table>
		</div>
		</form>
		<table bgcolor="#eeeeee">
			<tr>
				<td align="center" style="vertical-align: middle">계정닉네임</td>
				<td style="vertical-align: middle"><input type="text" style="width:300px; hiehgt:50px"></td>
				<td> <button>댓글등록</button></td>
			</tr>
		</table>
	</div>

<%@ include file="/assets/include/foot.jsp" %>

</body>
</html>