<%@page import="model.BoardNewDao"%>
<%@page import="model.BoardNewBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>

<h2 style="text-align: center">게시글 수정</h2>
<div style="display: flex; justify-content: center">
	<form action="BoardUpdateProcController" method="POST">
		<table width="600" border="1" bgcolor="beige">
			<tr height="40">
				<td width="120" align="center"> 작성자</td>
				<td width="180" align="center"> ${bBean.writer}</td>
				<td width="120" align="center"> 작성일</td>
				<td width="180" align="center"> ${bBean.reg_date }</td>
			</tr>
			<tr height="40">
				<td width="120" align="center"> <label for="subject">제목</label></td>
				<td width="480" colspan="3" align="center"> <input type="text" name="subject" id="subject" value="${bBean.subject}" size="67"></td>
			</tr>
			<tr height="40">
				<td width="120" align="center"> <label for="password">패스워드</label></td>
				<td width="480" colspan="3" align="center"> <input type="password" name="password" id="password" size="67" autocomplete="false"></td>
			</tr>
			<tr height="40">
				<td width="120" align="center"> <label for="content">글내용</label></td>
				<td width="480" colspan="3"> <textarea rows="10" cols="60" name="content" id="content">${bBean.content }</textarea></td>
			</tr>
			<tr height="40">
				<td colspan="4" align="center">
					<input type="hidden" name="num" value="${bBean.num }">
					<input type="submit" value="글수정">
					&nbsp;&nbsp;
					<input type="button" value="취소" onclick="history.go(-1)">
					&nbsp;&nbsp;
					<input type="button" onclick="location.href='BoardListController'" value="전체글보기">
				</td>
			</tr>
		</table>
	</form>
</div>

</body>
</html>
