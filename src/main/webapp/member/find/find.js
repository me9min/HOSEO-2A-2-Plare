function emailFindCheck() {
	if(document.email_find.nickname.value == "") {
		alert("닉네임을 입력하세요.");
		document.email_find.nickname.focus();
		return false;
	}
	return true;
}

function passwordFindCheck() {
	var check_email = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	if(document.password_find.email.value == "") {
		alert("이메일을 입력해주세요");
		document.password_find.email.focus();
		return false;
	}
	if(document.password_find.email.value.match(check_email) == null) {
		alert("올바른 이메일을 입력해주세요.");
		email.value = "";
		email.focus();
		return false;
	}
	if(document.password_find.code.value == "") {
		alert("인증번호를 입력하세요.");
		document.password_find.code.focus();
		return false;
	}
	document.password_find.action = "db_password_find.jsp";
	return true;
}

function emailCheck() {
	var check_email = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	if(document.password_find.email.value == "") {
		alert("이메일을 입력해주세요");
		document.password_find.email.focus();
		return;
	}
	if(document.password_find.email.value.match(check_email) == null) {
		alert("올바른 이메일을 입력해주세요.");
		email.value = "";
		email.focus();
		return;
	}
	document.password_find.action = "db_code.jsp";
	document.password_find.submit();
}