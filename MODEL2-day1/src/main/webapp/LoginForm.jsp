<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div align="center">
	<h2> 로그인</h2>
	<form action="LoginProc" method="POST">
		<table width="300" border="1">
			<tr align="center">
				<td width="100" id = "idLabel"> 로그인</td>
				<td> <input type="text" name="id" placeholder="please input id" id="id" autocomplete="off"></td>
			</tr>
			<tr align="center">
				<td id = "passwordLabel"> 패스워드</td>
				<td> <input type="password" name="password" placeholder="please input password" width="100%" id="password" autocomplete="off"></td>
			</tr>
			<tr align="center">
				<td colspan="2"><input type="submit" value="로그인" style="width: 100px"></td>
			</tr>
		</table>
	</form>
</div>

</body>
<script type="text/javascript">
const idLabel = document.querySelector("#idLabel");
const id = document.querySelector("#id");
const passwordLabel = document.querySelector("#passwordLabel");
const password = document.querySelector("#password");
idLabel.addEventListener('click', idLabelSelect);
passwordLabel.addEventListener('click', passwordLabelSelect)
function idLabelSelect(e){
	e.preventDefault();
	id.focus();
}
function passwordLabelSelect(e){
	e.preventDefault();
	password.focus();
}

</script>
</html>