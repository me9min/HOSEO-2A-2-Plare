<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8");%>
<%@ page import = "Bean.*,java.util.*,java.text.SimpleDateFormat" %>

<%@ include file="/assets/include/login_check.jsp" %>
<jsp:useBean id="member" class="Bean.Member" />
<%!
	int pageSize = 15;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
%>

<%
	request.setCharacterEncoding("utf-8");
    String pageNum = request.getParameter("pageNum");
	String admin = "admin@plare.cf";
	
    if (pageNum == null) {
        pageNum = "1";
    }
	
    int currentPage = Integer.parseInt(pageNum);
    int startRow = pageSize*(currentPage-1);
    int count = 0;
    List<HistoryBean> articleList = null;
    
    History history = History.getInstance();
    count = history.getHistoryCount(email);
    
    String con = request.getParameter("con");
	String q = request.getParameter("q");
	articleList = history.getHistory(email, startRow, pageSize, con, q);
    
	String pname = "10000P 추가";
	int price = 10000;
	
	MemberBean member_sql = member.load_info(email);
	
	String nickname = member_sql.getNickname();
	if(nickname == null) {nickname = "";}
	String phone = member_sql.getPhone();
	if(phone == null) {phone = "";}
	String address_road = member_sql.getAddress_road();
	if(address_road == null) {address_road = "";}
	String address_detail = member_sql.getAddress_detail();
	if(address_detail == null) {address_detail = "";}
	String zipcode = member_sql.getZipcode();
	if(zipcode == null) {zipcode = "";}
%>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript">
var IMP = window.IMP; // 생략가능
IMP.init('imp35661052'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
function request_buy(){
	IMP.request_pay({
		pg : 'kakao', // version 1.1.0부터 지원.
		pay_method : 'card',
		merchant_uid : 'merchant_' + new Date().getTime(),
		name : '<%=pname%>',
		amount : <%=price%>,
		buyer_email : '<%=email%>',
		buyer_name : '<%=nickname%>',
		buyer_tel : '<%=phone%>',
		buyer_addr : '<%=address_road+" "+address_detail%>',
		buyer_postcode : '<%=zipcode%>',
		m_redirect_url : 'http://localhost/shop/db_buy.jsp'
	}, function(rsp) {
		if ( rsp.success ) {
			var msg = '결제가 완료되었습니다.';
			msg += '고유ID : ' + rsp.imp_uid;
			msg += '상점 거래ID : ' + rsp.merchant_uid;
			msg += '결제 금액 : ' + rsp.paid_amount;
			msg += '카드 승인번호 : ' + rsp.apply_num;
		} else {
			var msg = '결제에 실패하였습니다.';
			msg += '에러내용 : ' + rsp.error_msg;
		}
		alert(msg);
	});
}
</script>

<!DOCTYPE HTML>
<html>
	<head>
		<title><%=email %>님의 지갑</title>
		<style>
			td {color: black; background-color: #ffffff;}
			#thead {text-align: center; background-color: black; color: white;}
			#con {display: inline; width: 100px;}
			#q {display: inline; width: 300px;}
			#link {color: black; text-decoration: none;}
			#link:visited {color: black; text-decoration: none;}
			#link:hover {color: #ff0000; text-decoration: none;}
		</style>
<%@ include file="/assets/include/menu_member.jsp" %>
<%@ include file="/assets/include/member_top.jsp" %>

		<!-- main -->
			<section id="two" class="wrapper style2">
				<div class="inner">
					<div class="box">
						<div class="content">
							<input type="button" value="10000P구매" onclick="request_buy()"/>
							<header class="align-center">
								<h2>구매기록</h2>
							</header>
	<div class="table-wrapper">
<%
	if(email.equals(admin)) {
%>
		<a href="write.jsp" class="button special pull-right">글쓰기</a><br><br>
<% 
	} else {
%>
		<br><br>
<%
	}
	if(count == 0) { %>
		<table>
			<tr>
				<td><center>구매기록이 존재하지 않습니다.</center></td>
			</tr>
		</table>
<% } else { %>
		<table class="table table-hover">
			<thead>
				<tr>
					<td width="50%" id="thead">상품</td>
					<td id="thead">종류</td>
					<td id="thead">수량</td>
					<td id="thead">구매일자</td>
					<td id="thead">구매액</td>
				</tr>
			</thead>
<%  
		for (int i = 0 ; i < articleList.size() ; i++) {
		  HistoryBean article = articleList.get(i);
%>
			<tbody>
				<tr>
					<td width="50%" align="center"><%=article.getItem_name() %></td>
					<td align="center"><%=article.getItem_type() %></td>
					<td align="center">1</td>
					<td align="center"><%=article.getDate_of_purchase() %></td>
					<td align="center"><%=article.getPrice_of_purchase() %></td>
				</tr>
			</tbody>
<% 		}
	}
%>
			<tfoot>
				<tr>
					<td colspan="6">
					<center>
<%
    if (count > 0) {
        int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		int startPage = 1;
		
		if(currentPage % 5 != 0)
           startPage = (int)(currentPage/5)*5 + 1;
		else
           startPage = ((int)(currentPage/5)-1)*5 + 1;

		int pageBlock = 5;
        int endPage = startPage + pageBlock - 1;
        if (endPage > pageCount) endPage = pageCount;
        
        if (startPage > 5) { %>
        	<a href="index.jsp?pageNum=<%= startPage - 5 %>" id="link">&lt;</a>
<%      }
        
        for (int i = startPage ; i <= endPage ; i++) {  %>
        	<a href="index.jsp?pageNum=<%= i %>" id="link" <%if (i == currentPage) {%> style="font-weight:bold; color:#ff0000;"<% } %>>[<%= i %>]</a>
<%      }
        
        if (endPage < pageCount) {  %>
   	     	<a href="index.jsp?pageNum=<%= startPage + 5 %>" id="link">&gt;</a>
<%
        }
    }
%>
					</center>
					</td>
				</tr>
				<tr>
					<td colspan="6" style="text-align:center; border:none;">
					<form method="get" name="search" action="index.jsp">
						<select name="con" id="con">
							<option value="title">이름</option>
							<option value="content">설명</option>
							<option value="all">이름+설명</option>
							<option value="amount">수량</option>
							<option value="price">가격</option>
						</select>
						<input type="text" name="q" id="q"> 
						<input type="submit" value="검색" class="button alt">
					</form>
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