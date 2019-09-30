function emailFindCheck() {
	if(document.email_find.nickname.value == "") {
		alert("닉네임을 입력하세요.");
		document.email_find.nickname.focus();
		return false;
	}
	return true;
}

function passwordFindCheck() {
	if(document.password_find.email.value == "") {
		alert("이메일을 입력해주세요");
		document.password_find.email.focus();
		return false;
	}
	if(document.password_find.code.value == "") {
		alert("인증번호를 입력하세요.");
		document.password_find.code.focus();
		return false;
	}
	return true;
}