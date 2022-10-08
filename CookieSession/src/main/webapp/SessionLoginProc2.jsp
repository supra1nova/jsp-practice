<%@page import="javax.websocket.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>

	<h1 style="text-align: center"> 세션 로그인 처리2 </h1>

	<div style="display:flex; justify-content: center">
	
		
		
		<%
			String id = String.valueOf(session.getAttribute("id"));
			String pass = String.valueOf(session.getAttribute("pass"));
		%>
	
	</div>
	
	<h1 style="text-align: center"> 당신의 아이디는 <%= id %> 입니다.</h1>
	<h1 style="text-align: center"> 당신의 패스워드는 <%= pass %> 입니다.</h1>

</body>
</html>