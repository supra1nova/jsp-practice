<%@page import="model.MemberBean"%>
<%@page import="model.MemberDao"%>
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

	String id = request.getParameter("id");
	
	MemberDao mDao = new MemberDao();
	MemberBean mBean = mDao.oneSelectMember(id);
%>
<h1 style="text-align:center">회원 정보 수정하기</h1>
<div style="display:flex; justify-content:center;">
	
		<table width="400" border="1">
			<form action="MemberUpdateProc.jsp" method="post">
			<tr height="50">
				<td align="center" width="150"> 아이디</td>
				<td width="250"> <%= mBean.getId() %></td>
			</tr>
			<tr height="50">
				<td align="center" width="150"> 이메일</td>
				<td width="250"> <input type="email" name="email" value="<%= mBean.getEmail() %>"></td>
			</tr>
			<tr height="50">
				<td align="center" width="150"> 전화번호</td>
				<td width="250"> <input type="tel" name="tel" value="<%= mBean.getTel() %>"></td>
			</tr>
			<tr height="50">
				<td align="center" width="150"> 패스워드</td>
				<td width="250"> <input type="password" name="pass1"></td>
			</tr>
			<tr height="50">
				<td align="center" colspan="2">
					<input type="hidden" name="id" value="<%= mBean.getId() %>">
					<input type="submit" value="회원 수정하기"> &nbsp;&nbsp; </form>
					<button onclick="href=location.href='MemberList.jsp'"> 회원 전체 보기 </button>
				</td>
			</tr>
		</table>
</div>

</body>
</html>