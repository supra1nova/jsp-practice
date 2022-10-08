<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>


	<%
		// 사용자 브라우저에 쿠키 저장소로부터 쿠키 값을 읽어온다.
		Cookie[] cookies = request.getCookies();
		String id = "";
		// 쿠카 값이 없을 수 있으므로 null 확인
		if(cookies != null){
			for(Cookie cookie : cookies){
				if(cookie.getName().equals("id")){
					id = cookie.getValue();
					break;
				}
			}
		}
	%>
	
	<h2 style="text-align: center"> 쿠키 로그인 </h2>
	<div style="display:flex; justify-content:center;">
		<form action="CookieLoginProc.jsp" method="POST">
			<table width="400" border="1">
				<tr height="50">
					<td width="150" align="center"> <label for="id"> 아이디 </label></td>
					<td width="250" align="center"> <input type="text" name="id" id="id" value="<%= id %>"></td>
				</tr>
				<tr height="50">
					<td width="150" align="center"> <label for="pass"> 패스워드 </label></td>
					<td width="250" align="center"> <input type="password" name="pass" id="pass"></td>
				</tr>
				<tr height="50">
					<td colspan="2" align="center" > <input type="checkbox" name="save" id="save" value="1"><label for="save">아이디 저장</label></td>
				</tr>
				<tr height="50">
					<td colspan="2" align="center"> <input type="submit" name="submit" id="submit" value="로그인"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>