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
		String center = request.getParameter("Center");
		// 처음 실행시 null처리
		if(center == null){
			center = "Center.jsp";	// default center를 부여
		}
	%>

	<div style="display: flex; justify-content: center">
		<table width="1000">
			<!-- TOP -->
			<tr height="140" align="center">
				<td align="center" width="1000"> <jsp:include page="Top.jsp"/></td>
			</tr>
			
			<!-- CENTER -->
			<tr align="center">
				<td align="center" width="1000"> <jsp:include page="<%= center %>"/></td>
			</tr>
			
			<!-- BOTTOM -->
			<tr height="100" align="center">
				<td align="center" width="1000"> <jsp:include page="Bottom.jsp"/></td>
			</tr>
		</table>
	</div>
</body>
</html>