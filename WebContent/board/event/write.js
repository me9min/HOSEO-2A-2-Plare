function eventCheck() {
	// 반드시 채워져야하는 항목이 채워져있는지 확인 후 submit하는 함수
	
	if(document.event.title.value == "") {
		alert("제목을 입력해주세요");
		document.event.title.focus();
		return;
	}
	if(document.event.content.value == "") {
		alert("내용을 입력해주세요");
		document.event.content.focus();
		return;
	}
	document.event.submit();
}