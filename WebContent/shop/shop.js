function insertCheck() {
	if(document.item_insert.unique_id.value == "") {
		alert("아이템 고유 번호를 입력해주세요");
		document.item_insert.unique_id.focus();
		return;
	}
	if(document.item_insert.item_name.value == "") {
		alert("아이템 이름을 입력해주세요");
		document.item_insert.item_name.focus();
		return;
	}
	if(document.item_insert.item_price.value == "") {
		alert("아이템 가격을 입력해주세요");
		document.item_insert.item_price.focus();
		return;
	}
	if(document.item_insert.item_dec.value == "") {
		alert("아이템 설명을 입력해주세요");
		document.item_insert.item_dec.focus();
		return;
	}
	document.item_insert.submit();
}

function updateCheck() {
	if(document.item_update.unique_id.value == "") {
		alert("아이템 고유 번호를 입력해주세요");
		document.item_update.unique_id.focus();
		return;
	}
	if(document.item_update.item_name.value == "") {
		alert("아이템 이름을 입력해주세요");
		document.item_update.item_name.focus();
		return;
	}
	if(document.item_update.item_price.value == "") {
		alert("아이템 가격을 입력해주세요");
		document.item_update.item_price.focus();
		return;
	}
	if(document.item_update.item_dec.value == "") {
		alert("아이템 설명을 입력해주세요");
		document.item_update.item_dec.focus();
		return;
	}
	document.item_update.submit();
}