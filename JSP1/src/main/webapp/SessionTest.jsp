<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2> 세션 연결</h2>
<%
	String name = "shin";
	session.setAttribute("name", name);
	session.setMaxInactiveInterval(3);
%>

	<a href="SessionName.jsp">세션네임페이지로 이동</a>

</body>
</html>