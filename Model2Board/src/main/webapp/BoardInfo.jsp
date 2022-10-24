<%@page import="model.BoardNewBean"%>
<%@page import="model.BoardNewDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<body>

<h1 style="text-align: center"> 게시글 보기</h1>
<div style="display: flex; justify-content: center">
	<table width="600" border="1" bgcolor="beige">
		<tr height="40">
			<td align="center" width="120"> 글 번호</td>
			<td align="center" width="180"> ${bBean.num }</td>
			<td align="center" width="120"> 조회수</td>
			<td align="center" width="180"> ${bBean.readcount }</td>
		</tr>
		<tr height="40">
			<td align="center" width="120"> 작성자</td>
			<td align="center" width="180"> ${bBean.writer }</td>
			<td align="center" width="120"> 작성일</td>
			<td align="center" width="180"> ${bBean.reg_date }</td>
		</tr>
		<tr height="40">
			<td align="center" width="120"> 이메일</td>
			<td align="center" colspan="3"> ${bBean.email }</td>
		</tr>
		<tr height="40">
			<td align="center" width="120"> 제목</td>
			<td align="left" colspan="3" style="padding: 5px"> ${bBean.subject }</td>
		</tr>
		<tr height="80">
			<td align="center" width="120"> 글내용</td>
			<td align="left" colspan="3" style="padding: 5px"> ${bBean.content }</td>
		</tr>
		<tr height="40">
			<td align="center" colspan="4"> 
			<input type="button" value="답글쓰기" 
			onclick="location.href='BoardReWriteController?num=${bBean.num }&ref=${bBean.ref }&re_step=${bBean.re_step }&re_level=${bBean.re_level }'">
			&nbsp;&nbsp;
			<input type="button" value="수정하기"
			onclick="location.href='BoardUpdateController?num=${bBean.num}'">
			&nbsp;&nbsp;
			<input type="button" value="삭제하기"
			onclick="location.href='BoardDeleteController?num=${bBean.num}'">
			&nbsp;&nbsp;
			<input type="button" value="목록보기"
			onclick="location.href='BoardListController'">
			</td>
		</tr>
	</table>
</div>

</body>
</html>