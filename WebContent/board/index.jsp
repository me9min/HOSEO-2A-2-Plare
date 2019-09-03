<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>게시판</title>
<%@ include file="/assets/include/menu.jsp" %>

		<!-- One -->
			<section id="One" class="wrapper style3">
				<div class="inner">
					<header class="align-center">
						<p>게시글을 올리는 커뮤니티입니다</p>
						<h2>게시판</h2>
					</header>
				</div>
			</section>

<div id="main" class="container">
	<div class="table-wrapper">
		<a href="daumeditor/editor.html" class="button alt pull-right">글쓰기</a>
		<caption>자유게시판</caption>
		<table class="table table-hover">
			<thead>
				<tr>
					<th>번호</th>
					<th>작성자</th>
					<th>제목</th>
					<th>작성일자</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>4</td>
					<td>admin</td>
					<td>[블로그] 스토리보드 member(+내정보)</td>
					<td>2019/8/13</td>
					<td>3</td>
				</tr>
				<tr>
					<td>3</td>
					<td>admin</td>
					<td>[블로그] 스토리보드 member</td>
					<td>2019/8/12</td>
					<td>3</td>
				</tr>
				<tr>
					<td>2</td>
					<td>admin</td>
					<td>[블로그] 스토리보드 메인(index)</td>
					<td>2019/8/7</td>
					<td>1</td>
				</tr>
				<tr>
					<td>1</td>
					<td>admin</td>
					<td>[블로그] 홈페이지 디자인 견적</td>
					<td>2019/7/30</td>
					<td>0</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="5">
					<center>
						<ul class="actions">
							<li><a href="#" class="button alt">1</a></li>
							<li><a href="#" class="button alt">2</a></li>
						</ul>
					</center>
					</td>
				</tr>
			</tfoot>
		</table>
	</div>
</div>

<%@ include file="/assets/include/foot.jsp" %>

</html>