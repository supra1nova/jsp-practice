<%@page import="dao.MemberDao"%>
<%@page import="dto.BoardBean"%>
<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>

<%
	int num = Integer.valueOf(request.getParameter("num").trim());

	BoardDao bDao = new BoardDao();
	MemberDao mDao = new MemberDao();
	BoardBean bean = bDao.getOneBoard(num);
%>

<h1 style="text-align: center"> 게시글 보기</h1>
<div style="display: flex; justify-content: center">
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
			<td align="left" colspan="3" style="padding: 5px"> <%= bean.getSubject() %></td>
		</tr>
		<tr height="80">
			<td align="center" width="120"> 글내용</td>
			<td align="left" colspan="3" style="padding: 5px"> <%= bean.getContent() %></td>
		</tr>
		<tr height="40">
			<td align="center" colspan="4"> 
<%
				if( session.getAttribute("id") != null && !(bean.getEmail().equals(mDao.getMemberEmail(String.valueOf(session.getAttribute("id"))))) ){
%>
					<input type="button" value="답글쓰기" 
					onclick="location.href='RentCarMain.jsp?center=BoardReWriteForm.jsp?num=<%= bean.getNum()%>'">
					
<%
				} else if(session.getAttribute("id") != null && ( bean.getEmail().equals(mDao.getMemberEmail(String.valueOf(session.getAttribute("id"))))) && ( bean.getWriter().equals(session.getAttribute("id")))) {
%>
					&nbsp;&nbsp;
					<input type="button" value="수정하기"
					onclick="location.href='RentCarMain.jsp?center=BoardUpdateForm.jsp?num=<%= bean.getNum()%>'">
					&nbsp;&nbsp;
					<input type="button" value="삭제하기"
					onclick="location.href='RentCarMain.jsp?center=BoardDeleteForm.jsp?num=<%= bean.getNum()%>'">
<%
				}
%>
				&nbsp;&nbsp;
				<input type="button" value="목록보기"
				onclick="location.href='RentCarMain.jsp?center=BoardList.jsp'">
			</td>
		</tr>
	</table>
</div>

</body>
</html>