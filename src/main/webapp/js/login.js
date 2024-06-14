/**
 * 
 */

 function inginCheck(){
	if(document.loginForm.adminID.value.length == 0) {
		alert("아이디를 입력해 주세요!");
		document.loginForm.adminID.focus();
		return false;
	}
	
	if(document.loginForm.adminPW.value.length == 0) {
		alert("비밀번호를 입력해 주세요!");
		document.loginForm.adminPW.focus();
		return false;	
	}
	
	return True;
}