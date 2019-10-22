function deleteCheck() {
	var checkboxCheck = false;
    var checkItem = document.getElementsByName("checkItem");
    for(var i=0;i<checkItem.length;i++){
        if(checkItem[i].checked == true) {
        	checkboxCheck = true;
            break;
        }
    }

    if(!checkboxCheck){
        alert("아이템을 한 개 이상 선택해주세요.");
        return;
    }
	
	document.cart_select.action = "db_deletes.jsp";
	document.cart_select.submit();
}

function buyCheck() {
	var checkboxCheck = false;
    var checkItem = document.getElementsByName("checkItem");
    for(var i=0;i<checkItem.length;i++){
        if(checkItem[i].checked == true) {
        	checkboxCheck = true;
            break;
        }
    }

    if(!checkboxCheck){
        alert("아이템을 한 개 이상 선택해주세요.");
        return;
    }
	
	document.cart_select.action = "buy_confirm.jsp";
	document.cart_select.submit();
}