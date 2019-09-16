function writeCheck() {
	// 반드시 채워져야하는 항목이 채워져있는지 확인 후 submit하는 함수
	var title = document.write.title;
	var content = document.write.content;
	
	if(title.value == "") {
		alert("제목을 입력해주세요");
		document.write.title.focus();
		return;
	}
	if(content.value == "") {
		alert("제목을 입력해주세요");
		document.write.content.focus();
		return;
	}
	document.write.submit();
}