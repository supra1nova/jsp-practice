<%@page import="dto.BoardBean"%>
<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>

<%
	int num = Integer.valueOf(request.getParameter("num"));
	BoardDao bDao = new BoardDao();
	BoardBean bean = bDao.getOneUpdateBoard(num);
%>

<h1 style="text-align: center"> 게시글 삭제</h1>
<div style="display: flex; justify-content: center">
	<form action="BoardDeleteProc.jsp" method="POST">
		<table width="600" border="1" bgcolor="beige">
			<tr height="40">
				<td width="120" align="center">작성자</td>
				<td width="180" align="center"><%= bean.getWriter() %></td>
				<td width="120" align="center">작성일</td>
				<td width="180" align="center"><%= bean.getReg_date() %></td>
			</tr>
			<tr height="40">
				<td width="120" align="center">제목</td>
				<td align="left" colspan="3">&nbsp;<%= bean.getSubject() %></td>
			</tr>
			<tr height="40">
				<td width="120" align="center"> <label for="password">패스워드</label></td>
				<td align="left" colspan="3"><input type="password" name="password" id="password" size="67"></td>
			</tr>
			<tr height="40">
				<td width="120" align="center"> 내용</td>
				<td align="left" colspan="3"> <%= bean.getContent() %></td>
			</tr>
			<tr height="40">
				<td colspan="4" align="center">
					<input type="hidden" name="num" value="<%= num %>">
					<input type="submit" value="삭제">
					&nbsp;&nbsp;
					<input type="button" onclick="history.go(-1)" value="취소">
					&nbsp;&nbsp;
					<input type="button" onclick="RentCarMain.jsp?center=location.href='BoardList.jsp'" value="목록으로">
				</td>
			</tr>
		</table>
	</form>
</div>

</body>
</html>
