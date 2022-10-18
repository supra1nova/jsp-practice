<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>
	
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");	
	if(session.getAttribute("id").equals(id)) {
%>

	<h1 style="text-align:center">회원 삭제하기</h1>
	<div style="display:flex; justify-content:center;">
		
			<table width="400" border="1">
				<form action="MemberDeleteProc.jsp" method="post">
				<tr height="50">
					<td align="center" width="150"> 아이디</td>
					<td width="250"> <%= id %></td>
				</tr>
				<tr height="50">
					<td align="center" width="150"> 패스워드</td>
					<td width="250"> <input type="password" name="pass1"></td>
				</tr>
				<tr height="50">
					<td align="center" colspan="2">
						<input type="hidden" name="id" value="<%= id %>">
						<input type="submit" value="회원 탈퇴"> &nbsp;&nbsp; </form>
						<button onclick="location.href='RentCarMain.jsp?center=MemberInfo.jsp?id=<%= id %>'"> 회원 정보 </button>
					</td>
				</tr>
			</table>
	</div>
<%
	} else{
%>
	<script>
		alert("권한이 없는 진입입니다.");
		history.go(-1);
	</script>
<%
	}
%>

</body>
</html>