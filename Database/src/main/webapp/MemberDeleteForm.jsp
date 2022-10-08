<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<%
		request.setCharacterEncoding("UTF-8");
		
		String id = request.getParameter("id");
	%>
	
	<h1 style="text-align:center">회원 삭제하기</h1>
	<div style="display:flex; justify-content:center;">
		
			<table width="400" border="1">
				<form action="MemberDeleteProc.jsp" method="post">
				<tr height="50">
					<td align="center" width="150"> 아이디</td>
					<td width="250"> <%= id %></td>
				</tr>
				<tr height="50">
					<td align="center" width="150"> 패스워드</td>
					<td width="250"> <input type="password" name="pass1"></td>
				</tr>
				<tr height="50">
					<td align="center" colspan="2">
						<input type="hidden" name="id" value="<%= id %>">
						<input type="submit" value="회원 삭제하기"> &nbsp;&nbsp; </form>
						<button onclick="href=location.href='MemberList.jsp'"> 회원 전체 보기 </button>
					</td>
				</tr>
			</table>
	</div>

</body>
</html>