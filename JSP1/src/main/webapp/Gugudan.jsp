<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- <% 
		int r = 0;
		for(int i = 1; i < 10; i++){
	%>
		<<<<< <%= i %>단 출력 >>>>><br>
		<% for(int j = 1; j < 10; j++){ %>
			<%=i %> x <%= j %> = <%= i*j %><br>
			<%=i %> x <%= j %> = <%= i*j %> &nbsp;&nbsp;
		<%} %>
		<br>
	<%
		}
	%> --%>
	
	<% 
	int r = 0;
	for(int i = 1; i < 10; i++){
		out.write("<<<<<" + i + "단 출력 >>>>><br>");
		for(int j = 1; j < 10; j++){
			out.write(i + " x " + j + " = " + i*j + "<br>");
		}
		out.write("<br>");	
	}
	%>
</body>
</html>