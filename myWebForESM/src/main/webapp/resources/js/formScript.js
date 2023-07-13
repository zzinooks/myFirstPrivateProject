
/* 로그인 폼 확인 */
function checkLogin() {

	if( document.memberLoginForm.loginId.value == ""){
		alert("아이디를 입력해주세요");
		document.memberLoginForm.loginId.focus();
	}
	else if ( document.memberLoginForm.loginPassword.value == ""){
		alert("비밀번호를 입력해주세요");
		document.membeLoginForm.loginPassword.focus();
	}
	else {
		document.memberLoginForm.submit();
	}

}

/* 회원가입 폼 확인 */

function checkSignIn() {

	if(document.signInForm.userId.value == "") {
		alert("아이디를 입력해주세요.");
		document.signInForm.userId.focus();
	}
	else if (document.signInForm.userPwd.value == ""){
		alert("비밀번호를 입력해주세요");
		document.signInForm.userPwd.focus();
	}
	else if ( document.signInForm.userNickName.value == ""){
		alert("별명을 입력해주세요");
		document.signInForm.userNickName.focus();
	}
	else if ( document.signInForm.userPhone.value == ""){
		alert("번호를 입력해주세요");
		document.signInForm.userPhone.focus();
	}
	else if ( document.signInForm.userEmail.value == ""){
		alert("이메일을 입력해주세요");
		document.signInForm.userEmail.focus();
	}
	else if ( document.signInForm.userAddr.value == ""){
		alert("주소를 입력해주세요");
		document.signInForm.userAddr.focus();
	}
	else {
		document.signInForm.submit();
	}
}