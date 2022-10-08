<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>

	<h1 style="text-align: center"> 세션 로그인 처리</h1>

	<div style="display:flex; justify-content: center">
	
		
		
		<%
			request.setCharacterEncoding("UTF-8");
		
			String id = request.getParameter("id");
			String pass = request.getParameter("pass");
			
			session.setAttribute("id", id);
			session.setAttribute("pass", pass);
			session.setMaxInactiveInterval(60*2);	 // 2분
			
			response.sendRedirect("SessionMain.jsp");
			
		%>
	
	</div>
	
	<h1 style="text-align: center"> 당신의 아이디는 <%= id %> 입니다.</h1>
	
	<div style="display: flex; justify-content: center">
		<a style="text-align: center" href="SessionLoginProc2.jsp"> 다음페이지로 이동</a>
	</div>

</body>
</html>