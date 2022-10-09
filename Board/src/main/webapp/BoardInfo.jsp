<%@page import="model.BoardBean"%>
<%@page import="model.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>

<%
	int num = Integer.valueOf(request.getParameter("num").trim());

	BoardDao bDao = new BoardDao();
	BoardBean bean = bDao.getOneBoard(num);
%>

<h1 style="text-align: center"> 게시글 보기</h1>
<div style="disply: flex; justify-content: center">
	<table width="600" border="1" bgcolor="beige">
		<tr height="40">
			<td align="center" width="120"> 글 번호</td>
			<td align="center" width="180"> <%= bean.getNum() %></td>
			<td align="center" width="120"> 조회수</td>
			<td align="center" width="180"> <%= bean.getReadcount() %></td>
		</tr>
		<tr height="40">
			<td align="center" width="120"> 작성자</td>
			<td align="center" width="180"> <%= bean.getWriter() %></td>
			<td align="center" width="120"> 작성일</td>
			<td align="center" width="180"> <%= bean.getReg_date() %></td>
		</tr>
		<tr height="40">
			<td align="center" width="120"> 이메일</td>
			<td align="center" colspan="3"> <%= bean.getEmail() %></td>
		</tr>
		<tr height="40">
			<td align="center" width="120"> 제목</td>
			<td align="center" colspan="3"> <%= bean.getSubject() %></td>
		</tr>
		<tr height="80">
			<td align="center" width="120"> 글내용</td>
			<td align="center" colspan="3"> <%= bean.getContent() %></td>
		</tr>
		<tr height="80">
			<td align="center" colspan="4"> 
			<input type="button" value="답글쓰기" 
			onclick="location.href='BoardReWriteForm.jsp?num=<%= bean.getNum()%>'">
			&nbsp;&nbsp;
			<input type="button" value="수정하기"
			onclick="location.href='BoardUpdateForm.jsp?num=<%= bean.getNum()%>'">
			&nbsp;&nbsp;
			<input type="button" value="삭제하기"
			onclick="location.href='BoardDeleteForm.jsp?num=<%= bean.getNum()%>'">
			&nbsp;&nbsp;
			<input type="button" value="목록보기"
			onclick="location.href='BoardList.jsp'">
			</td>
		</tr>
	</table>
</div>

</body>
</html>