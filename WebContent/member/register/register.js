function inputCheck()
{
	// 반드시 채워져야하는 항목이 채워져있는지 확인 후 submit하는 함수
	var email = document.register.email;
	var nickname = document.register.nickname;
	var password = document.register.password;
	var passwordc = document.register.passwordc;
	var email_check = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	var check_number = password.value.search(/[0-9]/g);
	var check_english = password.value.search(/[a-z]/ig);
	
	if(document.register.email.value==""){
		alert("아이디를 입력해주세요");
		document.register.email.focus();
		return;
	}
	if(document.register.password.value==""){
		alert("비밀번호를 입력해주세요");
		document.register.password.focus();
		return;
	}
	if(document.register.passwordc.value==""){
		alert("비밀번호 확인을 입력해주세요");
		document.register.passwordc.focus();
		return;
	}
	if(document.register.nickname.value==""){
		alert("닉네임을 입력해주세요");
		document.register.nickname.focus();
		return;
	}
	if(document.register.password.value != document.register.passwordc.value){
		alert("비밀번호가 일치하지않습니다");
		document.register.passwordc.focus();
		return;
	}
	if(email.value.match(email_check) == null) {
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
	document.register.submit();
}