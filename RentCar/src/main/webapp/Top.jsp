<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>

<!-- 세션을 이용한 로그인 처리 -->
	<%
		String id = (String)session.getAttribute("id");
	
		/* 로그인이 되어있지 않다면 */
		if(id==null){
			id="GUEST";
		}
	%>
	
	<table width="1000" border="1" bordercolor="white">
		<tr height="70">
			<td colspan="1" style="text-align: center">
				<img alt="" src="img/RENT.png" height="65">
			</td>
			<td colspan="3" />
			<td align="center"; height: "200">
				<%= id %> 님 반갑습니다.
			</td>
		</tr>
		<tr height="50">
			<td align="center" width="200" bgcolor="grey">
				<a href="#" style="text-decoration: none; color: white; font-size: 20px;">예 약 하 기</a></font>
			</td>	
			<td align="center" width="200" bgcolor="grey">
				<a href="#" style="text-decoration: none; color: white; font-size: 20px;">예 약 확 인</a></font>
			</td>
			<td align="center" width="200" bgcolor="grey">
				<a href="#" style="text-decoration: none; color: white; font-size: 20px;">자유 게시판</a></font>
			</td>
			<td align="center" width="200" bgcolor="grey">
				<a href="#" style="text-decoration: none; color: white; font-size: 20px;">이  벤  트</a></font>
			</td>
			<td align="center" width="200" bgcolor="grey">
				<a href="#" style="text-decoration: none; color: white; font-size: 20px;">고 객 센 터</a></font>
			</td>
		</tr>
	</table>

</body>
</html>