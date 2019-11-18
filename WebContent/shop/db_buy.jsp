<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@ page import="Bean.Shop" %>
<%@ include file="/assets/include/login_check.jsp" %>
<%@ include file="/assets/include/steamid_check.jsp" %>
<%
	Shop shop = Shop.getInstance();
	String id = request.getParameter("id");
	
	int error = shop.buyItem(email, id);
	if(error == 3) {
%>
		<script>
			alert("오류가 발생했습니다. 다시 시도해주세요.");
			window.location = './';
		</script>
<%		
	} else if(error == 2) {
%>
		<script>
			alert("이미 구매한 아이템입니다. ");
			window.location = './';
		</script>
<%		
	} else if(error == 1) {
%>
		<script>
			alert("잔액이 부족합니다.");
			window.location = './';
		</script>
<%
	}
%>
<script>
	if (confirm("성공적으로 구매가 완료되었습니다. 인벤토리로 이동하시겠습니까?") == true){
		window.location = '../member/inventory';
	} else {
		window.loaction = './';
	}
</script>