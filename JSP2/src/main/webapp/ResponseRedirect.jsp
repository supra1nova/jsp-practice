<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	ResponseRedirect.jsp 페이지 입니다.
	<%
		request.setCharacterEncoding("UTF-8");
	
		String id = request.getParameter("id");
		
		String phone = request.getParameter("phone");
	%>
	
	<h1> 아이디 : <%= id %></h3>
	<h1> 전화번호 : <%= phone %></h3>

</body>
</html>