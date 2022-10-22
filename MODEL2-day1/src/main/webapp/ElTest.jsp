<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>

<%
	int i = 5;
	String j = "5";
	out.println("i = " + i + "<br>");
	out.println("j = " + j + "<br>");
	out.println("ia = \"5\"<br>");
	request.setAttribute("ia", "5");
%>
		i > 4 ? <%= i > 4 %>	<br>
		j + 4 ? <%= j + 4 %>	<br>
		ia > 4 ? ${ia > 4}	<br>
		ia + 4 ? ${ia + 4}	<br>

</body>
</html>