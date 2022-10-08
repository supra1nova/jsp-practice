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
<h1 style="text-align:center">회원 정보 보기</h1>
<div style="display:flex; justify-content:center;">

	<table width="400" border="1">
		<tr height="50">
			<td align="center" width="150"> 아이디</td>
			<td width="250"> <%= mBean.getId() %></td>
		</tr>
		<tr height="50">
			<td align="center" width="150"> 이메일</td>
			<td width="250"> <%= mBean.getEmail() %></td>
		</tr>
		<tr height="50">
			<td align="center" width="150"> 전화번호</td>
			<td width="250"> <%= mBean.getTel() %></td>
		</tr>
		<tr height="50">
			<td align="center" width="150"> 취미</td>
			<td width="250"> <%= mBean.getHodbby() %></td>
		</tr>
		<tr height="50">
			<td align="center" width="150"> 직업</td>
			<td width="250"> <%= mBean.getJob() %></td>
		</tr>
		<tr height="50">
			<td align="center" width="150"> 나이</td>
			<td width="250"> <%= mBean.getAge() %></td>
		</tr>
		<tr height="50">
			<td align="center" width="150"> 정보</td>
			<td width="250"> <%= mBean.getInfo() %></td>
		</tr>
		<tr height="50">
			<td align="center" colspan="2">
				<button onclick="location.href='MemberUpdateForm.jsp?id=<%= mBean.getId() %>'"> 회원수정 </button>
				<button onclick="location.href='MemberDeleteForm.jsp?id=<%= mBean.getId() %>'"> 회원삭제 </button>
				<button onclick="location.href='MemberList.jsp'"> 목록보기 </button>
				<button onclick="location.href='MemberJoin.jsp'"> 회원가입 </button>
			</td>
		</tr>
	</table>
</div>

</body>
</html>