<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>

<%
	// 로그아웃 여부 파악하기 위한 변수
	String logout = request.getParameter("logout");
	if(logout != null){
		session.setAttribute("id", null);
		session.setMaxInactiveInterval(0);
	}

	String id = (String)session.getAttribute("id");
	if(id == null){
		id = "손님";
	}
%>

	<table width="800">
		<tr height="100">
			<td colspan="2" align="center" width="200">
			<img src="img/logo.png" width="200">
			</td>
			<td colspan="5" align="center">
			<font size="10">낭만캠핑</font>
			</td>
		</tr>
		<tr height="50">
			<td width="100" align="center">텐트</td>
			<td width="100" align="center">의자</td>
			<td width="100" align="center">식기류</td>
			<td width="100" align="center">침낭</td>
			<td width="100" align="center">테이블</td>
			<td width="100" align="center">화롯대</td>
			<td width="200" align="center">
		<%
			if(id.equals("손님")) {
		%>
			<%= id %> 님 &nbsp;&nbsp; <button onclick="location.href='SessionMain.jsp?center=SessionLoginForm.jsp'">로그인</button>	
		<% } else { %>
			<%= id %> 님 &nbsp;&nbsp; <button onclick="location.href='SessionMain.jsp?logout=1'">로그아웃</button>
		<% } %>
			</td>
		</tr>
	</table>
</body>
</html>