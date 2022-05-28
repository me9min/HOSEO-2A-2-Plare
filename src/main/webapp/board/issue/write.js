function boardCheck() {

	// 반드시 채워져야하는 항목이 채워져있는지 확인 후 submit하는 함수
	
	if(document.tx_editor_form.title.value == "") {
		alert("제목을 입력해주세요");
		document.write.title.focus();
		return;
	}
	if(document.tx_editor_form.content.value == "") {
		alert("내용을 입력해주세요");
		document.write.content.focus();
		return;
	}
	document.tx_editor_form.submit();
}

function commentCheck() {
	if(document.comment_board.content.value == "") {
		alert("댓글 내용을 입력해주세요.");
		document.comment_board.content.focus();
		return;
	}
	document.comment_board.submit();
}

function updateShow(i) {
	var update = "update" + i;
	var reply = "reply" + i;
	
	document.getElementById(reply).style.display = "none";
	
	if(document.getElementById(update).style.display === "none") {
		document.getElementById(update).style.display = "table-row";
	} else {
		document.getElementById(update).style.display = "none";
	}
}

function replyShow(i) {
	var update = "update" + i;
	var reply = "reply" + i
	
	document.getElementById(update).style.display = "none";
	
	if(document.getElementById(reply).style.display === "none") {
		document.getElementById(reply).style.display = "table-row";
	} else {
		document.getElementById(reply).style.display = "none";
	}
}

function updateReplyShow(i) {
	var updateReply = "updateReply" + i;
	
	if(document.getElementById(updateReply).style.display === "none") {
		document.getElementById(updateReply).style.display = "table-row";
	} else {
		document.getElementById(updateReply).style.display = "none";
	}
}