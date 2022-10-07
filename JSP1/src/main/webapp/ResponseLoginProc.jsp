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
	
		String dbid = "aaaa";
		String dbpass = "1234";
		
		String id = request.getParameter("id");
		String pass =request.getParameter("pass");
		
		if(dbid.equals(id) && dbpass.equals(pass)){
			response.sendRedirect("ResponseMain.jsp?id="+id);
		} else {
	%>
	
	<script>
		alert("아이디와 패스워드가 일치 하지 않습니다.");
		history.go(-1);
	</script>
	
	<%
		}
	%>

</body>
</html>