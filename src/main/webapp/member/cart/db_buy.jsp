<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Bean.Cart" %>
<%@ include file="/assets/include/login_check.jsp" %>
<%@ include file="/assets/include/steamid_check.jsp" %>
<%
	String id[] = request.getParameterValues("checkItem");
	Cart cart = Cart.getInstance();
	int error = 0;
	
	for(int i=0; i<id.length; i++) {
		cart.buyCart(email, id[i]);
		if(error == 3) {
%>
			<script>
				alert("오류가 발생했습니다. 다시 시도해주세요.");
				window.location = './';
			</script>
<%		
			break;
		} else if(error == 2) {
%>
			<script>
				alert("이미 구매한 아이템이 있습니다. ");
				window.location = './';
			</script>
<%		
			break;
		} else if(error == 1) {
%>
			<script>
				alert("잔액이 부족합니다.");
				window.location = './';
			</script>
<%
			break;
		}
	}
%>
	<script>
		if (confirm("성공적으로 구매가 완료되었습니다. 인벤토리로 이동하시겠습니까?") == true){
			window.location = '../inventory';
		} else {
			window.loaction = './';
		}
	</script>