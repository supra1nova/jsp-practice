<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div style="text-align:center">
		<h2>회원 가입</h2>
		<form action="MemberJoinProc.jsp" method="POST">
			<table width="500" border="1">
				<tr height="50">
					<td widht="150" align="center"> <label for="id">아이디</label> </td>
					<td widht="350" align="center"><input type="text" id="id" name="id" size="40">
				</tr>
				<tr height="50">
					<td widht="150" align="center"> <label for="pass1">패스워드</label> </td>
					<td widht="350" align="center"><input type="password" id="pass1" name="pass1" size="40">
				</tr>
				<tr height="50">
					<td widht="150" align="center"> <label for="pass2">패스워드 확인</label> </td>
					<td widht="350" align="center"><input type="password" id="pass2" name="pass2" size="40">
				</tr>
				<tr height="50">
					<td widht="150" align="center"> <label for="email">이메일</label> </td>
					<td widht="350" align="center"><input type="email" id="email" name="email" size="40">
				</tr>
				<tr height="50">
					<td widht="150" align="center"> <label for="tel">전화번호</label> </td>
					<td widht="350" align="center"><input type="tel" id="tel" name="tel" size="40">
				</tr>
				<tr height="50">
					<td widht="150" align="center"> <label for="address">주소</label> </td>
					<td widht="350" align="center"><input type="text" id="address" name="address" size="40">
				</tr>
				<tr height="50">
					<td align="center" colspan="2"> <input type="submit" value="회원가입"> </td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>