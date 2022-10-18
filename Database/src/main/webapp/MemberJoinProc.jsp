<%@page import="model.MemberDao"%>
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
	if(hobby != null){
		
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
		// DB 접근 객체 생성 
		MemberDao mdao = new MemberDao();
		// 회원 가입 정보 DB 저장
		mdao.insertMember(mBean);
		// 회원 가입 완료시 회원 정보를 보여주는 페이지로 이동시킴
		response.sendRedirect("MemberList.jsp");
	}
%>	
	<script>
		history.go(-1);
	</script>

</body>
</html>
