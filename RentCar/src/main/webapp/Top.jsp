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
			<td colspan="1" style="text-align: center; cursor: pointer" onClick="location.href='RentCarMain.jsp'">
				<img alt="" src="img/RENT.png" height="65">
			</td>
			<td colspan="4" />
			<td align="center"; height: "200">
				<%= id %> 님
				<%
					if(id.equals("GUEST")){
				%>
				<button onClick="location.href='RentCarMain.jsp?center=MemberLogin.jsp'"> 로그인</button>
				<%
					} else {
				%>
				<button onClick="location.href='RentCarMain.jsp?center=MemberLogout.jsp'">로그아웃</button>
				<% 
					} 
				%>
			</td>
		</tr>
		<tr height="50">
			<td align="center" width="166.5" bgcolor="grey" id="td" onClick="location.href='RentCarMain.jsp'" style="cursor: pointer">
				<span style="color: white; font-size: 20px"> 메    인 </span>
			</td>
			<td align="center" width="166.5" bgcolor="grey" onClick="location.href='RentCarMain.jsp?center=CarReservation.jsp'" style="cursor: pointer">
				<span style="color: white; font-size: 20px;">예 약 하 기</span>
			</td>	
			<td align="center" width="166.5" bgcolor="grey" onClick="location.href='RentCarMain.jsp?center=CarReservationView.jsp'" style="cursor: pointer">
				<span style="color: white; font-size: 20px;">예 약 확 인</span>
			</td>
			<td align="center" width="166.5" bgcolor="grey" onClick="location.href='RentCarMain.jsp?center=BoardList.jsp'" style="cursor: pointer">
				<span style="color: white; font-size: 20px;">자유 게시판</span>
			</td>
			<td align="center" width="166.5" bgcolor="grey" onClick="location.href=''" style="cursor: pointer">
				<span style="color: white; font-size: 20px;">이  벤  트</span>
			</td>
			<td align="center" width="166.5" bgcolor="grey" onClick="location.href=''" style="cursor: pointer">
				<span style="color: white; font-size: 20px;">고 객 센 터</span>
			</td>
		</tr>
	</table>

</body>
</html>