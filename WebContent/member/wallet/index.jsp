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
	String category = "motd";
    String pageNum = request.getParameter("pageNum");
	String admin = "admin@plare.cf";
	
    if (pageNum == null) {
        pageNum = "1";
    }

    int currentPage = Integer.parseInt(pageNum);
    int startRow = (currentPage - 1) * pageSize + 1;
    int endRow = currentPage * pageSize;
    int count = 0;
    List<BoardBean> articleList = null; 
    
    Board board = Board.getInstance();
    count = board.getArticleCount(category);
    
    String condition = request.getParameter("condition");
	String q = request.getParameter("q");
    if (condition != null) {
	    count = board.getSearchCount(category, condition, q);
    	System.out.println(category + condition + q);
	    
	    if (count > 0) {
	        articleList = board.getSearchResults(category, startRow, pageSize, condition, q);
	    }
    } else {
	    count = board.getArticleCount(category);
	    
	    if (count > 0) {
	        articleList = board.getArticles(category, startRow, pageSize);
	    }
    }
    
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
			#condition {display: inline; width: 100px;}
			#q {display: inline; width: 300px;}
			#link {color: black; text-decoration: none;}
			#link:visited {color: black; text-decoration: none;}
			#link:hover {color: #ff0000; text-decoration: none;}
		</style>
<%@ include file="/assets/include/menu_member.jsp" %>
<%@ include file="/assets/include/member_top.jsp" %>

<input type="button" value="10000P구매" onclick="request_buy()"/>





<%@ include file="/assets/include/foot.jsp" %>

</html>