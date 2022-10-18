<%@page import="java.text.NumberFormat"%>
<%@page import="dto.CarListBean"%>
<%@page import="dao.RentCarDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>

<%
request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="rBean" class="dto.CarReserveBean">
	<jsp:setProperty name="rBean" property="*" />
</jsp:useBean>

<%
	String id = (String)session.getAttribute("id");
	if(id == null){
%>
	<script>
		alert("로그인 후 예약이 가능 합니다.");
		location.href="RentCarMain.jsp?center=MemberLogin.jsp";
	</script>
<%
	}
	
	LocalDate date1 = LocalDate.parse(rBean.getDate());
	LocalDate date2 = LocalDate.now();
	
	int compare = date1.compareTo(date2);
	if(compare <1){
%>
	<script>
		alert("현재 날짜와 동일하거나 이전의 날짜를 선택할 수 없습니다.");
		history.go(-1);
	</script>
<%
	} else {
	
		rBean.setId(id);
		RentCarDao rDao = new RentCarDao();
		rDao.setReserveCar(rBean);
		NumberFormat numberFormat = NumberFormat.getInstance();
		
		CarListBean cBean = rDao.getCarInfo(rBean.getNo());
		int carPrice = cBean.getPrice() * rBean.getQty() * rBean.getDuration();
		
		int assurance = rBean.getAssurance() == 1 ? 10000 : 0;
		int babySeat = rBean.getBaby_seat() == 1 ? 10000 : 0;
		int wifi = rBean.getWifi() == 1 ? 10000 : 0;
		int optionPrice = (assurance + babySeat + wifi) * rBean.getQty() * rBean.getDuration();
		int totalPrice = carPrice + optionPrice;
%>

		<div align="center">
			<table width="1000">
				<tr height="100">
					<td align="center">
						<font size="6" color="grey"> 차량 예약 완료 화면 </font>
					</td>
				</tr>
				<tr height="100">
					<td align="center">
						<img alt="" src="img/<%= cBean.getImg() %>" width="470">
					</td>
				</tr>
				<tr height="50">
					<td align="center">
						<font size="5" color="red"> 차량 예약 금액 <%= numberFormat.format(carPrice) %> 원 </font>
					</td>
				</tr>
				<tr height="50">
					<td align="center">
						<font size="5" color="red"> 옵션 금액 <%= numberFormat.format(optionPrice) %> 원 </font>
					</td>
				</tr>
				<tr height="50">
					<td align="center">
						<font size="5" color="red"><b> 총 예약 금액 <%= numberFormat.format(totalPrice) %> 원</b></font>
					</td>
				</tr>
			</table>
		</div>
<%
	}
%>
<div align="center">
</div>

</body>
</html>