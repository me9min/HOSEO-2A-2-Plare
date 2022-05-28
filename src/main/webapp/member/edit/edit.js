function inputCheck()
{
	// 반드시 채워져야하는 항목이 채워져있는지 확인 후 submit하는 함수
	var nickname = document.edit.nickname;
	var password = document.edit.password;
	var passwordc = document.edit.passwordc;
	var email_check = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	var check_number = password.value.search(/[0-9]/g);
	var check_english = password.value.search(/[a-z]/ig);
	
	if(document.edit.password.value==""){
		alert("비밀번호를 입력해주세요");
		document.edit.password.focus();
		return;
	}
	if(document.edit.passwordc.value==""){
		alert("비밀번호 확인을 입력해주세요");
		document.edit.passwordc.focus();
		return;
	}
	if(document.edit.nickname.value==""){
		alert("닉네임을 입력해주세요");
		document.edit.nickname.focus();
		return;
	}
	if(document.edit.password.value != document.edit.passwordc.value){
		alert("비밀번호가 일치하지않습니다");
		document.edit.passwordc.focus();
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
	document.edit.action = "db_edit.jsp";
	document.edit.target = "_self";
	document.edit.submit();
}

function nicknameCheck() {
	var nickname = document.edit.nickname;
	
	if(nickname.value == "") {
		alert("닉네임을 입력해주세요.");
		nickname.focus();
		return;
	}
	var gsWin = window.open("about:blank", "winName");
	document.edit.action = "nickname_change.jsp";
	document.edit.target = "winName";
	document.edit.submit();
}

function nicknameDoubleCheck() {
	var nickname = document.change.nickname;
	
	if(nickname.value == "") {
		alert("닉네임을 입력해주세요.");
		nickname.focus();
		return;
	}
	if(nickname.value == window.opener.edit.nickname.value) {
		alert("변경할 닉네임이 기존 닉네임과 동일합니다.");
		nickname.value = "";
		nickname.focus();
		return;
	}
	 else {
		document.change.submit();
	}
}

function passwordCheck() {
	if(document.check.password.value == "") {
		alert("비밀번호를 입력해주세요.");
		document.check.password.focus();
		return false;
	}
	return true;
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

function memberDelete() {
	if (confirm("정말 탈퇴 하시겠습니까?") == true){
		var pw = prompt('비밀번호확인', '');
		location.href = "./db_delete.jsp?pw="+pw;
	} else {
		return;
	}
}