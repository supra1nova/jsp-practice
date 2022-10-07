<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="org.mariadb.jdbc.*"%>
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


<%
	// db에 접속 정보 작성
	String id = "jspmanager";
	String pass = "1111";
	String url = "jdbc:mariadb://localhost:3306/jspPractice1";
	
	try{
		// 1. DB 선언 - jdbc 등록
		Class.forName("org.mariadb.jdbc.Driver");
		// 2. DB 접속
		Connection con = DriverManager.getConnection("jdbc:mariadb://localhost:3306/jspPractice1?user=" + id + "&password=" + pass);
		// 3. 접속후 쿼리 준비해 쿼리를 사용하도록 설정
		String sql = "insert into jspPractice1.member VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
		
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, mBean.getId());
		pstmt.setString(2, mBean.getPass1());
		pstmt.setString(3, mBean.getEmail());
		pstmt.setString(4, mBean.getTel());
		pstmt.setString(5, mBean.getHodbby());
		pstmt.setString(6, mBean.getJob());
		pstmt.setString(7, mBean.getAge());
		pstmt.setString(8, mBean.getInfo());
		
		// 4. sql에서 쿼리를 실행하도록 설정
		pstmt.executeUpdate();
		
		con.close();
		
		
	} catch(Exception e){
		e.printStackTrace();
	}
%>

	<h2>당신의 아이디는 <%= mBean.getId() %></h2>
	<h2>당신의 취미는 <%= mBean.getHodbby() %></h2>
	
	<h1>오라클 완료!!</h1>

</body>
</html>