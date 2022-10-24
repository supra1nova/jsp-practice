<%@page import="model.BoardNewDao"%>
<%@page import="model.BoardNewBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>


<h2 style="text-align: center">답변글 입력하기</h2>
<div style="display: flex; justify-content: center">
	<form action="BoardReWriteProcController" method="POST">
		<table width="600" border="1" bordercolor="gray" bgcolor="beige">
			 <tr height="40">
				<td align="center" width="150"> <label for="writer">작성자</label></td>
				<td width="450"> <input type="text" name="writer" id="writer" size="70"></td>
			</tr>
			<tr height="40">
				<td align="center" width="150"> <label for="subject">제목</label></td>
				<td width="450"> <input type="text" name="subject" id="subject" size="70" value="답변: ${prevTitle } "></td>
			</tr>
			<tr height="40">
				<td align="center" width="150"> <label for="email">이메일</label></td>
				<td width="450"> <input type="email" name="email" id="email" size="70" ></td>
			</tr>
			<tr height="40">
				<td align="center" width="150"> <label for="password">비밀번호</label></td>
				<td width="450"> <input type="password" name="password" id="password" size="70" ></td>
			</tr>
			<tr height="40">
				<td align="center" width="150"> <label for="content">글내용</label></td>
				<td width="450"> <textarea name="content" id="content" rows="10" cols="60" ></textarea></td>
			</tr>
			
			<!-- form에서 사용자로부터 입력받지 않고 답글 관련 데이터를 넘길 수 있도록 hidden 처리 -->
			<tr height="40">
				<td align="center" colspan="2">
					<input type="hidden" name="ref" value="${ref }">
					<input type="hidden" name="re_step" value="${reStep }">
					<input type="hidden" name="re_level" value="${reLevel }">
					<input type="submit" value="저장">
					&nbsp;&nbsp;
					<input type="reset" value="초기화">
					&nbsp;&nbsp;
					<input type="button" value="취소" onclick="history.go(-1)">
					&nbsp;&nbsp;
					<input type="button" value="전체글보기" onclick="location.href='BoardListController'">
				</td>
			</tr>
		</table>
	</form>
</div>

</body>
</html>