<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div style="margin:0 auto; text-align:center">
		<h1>회원 정보 보기</h1>
		<%
			request.setCharacterEncoding("UTF-8");
		%>
		
		<!-- useBean 액션태그를 이용하면 request로 넘어온 데이터를 자바 빈즈와 매핑 시킬 수 있다. -->
		<jsp:useBean id="mBean" class="bean.MemberBean">
			<jsp:setProperty property="*" name="mBean" />
		</jsp:useBean>
		
		<h2>당신의 아이디는 <jsp:getProperty property="id" name="mBean" /></h2>
		<h2>당신의 패스는 <jsp:getProperty property="pass1" name="mBean" /></h2>
		<h2>당신의 이메일은 <jsp:getProperty property="email" name="mBean" /></h2>
		
		<h2>당신의 전화는 
		<%= mBean.getTel() %> 
		입니다.
		</h2>
	
	</div>

</body>
</html>