<%@page import="model.BoardNewBean"%>
<%@page import="model.BoardNewDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<body>

<c:if test="${code != null && code == 400}">
	<script>
		alert("패스워드가 일치하지 않습니다.")
	</script>
</c:if>

<h1 style="text-align: center"> 게시글 삭제</h1>
<div style="display: flex; justify-content: center">
	<form action="BoardDeleteProcController" method="POST">
		<table width="600" border="1" bgcolor="beige">
			<tr height="40">
				<td width="120" align="center">작성자</td>
				<td width="180" align="center">${bBean.writer }</td>
			</tr>
			<tr height="40">
				<td width="120" align="center">제목</td>
				<td align="left" colspan="3">&nbsp;${bBean.subject }</td>
			</tr>
			<tr height="40">
				<td width="120" align="center"> <label for="password">패스워드</label></td>
				<td align="left" colspan="3"><input type="password" name="password" id="password" size="67"></td>
			</tr>
			<tr height="40">
				<td colspan="4" align="center">
					<input type="hidden" name="num" value="${bBean.num }">
					<input type="submit" value="삭제">
					&nbsp;&nbsp;
					<input type="button" onclick="history.go(-1)" value="취소">
					&nbsp;&nbsp;
					<input type="button" onclick="location.href='BoardListController'" value="목록으로">
				</td>
			</tr>
		</table>
	</form>
</div>

</body>
</html>
