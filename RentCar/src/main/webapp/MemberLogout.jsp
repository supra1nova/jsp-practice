<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>

<%
	session.setAttribute("id", null);
	session.invalidate();
%>
<script>
	document.location.href="RentCarMain.jsp?center=MemberLogin.jsp";
</script>
</body>
</html>