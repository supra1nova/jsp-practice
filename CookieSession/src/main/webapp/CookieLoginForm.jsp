<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>

	<h2 style="text-align: center"> 쿠키 로그인 </h2>
	<div style="display:flex; justify-content:center;">
		<form action="CookieLoginProc.jsp" method="POST">
			<table width="400" border="1">
				<tr height="50">
					<td width="150" align="center"> <label for="id"> 아이디 </label></td>
					<td width="250" align="center"> <input type="text" name="id" id="id"></td>
				</tr>
				<tr height="50">
					<td width="150" align="center"> <label for="pass"> 패스워드 </label></td>
					<td width="250" align="center"> <input type="password" name="pass" id="pass"></td>
				</tr>
				<tr height="50">
					<td colspan="2" align="center" > <input type="checkbox" name="save" id="save"><label for="save">아이디 저장</label></td>
				</tr>
				<tr height="50">
					<td colspan="2" align="center"> <input type="submit" name="submit" id="submit" value="로그인"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>