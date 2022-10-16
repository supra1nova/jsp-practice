<%@page import="db.RentCarDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String pass1 = request.getParameter("pass1");
	
	RentCarDao rDao = new RentCarDao();
	int res = rDao.getMember(id, pass1);
	
	if(res == 0){
%>
		<script>
			alert("회원 아이디 또는 패스워드가 틀립니다.");
			location.href="RentCarMain.jsp?center=MemberLogin.jsp";
		</script>
<%
	} else {
		session.setAttribute("id", id);
		response.sendRedirect("RentCarMain.jsp");
	}
%>
</body>
</html>