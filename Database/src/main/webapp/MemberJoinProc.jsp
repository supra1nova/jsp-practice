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
	String[] hobby = request.getParameterValues("hobby");
	
	StringBuffer sb = new StringBuffer();
	for(int i = 0; i < hobby.length; i++){
		sb.append(hobby[i]);
		sb.append(" ");
	}
	
	String texthobby = String.valueOf(sb);
%>

<jsp:useBean id="mBean" class="model.MemberBean">
	<jsp:setProperty name="mBean" property="*" />
</jsp:useBean>

<%
	mBean.setHodbby(texthobby);
%>

	<h2>당신의 아이디는 <%= mBean.getId() %></h2>
	<h2>당신의 취미는 <%= mBean.getHodbby() %></h2>


</body>
</html>