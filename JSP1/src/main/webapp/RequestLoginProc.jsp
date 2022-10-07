<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- RequestLogin에서 넘어온 아이디와 패스워드를 읽어온다. -->
<%
	// 사용자의 정보가 저장되어 있는 객체인 request 의 getParameter()메서드로 사용자의 정보를 추출 가능.
	String id = request.getParameter("id");	//	사용자의 id 값을 읽어와 변수 id에 저장
	String pass = request.getParameter("pass");
	
	String dbid = "asdf";
	String dbpass = "1234";
	
	if(id != dbid || pass != dbpass){
%>

<script>
	alert("아이디 또는 비밀번호가 일치하지 않습니다.");
	history.go(-1);
</script>

<%
	}		
%>

<h2>
당신의 아이디는 <%= id %> 로, 패스워드는 <% out.print(pass); %> 입니다.
</h2>

<a href="RequestLogin.jsp">이전 페이지</a>
<a href="RequestForward.jsp">다음 페이지</a>

</body>
</html>