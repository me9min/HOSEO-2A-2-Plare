<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, Bean.*" %>

<!DOCTYPE HTML>
<html>
	<head>

<%
	Database database = new Database();
	database.connect();
	
	/* 페이징 시작 */
	//페이지 get 변수가 있다면 받아오고, 없다면 1페이지를 보여준다.
	int page = request.getParameter("page");
	if(page < 1) {
		page = 1;
	}

	/*검색 시작*/
// 	if(isset($_GET['searchColumn']) && isset($_GET['searchText'])){
// 		$java_searchColumn = $_GET['searchColumn'];
// 		$java_searchText = $_GET['searchText'];
// 		$java_link .= 'searchColumn=' . $java_searchColumn . '&searchText=' . $java_searchText;
// 	}
	/* 검색 끝 */
	
	String sql = "select count(*) as cnt from nmrih_itemshop"; // 전체 게시글 구하는 쿼리
	ResultSet rs = database.result_query(sql);

	int allPost = rs.getString("cnt"); //전체 게시글의 수

	if(empty($allPost)) {
		$emptyData = '<tr><td class="textCenter" colspan="7"><center>검색 결과가 존재하지 않습니다.</center></td></tr>';
	} else {
		int onePage = 10; // 한 페이지에 보여줄 게시글의 수.
		int allPage = Math.ceil(allPost / onePage); //전체 페이지의 수

		if(page == 1) //순위 계산
			int no = 1;
		else
			int no = (page - 1) * onePage + 1;

		if(page < 1 && page > allPage) {
%>
			<script>
			alert("<center>존재하지 않는 페이지입니다.</center>");
			history.back();
			</script>
<%
			return;
		}

		int oneSection = 5; //한번에 보여줄 총 페이지 개수(1 ~ 10, 11 ~ 20 ...)
		$currentSection = Math.ceil($page / $oneSection); //현재 섹션
		$allSection = Math.ceil($allPage / $oneSection); //전체 섹션의 수

		$firstPage = ($currentSection * $oneSection) - ($oneSection - 1); //현재 섹션의 처음 페이지

		if($currentSection == $allSection) {
			$lastPage = $allPage; //현재 섹션이 마지막 섹션이라면 $allPage가 마지막 페이지가 된다.
		} else {
			$lastPage = $currentSection * $oneSection; //현재 섹션의 마지막 페이지
		}

		$prevPage = (($currentSection - 1) * $oneSection); //이전 페이지, 11~20일 때 이전을 누르면 10 페이지로 이동.
		$nextPage = (($currentSection + 1) * $oneSection) - ($oneSection - 1); //다음 페이지, 11~20일 때 다음을 누르면 21 페이지로 이동.

		$paging = '<ul>'; // 페이징을 저장할 변수

		//첫 페이지가 아니라면 처음 버튼을 생성
		if($page > $oneSection) {
			$paging .= '<li class="page page_start"><a href="./index.php?page=1">처음</a></li>';
		}
		//첫 섹션이 아니라면 이전 버튼을 생성
		if($currentSection != 1) {
			$paging .= '<li class="page page_prev"><a href="./index.php?page=' . $prevPage . '">이전</a></li>';
		}

		for($i = $firstPage; $i <= $lastPage; $i++) {
			if($i == $page) {
				$paging .= '<li class="page current">' . $i . '</li>';
			} else {
				$paging .= '<li class="page"><a href="./index.php?page=' . $i . '">' . $i . '</a></li>';
			}
		}

		//마지막 섹션이 아니라면 다음 버튼을 생성
		if($currentSection != $allSection) {
			$paging .= '<li class="page page_next"><a href="./index.php?page=' . $nextPage . '">다음</a></li>';
		}

		//마지막 페이지가 아니라면 끝 버튼을 생성
		if($page < $allPage) {
			$paging .= '<li class="page page_end"><a href="./index.php?page=' . $allPage . '">끝</a></li>';
		}
		$paging .= '</ul>';
		/* 페이징 끝 */

		$currentLimit = ($onePage * $page) - $onePage; //몇 번째의 글부터 가져오는지
		$sqlLimit = ' limit ' . $currentLimit . ', ' . $onePage; //limit sql 구문

		$sqls = 'SELECT * FROM nmrih_itemshop ORDER BY cash DESC' . $sqlLimit; //원하는 개수만큼 가져온다. (0번째부터 20번째까지
		$results = $db->query($sqls);
	}
%>
	<script language="javascript">
		function rank_search_pop()
		{
			var searchColumn = document.getElementById('searchColumn').value;
			var searchText = document.getElementById('searchText').value;

			var pop_suburl = "searchColumn=" + searchColumn + "&searchText=" + searchText;

			var pop_main = "./rank_search.php?"+pop_suburl;
			window.open(pop_main, "_bank", "width=990, height=500, resizable=1, scrollbars=1");

			return false;
		}

		function Enter_Submit() {
			if(event.keyCode == 13)
			{
				rank_search_pop();
				event.keyCode = null;
			}
		}
	</script>

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

<body>
	<article class="boardArticle">
		<div id="boardList">
			<form name="title_form">
			<input type="hidden" name="page" value="<% echo $page%>">
			<input type="hidden" name="sort" value="2">
			<input type="hidden" name="sort_cate" value="<% $_GET['sort_cate']%>">
			<table>
				<thead>
					<tr>
						<th scope="col" class="no">번호</th>
						<th scope="col" class="name">닉네임</th>
						<th scope="col" class="steam">스팀 고유번호</th>
						<th scope="col" class="cash">캐시</th>
					</tr>
				</thead>
				<tbody>
					<%
					if(isset($emptyData)) {
						echo $emptyData;
					} else {
						while($rowss = $results->fetch_assoc())
						{
					%>
					<tr>
						<td class="no"><% echo $no++;%></td>
						<td class="name"><% echo $rowss['name']%></td>
						<td class="steam"><% echo $rowss['steam_id']%></td>
						<td class="cash"><% echo $rowss['cash']%></td>
					</tr>
					<%
						}
					}
					%>
				</tbody>
			</table>
			<div class="paging">
				<%=paging %>
			</div>
			<!--<div class="searchBox">
				<form action="" method="get" onsubmit="return false">
					<select id="searchColumn">
						<option <%%> value="name">닉네임</option>
						<option <%%> value="steam_id">스팀 고유번호</option>
						<option <%%> value="cash">캐시</option>
					</select>
					<input type="text" id="searchText" onkeypress="Enter_Submit()" value="">
					<button type="button">검색</button>
				</form>
			</div>-->
		</div>
	</article>


<%@ include file="/assets/include/foot.jsp" %>

</html>