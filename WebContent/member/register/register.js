function inputCheck()
{
	// 반드시 채워져야하는 항목이 채워져있는지 확인 후 submit하는 함수
	var email = document.register.email;
	var nickname = document.register.nickname;
	var password = document.register.password;
	var passwordc = document.register.passwordc;
	var referrer = document.register.referrer;
	var check_email = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	var check_number = password.value.search(/[0-9]/g);
	var check_english = password.value.search(/[a-z]/ig);
	var email_check = document.register.email_check;
	var nickname_check = document.register.nickname_check;
	var referrer_check = document.register.referrer_check;
	
	if(email.value==""){
		alert("아이디를 입력해주세요");
		email.focus();
		return;
	}
	if(password.value==""){
		alert("비밀번호를 입력해주세요");
		password.focus();
		return;
	}
	if(passwordc.value==""){
		alert("비밀번호 확인을 입력해주세요");
		passwordc.focus();
		return;
	}
	if(nickname.value==""){
		alert("닉네임을 입력해주세요");
		nickname.focus();
		return;
	}
	if(password.value != passwordc.value){
		alert("비밀번호가 일치하지않습니다");
		document.register.passwordc.focus();
		return;
	}
	if(email.value.match(check_email) == null) {
		alert("올바른 이메일을 입력해주세요.");
		email.value = "";
		email.focus();
		return;
	}
	if(password.value.length < 4) {
		alert("비밀번호는 4자 이상, 20자 이하여야 합니다.");
		password.value = "";
		passwordc.value = "";
		password.focus();
		return;
	}
	if(check_number < 0 || check_english < 0) {
		alert("비밀번호는 영어와 숫자가 반드시 포함되어야합니다.");
		password.value = "";
		passwordc.value = "";
		password.focus();
		return;
	}
	if(email_check.value == "false") {
		alert("이메일 중복 확인을 진행해주세요.");
		return;
	}
	if(nickname_check.value == "false") {
		alert("닉네임 중복 확인을 진행해주세요.");
		return;
	}
	if(referrer.value != "" && referrer_check.value == "false") {
		alert("추천인 확인을 진행해주세요.");
		return;
	}
	document.register.action = "db_register.jsp";
	document.register.target = "_self";
	document.register.submit();
}

function emailCheck() {
	var check_email = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	
	if(document.register.email.value == "") {
		alert("이메일을 입력해주세요");
		document.register.email.focus();
		return false;
	}
	if(document.register.email.value.match(check_email) == null) {
		alert("올바른 이메일을 입력해주세요.");
		email.value = "";
		email.focus();
		return false;
	}
	document.register.action = "db_email_check.jsp";
	document.register.target = "winName";
	return true;
}

function nicknameCheck() {
	if(document.register.nickname.value == "") {
		alert("닉네임을 입력해주세요");
		document.register.nickname.focus();
		return;
	} else {
		document.register.action = "db_nickname_check.jsp";
		document.register.target = "winName";
		document.register.submit();
	}
}

function addressCheck() {
	address = document.address.address_find.value.trim();
	if(address == "") {
		alert("주소를 입력하세요.");
		document.address.address_find.focus();
		document.address.address_find.value = "";
		return;
	}
	document.address.submit();
}

function referrerCheck() {
	if(document.register.referrer.value == "") {
		alert("추천인의 닉네임을 입력해주세요");
		document.register.referrer.focus();
		return;
	} else {
		document.register.action = "db_referrer_check.jsp";
		document.register.target = "winName";
		document.register.submit();
	}
}