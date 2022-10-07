<%@page import="model.MemberBean"%>
<%@page import="java.util.ArrayList"%>
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
		MemberDao mDao = new MemberDao();
	
		// 얼마나 많은 회원 정보가 저장되어 있는지 모르므로 가변길이를 사용할 수 있는 ArrayList를 이용해 데이터를 저장함.
		ArrayList<MemberBean> arr = mDao.allSelectMember();
	%>
	
	<h1>모든 회원 보기</h2>
	
	<div style="display:flex; justify-content:center;">
		<table width="800" border="1">
			<tr height="50">
				<td align="center" width="150"> 아이디</td>
				<td align="center" width="250"> 이메일</td>
				<td align="center" width="200"> 전화번호</td>
				<td align="center" width="2000">취미</td>
			</tr>
			<%
				for(int i = 0; i < arr.size(); i++){
					MemberBean bean = arr.get(i);
			%>
			<tr height="50">
				<td align="center" width="150"> 
					<a href="MemberInfo.jsp?id=<%= bean.getId() %>"><%= bean.getId() %></a>
				</td>
				<td align="center" width="250"> <%= bean.getEmail() %></td>
				<td align="center" width="200"> <%= bean.getTel() %></td>
				<td align="center" width="2000"><%= bean.getHodbby() %></td>
			</tr>
			<% } %>
		</table>
	</div>

</body>
</html>