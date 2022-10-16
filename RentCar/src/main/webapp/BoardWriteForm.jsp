<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>

	<h2 style="text-align: center"></h2>
	<div style="display: flex; justify-content: center">
		<form action="BoardWriteProc.jsp" method="GET">
			<table width="600" border="1" bordercolor="gray" bgcolor="skyblue">
				<tr height="40">
					<td align="center" widht="150" > <label for="writer">작성자</label></td>
					<td width="450"><input type="text" name="writer" id="writer" size="60"></td>
				</tr>
				<tr height="40">
					<td align="center" widht="150" > <label for="subject">제목</label></td>
					<td width="450"><input type="text" name="subject" id="subject" size="60"></td>
				</tr>
				<tr height="40">
					<td align="center" widht="150" > <label for="email">이메일</label></td>
					<td width="450"><input type="email" name="email" id="email" size="60"></td>
				</tr>
				<tr height="40">
					<td align="center" widht="150" > <label for="password">비밀번호</label></td>
					<td width="450"><input type="password" name="password" id="password" size="60"></td>
				</tr>
				<tr height="40">
					<td align="center" widht="150" > <label for="content">글 내용</label></td>
					<td width="450"><textarea rows="10" cols="50" name="content" id="content"></textarea></td>
				</tr>
				<tr height="40">
					<td align="center" colspan="2">
						<input type="submit" value="글쓰기"> &nbsp;&nbsp; 
						<input type="reset" value="다시 작성"> &nbsp;&nbsp;
						<input type="button" onClick="history.go(-1)" value="취소"> &nbsp;&nbsp;
						<button onclick="location.href='RentCarMain.jsp?center=BoardList.jsp'">전체 게시글 보기</button> 
					</td>
				</tr>
			</table>
		</form>
	</div>

</body>
</html>