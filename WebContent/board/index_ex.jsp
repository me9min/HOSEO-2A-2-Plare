<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>자유게시판</title>
		<script language="JavaScript" src="login.js"></script>
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
			
		<!-- main -->
			<section id="two" class="wrapper style2">
				<div class="inner">
					<div class="box">
						<div class="content">
							<header class="align-center">
								<p>자유롭게 올릴수있는 게시판</p>
								<h2>자유게시판</h2>
							</header>

<div class="table-wrapper">
	<a href="write" class="button alt pull-right">글쓰기</a>
	<caption>자유게시판</caption>
	<table class="table table-hover">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일자</th>
				<th>조회</th>
				<th>추천</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>4</td>
				<td>[블로그] 스토리보드 member(+내정보)</td>
				<td>admin</td>
				<td>2019/8/13</td>
				<td>3</td>
				<td>1</td>
			</tr>
			<tr>
				<td>3</td>
				<td>[블로그] 스토리보드 member</td>
				<td>admin</td>
				<td>2019/8/12</td>
				<td>3</td>
				<td>0</td>
			</tr>
			<tr>
				<td>2</td>
				<td>[블로그] 스토리보드 메인(index)</td>
				<td>admin</td>
				<td>2019/8/7</td>
				<td>1</td>
				<td>0</td>
			</tr>
			<tr>
				<td>1</td>
				<td>[블로그] 홈페이지 디자인 견적</td>
				<td>admin</td>
				<td>2019/7/30</td>
				<td>0</td>
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
					</div>
				</div>
			</section>

<%@ include file="/assets/include/foot.jsp" %>

</html>