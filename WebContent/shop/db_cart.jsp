<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "Bean.Cart" %>
<%@ include file="/assets/include/login_check.jsp" %>
<%@ include file="/assets/include/steamid_check.jsp" %>
<%
	int menu_id = Integer.parseInt(request.getParameter("id"));
	
	Cart cart = Cart.getInstance();
	int error = cart.InsertCart(email, menu_id);
	
	if(error == 3) {
%>
	<script>
		alert("오류가 발생했습니다. 다시 시도해주세요.");
		history.back();
	</script>
<%
	} else if(error == 2) {
%>
	<script>
		alert("이미 장바구니에 들어있는 상품입니다.");
		history.back();
	</script>
<%		
	} else if(error == 1) {
%>
	<script>
		alert("이미 구매한 상품입니다.");
		history.back();
	</script>
<%
	} else {
%>
	<script>
		if(confirm("장바구니에 성공적으로 담겼습니다. 장바구니로 이동하시겠습니까?") == true) {
			location.replace('../member/cart/');
		}
		else {
			history.back();
		}
	</script>
<%
	}
%>