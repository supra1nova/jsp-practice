<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>
	<form action="MemberLoginProc.jsp" method="POST">
	<table width="300" border="1" bordercolor="grey">
		<tr height="100">
				<td align="center" colspan="2">
					<font size="6" color="grey"> 로그인</font>
				</td>
			</tr>
		<tr height="40"> 
			<td width="120" align="center" onClick="document.getElementById('id').focus()">아이디</td>
			<td width="180" align="center">
				<input type="text" name="id" id="id" size="15">
			</td>
		</tr>
		<tr height="40"> 
			<td width="120" align="center" onClick="document.getElementById('pass1').focus()">패스워드</td>
			<td width="180" align="center">
				<input type="password" name="pass1" id="pass1" size="15">
			</td>
		</tr>
		<tr height="40"> 
			<td align="center" colspan="2" >
				<input type="submit" value="로그인">
				&nbsp;&nbsp;
				<input type="button" onclick="history.go(-1)" value="취소">
			</td>
		</tr>
	</table>
	</form>
</body>
</html>