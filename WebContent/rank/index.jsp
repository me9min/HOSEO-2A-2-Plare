<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>랭크</title>
<%@ include file="/assets/include/menu.jsp" %>

		<!-- One -->
			<section id="One" class="wrapper style3">
				<div class="inner">
					<header class="align-center">
						<p>현재 플레이어들의 점수를 실시간으로 확인합니다</p>
						<h2>랭크</h2>
					</header>
				</div>
			</section>

<div id="main" class="container">
	<div class="table-wrapper">
		<div class="row uniform">
			<div class="9u 12u$(small)">
				<input type="text" name="query" id="query" value="" placeholder="닉네임,스팀고유번호 로 검색" />
			</div>
			<div class="3u$ 12u$(small)">
				<input type="submit" value="Search" class="fit" />
			</div>
		</div>

		<table class="table table-hover">
			<thead>
				<tr>
					<th>순위</th>
					<th>닉네임</th>
					<th>스팀고유번호</th>
					<th>점수</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>1</td>
					<td>플레어</td>
					<td>STEAM_1:1:52589830</td>
					<td>1999</td>
				</tr>
				<tr>
					<td>2</td>
					<td>Salong</td>
					<td>STEAM_0:1:4318672</td>
					<td>1347</td>
				</tr>
				<tr>
					<td>3</td>
					<td>tah</td>
					<td>STEAM_0:0:3356981</td>
					<td>326</td>
				</tr>
				<tr>
					<td>4</td>
					<td>oh</td>
					<td>STEAM_0:0:0001002</td>
					<td>0</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="5">
					<center>
						<ul class="actions">
							<li><a href="#" class="button alt">1</a></li>
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