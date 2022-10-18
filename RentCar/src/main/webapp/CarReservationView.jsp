<%@page import="java.text.NumberFormat"%>
<%@page import="dto.CarViewBean"%>
<%@page import="java.time.LocalDate"%>
<%@page import="dto.CarReserveBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.RentCarDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>

<%
	request.setCharacterEncoding("UTF-8");
	String id = String.valueOf(session.getAttribute("id"));
	if(id == "null") {
%>
		<script>
			alert("로그인되어 있지 않습니다. 로그인 해주세요.")
			location.href="RentCarMain.jsp?center=MemberLogin.jsp";
		</script>
<%
	} else {
		RentCarDao rDao = new RentCarDao();
		String today = String.valueOf(LocalDate.now());
		ArrayList<CarViewBean> carReservationList =  rDao.getReservationList(id);
%>
		<div align="center">
			<table width="1000">
				<tr height="100" >
					<td align="center" colspan="11">
						<font size="6" color="grey"> 차량 예약 완료 화면 </font>
					</td>
				</tr>
				<tr height="40">
					<td width="150" align="center">차량 이미지</td>
					<td width="90" align="center">차량명</td>
					<td width="120" align="center">대여일</td>
					<td width="70" align="center">대여기간</td>
					<td width="130" align="center">금액 (1대/1일)</td>
					<td width="50" align="center">수량</td>
					<td width="50" align="center">보험</td>
					<td width="50" align="center">wifi</td>
					<td width="100" align="center">네비게이션<br>(무료)</td>
					<td width="100" align="center">베이비시트</td>
					<td width="150" align="center">총 금액</td>
					<td width="70" align="center">취소</td>
				</tr>
				
<%
		for(CarViewBean car : carReservationList){
			NumberFormat numberFormat = NumberFormat.getInstance();
%>
			<tr height="40">
				<td width="150" align="center">
					<img alt="<%= car.getName() %>" src="img/<%= car.getImg() %>" width="120" height="70">
				</td>
				<td align="center"><%= car.getName() %></td>
				<td align="center"><%= car.getDate() %></td>
				<td align="center"><%= car.getDuration() %></td>
				<td align="right" style="padding-right: 15px"><%= numberFormat.format(car.getPrice()) %> 원 </td>
				<td align="center"><%= car.getQty() %></td>
				<td align="center"><%= car.getAssurance() %></td>
				<td align="center"><%= car.getWifi() %></td>
				<td align="center"><%= car.getNavigation() %></td>
				<td align="center"><%= car.getBaby_seat() %></td>
				<td align="center"><%= numberFormat.format( (car.getDuration() * car.getQty() * car.getPrice()) + (10000 * car.getDuration() * car.getQty() * (car.getAssurance() + car.getWifi() + car.getBaby_seat())) ) %> 원</td>
				<td align="center"><input type="button" onClick="location.href='RentCarMain.jsp?center=CarReservationDelete.jsp?date=<%=car.getDate() %>'" value="삭제"></td>
			</tr>
<%
		}
	}
%>
		</table>
	</div>



</body>
</html>