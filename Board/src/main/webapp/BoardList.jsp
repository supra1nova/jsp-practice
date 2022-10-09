<%@page import="model.BoardBean"%>
<%@page import="model.BoardDao"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>

<%

	BoardDao bDao = new BoardDao();

	ArrayList<BoardBean> arr = bDao.getAllBoard(); 
%>

<h1 style="text-align:center" >전체 글 보기</h1>
<div style="display: flex; justify-content: center; margin-bottom: 10px">
	<table width="700" border="1" bgcolor="beige">
		<tr height="40">
			<td width="50" align="center"> 번호</td>
			<td width="320" align="center"> 제목</td>
			<td width="100" align="center"> 작성자</td>
			<td width="150" align="center"> 작성일</td>
			<td width="80" align="center"> 조회수</td>
		</tr>		

<%
	for(int i=0; i<arr.size(); i++){
		BoardBean bean = arr.get(i);
%>
		<tr bgcolor="white">
			<td width="50" align="center"> <%= i+1 %> </td>
			<td width="50" align="left"> <a href="BoardInfo.jsp?num=<%= bean.getNum() %>" style="text-decoration: none; color: black">
			<%
				if(bean.getRe_step() > 1){
					for(int j = 0 ; j < (bean.getRe_step()-1) * 5 ; j++ ){
			%>
						&nbsp;
			<%
					}
				}
			%>
			<%= bean.getSubject() %></a> </td>
			<td width="50" align="center"> <%= bean.getWriter() %> </td>
			<td width="50" align="center"> <%= bean.getReg_date() %> </td>
			<td width="50" align="center"> <%= bean.getReadcount() %> </td>
		</tr>
<%
	}
%>
		<tr height="40">
			<td align="center" colspan="5">
				<input type="button" onclick="location.href='BoardWriteForm.jsp'" value="글쓰기">
			</td>
		</tr>
	
	</table>
</div>

</body>
</html>