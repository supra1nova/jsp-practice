<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>

<div align="center">
	<h2> 회원가입</h2>
	<form action="Mproc2" method="POST">
	<table width="400" border="1">
		<tr height="40" align="center">
			<td width="130" id="idLabel"> 아이디</td>
			<td><input type="text" name="id" placeholder="id를 넣어주세요" id="id" autocomplete="false" size="30" ></td>
		</tr>
		<tr height="40" align="center">
			<td width="130" id="passwordLabel"> 패스워드</td>
			<td><input type="password" name="password" placeholder="비밀번호는 영문과 숫자만 넣어주세요" id="password" autocomplete="false" size="30"></td>
		</tr>
		<tr height="40" align="center">
			<td width="130" id="emailLabel"> 이메일</td>
			<td><input type="email" name="email" id="email" placeholder="이메일 주소를 넣으세요" size="30"></td>
		</tr>
		<tr height="40" align="center">
			<td width="130" id="telLabel"> 전화번호</td>
			<td><input type="tel" name="tel" id="tel" placeholder="전화번호를 넣어주세요" size="30"></td>
		</tr>
		<tr height="40" align="center">
			<td width="130" id="addressLabel"> 주소</td>
			<td><input type="text" name="address" id="address" placeholder="주소 정보를 넣어주세요" size="30"></td>
		</tr>
		<tr height="40" align="center">
			<td colspan="2"><input type="submit" value="회원가입"></td>
		</tr>
	</table>
	</form>
</div>

</body>

<script type="text/javascript">
const idLabel = document.querySelector("#idLabel");
const passwordLabel = document.querySelector("#passwordLabel");
const emailLabel = document.querySelector("#emailLabel");
const telLabel = document.querySelector("#telLabel");
const addressLabel = document.querySelector("#addressLabel");
const id = document.querySelector("#id");
const password = document.querySelector("#password");
const email = document.querySelector("#email");
const tel = document.querySelector("#tel");
const address = document.querySelector("#address");

idLabel.addEventListener('click', focusToId);
passwordLabel.addEventListener('click', focusToPassword);
emailLabel.addEventListener('click', focusToEmail);
telLabel.addEventListener('click', focusToTel);
addressLabel.addEventListener('click', focusToAddress);


function focusToId(){
	id.focus();
}

function focusToPassword(){
	password.focus();
}

function focusToEmail(){
	email.focus();
}

function focusToTel(){
	tel.focus();
}

function focusToAddress(){
	address.focus();
}

</script>
</html>