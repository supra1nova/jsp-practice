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
		
		MemberDao mDao = new MemberDao();
		MemberBean mBean = mDao.oneSelectMember(id);
	%>
	<h1 style="text-align:center">회원 정보 수정하기</h1>
	<div style="display:flex; justify-content:center;">
		
		<form action="MemberUpdateProc.jsp" method="POST">
			<table width="400" border="1">
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
					<td align="center" width="150"> 직업 </td>
					<td width="250"> <input type="text" name="job" value="<%= mBean.getJob() %>"></td>
				</tr>
				<tr height="50">
					<td align="center" width="150"> 취미 </td>
					<td width="250"> <input type="text" name="hobby" value="<%= mBean.getHobby() %>"></td>
				</tr>
				<tr height="50">
					<td align="center" width="150"> 나이 </td>
					<td width="250"> <input type="text" name="age" value="<%= mBean.getAge() %>"></td>
				</tr>
				<tr height="50">
					<td align="center"> 자기소개 </td>
					<td width="250" height="80"> <textarea style="width: 90%; height:90%; vertical-align: bottom; resize: none" name="info"><%= mBean.getInfo() %></textarea></td>
				</tr>
				<tr height="50">
					<td align="center" width="150"> 패스워드</td>
					<td width="250"> <input type="password" name="pass1" id="pass1" autoComplete="off"></td>
				</tr>
				<tr height="50">
					<td align="center" colspan="2">
						<input type="hidden" name="id" value="<%= mBean.getId() %>" readOnly>
						<input type="hidden" name="type" value="<%= mBean.getType() %>" readOnly>
						<input type="submit" value="회원 수정하기" id="submitBtn" disabled>
						&nbsp;&nbsp;
						<input type="button" onClick="history.go(-1)" value="취소">  
					</td>
				</tr>
			</table>
		</form>
	</div>

</body>
<script>
	const submitBtn = document.querySelector("#submitBtn");
	const pass1 = document.querySelector("#pass1");
	pass1.addEventListener("change", function () {
		submitBtn.disabled = pass1.value != null ? false: true; 
	})
</script>
</html>