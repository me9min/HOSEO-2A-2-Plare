function motdCheck() {
	// 반드시 채워져야하는 항목이 채워져있는지 확인 후 submit하는 함수
	
	if(document.tx_editor_form.title.value == "") {
		alert("제목을 입력해주세요");
		document.tx_editor_form.title.focus();
		return;
	}
	if(document.motd.content.value == "") {
		alert("내용을 입력해주세요");
		document.motd.content.focus();
		return;
	}
	document.tx_editor_form.submit();
}