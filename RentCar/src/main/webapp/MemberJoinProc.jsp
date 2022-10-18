<%@page import="dao.MemberDao"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="org.mariadb.jdbc.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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

<jsp:useBean id="mBean" class="dto.MemberBean">
	<jsp:setProperty name="mBean" property="*" />
</jsp:useBean>

<%
	mBean.setHobby(texthobby);
	MemberDao mdao = new MemberDao();	// DB 접근 객체 생성 
	Boolean res = mdao.validateEmail(mBean.getEmail()) && mdao.validateId(mBean.getId());
	if(res){
		mdao.insertMember(mBean);	// 회원 가입 정보 DB 저장
		session.setAttribute("id", mBean.getId());
		response.sendRedirect("RentCarMain.jsp");	// 회원 가입 완료시 회원 정보를 보여주는 페이지로 이동시킴	
	}
%>
<script>
	alert("아이디 또는 이메일 값이 중복되었습니다.");
	history.go(-1);
</script>

</body>
</html>
