<%@page import="dto.MemberBean"%>
<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>

<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	/* String id = String.valueOf(session.getAttribute("id")); */
	
	MemberDao mDao = new MemberDao();
	MemberBean mBean = mDao.oneSelectMember(id);
%>
<h1 style="text-align:center">회원 정보 보기</h1>
<div style="display:flex; justify-content:center;">

	<table width="400" border="1">
		<tr height="50">
			<td align="center" width="150"> 아이디</td>
			<td width="250" style="padding-left:10px"> <%= mBean.getId() %></td>
		</tr>
		<tr height="50">
			<td align="center" width="150"> 이메일</td>
			<td width="250" style="padding-left:10px"> <%= mBean.getEmail() %></td>
		</tr>
		<tr height="50">
			<td align="center" width="150"> 전화번호</td>
			<td width="250" style="padding-left:10px"> <%= mBean.getTel() %></td>
		</tr>
		<tr height="50">
			<td align="center" width="150"> 취미</td>
			<td width="250" style="padding-left:10px"> <%= mBean.getHobby() %></td>
		</tr>
		<tr height="50">
			<td align="center" width="150"> 직업</td>
			<td width="250" style="padding-left:10px"> <%= mBean.getJob() %></td>
		</tr>
		<tr height="50">
			<td align="center" width="150"> 나이</td>
			<td width="250" style="padding-left:10px"> <%= mBean.getAge() %></td>
		</tr>
		<tr height="50">
			<td align="center" width="150"> 정보</td>
			<td width="250" style="padding-left:10px"> <%= mBean.getInfo() %></td>
		</tr>
		<tr height="50">
			<td align="center" colspan="2">
				<input type="button" value="회원수정" onclick="location.href='RentCarMain.jsp?center=MemberUpdateForm.jsp?id=<%= mBean.getId() %>'"> 
				&nbsp;&nbsp;
				<input type="button" value="회원탈퇴" onclick="location.href='RentCarMain.jsp?center=MemberDeleteForm.jsp?id=<%= mBean.getId() %>'"> 
			</td>
		</tr>
	</table>
</div>

</body>
</html>