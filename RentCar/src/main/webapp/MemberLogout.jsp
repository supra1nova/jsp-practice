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
	alert("로그아웃 되었습니다.");
	document.location.href="RentCarMain.jsp";
</script>
</body>
</html>