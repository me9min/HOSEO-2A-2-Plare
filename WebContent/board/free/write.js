function boardCheck() {
	// 반드시 채워져야하는 항목이 채워져있는지 확인 후 submit하는 함수
	
	if(document.board.title.value == "") {
		alert("제목을 입력해주세요");
		document.write.title.focus();
		return;
	}
	if(document.board.content.value == "") {
		alert("내용을 입력해주세요");
		document.write.content.focus();
		return;
	}
	document.board.submit();
}